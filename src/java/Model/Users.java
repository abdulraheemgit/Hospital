/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Beans.Contact;
import Beans.User;
import Beans.DbConn;
import Beans.UserType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Users {

    DbConn conn;
    ResultSet rs;
    PreparedStatement pstmt;
    Statement stmt;

    public User checkLogin(String username, String password) {

        User user = new User();
        conn = new DbConn();
        conn.connectDB();
        String sql = "Select userid From tblusers where username = ? AND password = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                Users users = new Users();
                user.setUserID(rs.getString(1));
                user = users.getUserById(user);
               
            } else {
                user.setFound("0");
            }
            conn.closeDB();
            return user;
        } catch (SQLException ex) {
            System.out.println("users.checkLogi " + ex.getMessage());
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            user.setError("error");
            conn.closeDB();
            return user;
        }
    }

    public User getUserById(User user) {
        User user1 = new User();
        conn = new DbConn();
        conn.connectDB();
        String sql = "Select * From tblusers where userid = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, user.getUserID());
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user1.setUserID(user.getUserID());
                user1.setUsername(rs.getString(2));
                user1.setEmail(rs.getString(2));
                user1.setSignUpDate(rs.getString(2));
                user1.setfName(rs.getString(2));
                user1.setlName(rs.getString(2));
                user1.setGender(rs.getString(2));
                user1.setAddress1(rs.getString(2));
                user1.setAddress2(rs.getString(2));
                user1.setAddress3(rs.getString(2));
                user1.setTypeId(rs.getString(2));
                user1.setPatientId(rs.getString(2));
                user1.setDoctorId(rs.getString(2));
                user1.setFound("1");                
                Contact contact = new Contact();                
                user1.setContacts(contact.GetContacts(user));
                
            } else {
                user1.setFound("0");
            }
            conn.closeDB();
            return user1;
        } catch (SQLException ex) {
            System.out.println("users.checkLogi " + ex.getMessage());
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            user1.setError("error in retrieving users");
            conn.closeDB();
            return user1;
        }
        
    }

    
    
    public static void main(String[] args) {
        Users users = new Users();
        User user = new User();

        List<UserType> type = users.UserTypeCount();
        for(UserType s : type){
            System.out.println(s.getCount());
        }
        
    }

    public int checkUsername(String username) {

        int available = 0;
        conn = new DbConn();
        conn.connectDB();
        String sql = "Select * From tblusers where username = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next() == true) {
                available = 0;
            } else {
                available = 1;
            }
            conn.closeDB();
            return available;
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return available;
        }
    }

    public User signup(User u) {
        conn = new DbConn();
        conn.connectDB();
        User user = new User();
        String success = "";
        String sql = "INSERT INTO tblusers (username, password, email, signupdate, fname, lname, gender, address1, "
                   + "address2, address3, type_fk)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        System.out.println(sql);
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, u.getUsername());
            pstmt.setString(2, u.getPassword());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, "now()");
            pstmt.setString(5, u.getfName());
            pstmt.setString(6, u.getlName());
            pstmt.setString(7, u.getGender());
            pstmt.setString(8, u.getAddress1());
            pstmt.setString(9, u.getAddress2());
            pstmt.setString(10, u.getAddress3());
            pstmt.setString(11, u.getTypeId());
            success = String.valueOf(pstmt.executeUpdate());
            user.setSuccess(success);
            conn.closeDB();
            return user;
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return user;
        }
    }
    
    public List<UserType> UserTypeCount(){
        conn = new DbConn();
        conn.connectDB();
        
        List<UserType> typeCount = new ArrayList();
        
        String sql = "SELECT type_fk,count(userid) as ucount FROM `tblusers` group by type_fk";
        try {
            stmt = conn.conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {           
                UserType userType = new UserType();
                userType.setUserTypeId(rs.getString(1));
                userType.setCount(rs.getString(2));
                typeCount.add(userType);
            }
            conn.closeDB();
            return typeCount;
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return typeCount;
        }
    }
}
