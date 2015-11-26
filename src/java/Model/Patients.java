/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Beans.DbConn;
import Beans.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Anobiya
 */
public class Patients {
    DbConn conn;
    ResultSet rs;
    PreparedStatement pstmt;
    Statement stmt;
    
    public User getUserByname(User user) {
        User user1 = new User();
        conn = new DbConn();
        conn.connectDB();
        String sql = "Select * From tblusers where username = ? and type_fk = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, "4");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user1.setUserID(user.getUserID());
                user1.setUsername(rs.getString(2));
                user1.setEmail(rs.getString(4));
                user1.setSignUpDate(String.valueOf(rs.getDate(5)));
                user1.setfName(rs.getString(6));
                user1.setlName(rs.getString(7));
                user1.setGender(rs.getString(8));
                user1.setAddress1(rs.getString(9));
                user1.setAddress2(rs.getString(10));
                user1.setAddress3(rs.getString(11));
                user1.setTypeId(rs.getString(12));
                user1.setPatientId(rs.getString(14));
                user1.setDoctorId(rs.getString(15));
                user1.setFound("1");
            }else {
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

    public boolean EditPatients(String email, String password, String patientid) {
        conn = new DbConn();
        conn.connectDB();
        String sql = "UPDATE tblusers set email = ?, password = ? where username = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, patientid);
            pstmt.executeUpdate();
            conn.closeDB();
            return true;
        } catch (SQLException ex) {
            System.out.println("" + ex.getMessage());
            conn.closeDB();
            return false;
        }
    }
    
    public boolean emailValidation(String email){
        String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        String email1 = email;
        Boolean b = email1.matches(EMAIL_REGEX);
        return b;
    }
    
    public boolean passwordValidation(String password, String confpassword){
        if(password.equals(confpassword) == true){
            return true;
        }
        else{
            return false;
        }
    }
}
