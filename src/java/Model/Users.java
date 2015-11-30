/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Beans.Contact;
import Beans.DbConn;
import Beans.User;
import Beans.UserType;
import static java.lang.Integer.parseInt;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Users {

    DbConn conn;
    ResultSet rs;
    PreparedStatement pstmt;
    Statement stmt;

    //AR
    //Login
    public User checkLogin(String username, String password) {

        User user = new User();
        conn = new DbConn();
        conn.connectDB();
        String sql = "Select userid From tblusers where username = ? AND password = MD5(?)";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            System.out.println(pstmt);
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

    //Retrive user by id 
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
                user1.setUsername(rs.getString("username"));
                user1.setEmail(rs.getString("email"));
                user1.setSignUpDate(rs.getString("signupdate").toString());
                user1.setfName(rs.getString("fname"));
                user1.setlName(rs.getString("lname"));
                user1.setNic(rs.getString("nic"));
                user1.setGender(rs.getString("gender"));
                user1.setAddress1(rs.getString("address1"));
                user1.setAddress2(rs.getString("address2"));
                user1.setAddress3(rs.getString("address3"));
                user1.setTypeId(rs.getString("type_fk"));
                user1.setPatientId(rs.getString("patientid_fk"));
                user1.setDoctorId(rs.getString("doctorid_fk"));
                user1.setFound("1");
                Contact contact = new Contact();
                System.out.println(user.getUserID());
                user1.setContacts(contact.GetContacts(user));

            } else {
                user1.setFound("0");
            }
            conn.closeDB();
            return user1;
        } catch (SQLException ex) {
            System.out.println("users.checkLogin " + ex.getMessage());
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
        for (UserType s : type) {
            System.out.println(s.getCount());
        }

    }

    //Check username availability
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
        String sql = "INSERT INTO tblusers (username, password, email, signupdate, fname, lname, nic, gender, address1, "
                + "address2, address3, type_fk)VALUES (?, MD5(?), ?, NOW(), ?, ?, ?, ?, ?, ?, ?, ?);";
        String sql2 = "INSERT INTO tbldoctor (specialization_fk, type)VALUES (?,?)";

        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, u.getUsername());
            pstmt.setString(2, u.getPassword());
            pstmt.setString(3, u.getEmail());
            pstmt.setString(4, u.getfName());
            pstmt.setString(5, u.getlName());
            pstmt.setString(6, u.getNic());
            pstmt.setString(7, u.getGender());
            pstmt.setString(8, u.getAddress1());
            pstmt.setString(9, u.getAddress2());
            pstmt.setString(10, u.getAddress3());
            pstmt.setString(11, u.getTypeId());

            System.out.println(pstmt);
            int d = 0;
            int i = pstmt.executeUpdate();
            if (u.getTypeId().equals("2")) {
                PreparedStatement pstmt2 = conn.conn.prepareStatement(sql2);
                pstmt2.setString(12, u.getDoctor1().getSpecializationId());
                pstmt2.setString(13, u.getDoctor1().getType());
                d = pstmt2.executeUpdate();
            }

            if (i == 1 && d == 1) {
                i = InsertDoctorQualification(u);
            }
            success = String.valueOf(i);
            user.setSuccess(success);
            conn.closeDB();
            return user;
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return user;
        }
    }

    public int InsertDoctorQualification(User u) {

        conn = new DbConn();
        conn.connectDB();
        String sql = "Select doctorid from tbldoctor ORDER BY doctorid DESC LIMIT 1";
        String sql2 = "INSERT INTO tbldoctorqualification (type)VALUES (?)";
        String doctorId = "";
        int i = 0;
        try {
            stmt = conn.conn.createStatement();
            pstmt = conn.conn.prepareStatement(sql2);

            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                doctorId = rs.getString(1);
            }
            pstmt.setString(1, doctorId);
            i = pstmt.executeUpdate();
            conn.closeDB();
            return i;
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return i;
        }
    }

    public List<UserType> UserTypeCount() {
        conn = new DbConn();
        conn.connectDB();

        List<UserType> typeCount = new ArrayList();

        String sql = "SELECT ut.id,count(u.userid) as ucount, ut.type FROM tblusertype ut  left join `tblusers` u on u.type_fk = ut.id group by ut.id";
        try {
            stmt = conn.conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                UserType userType = new UserType();
                userType.setUserTypeId(rs.getString(1));
                userType.setCount(rs.getString(2));
                userType.setUserType(rs.getString(3));
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
    //AR end

    public ResultSet getAllUsers() {
        conn = new DbConn();
        conn.connectDB();
        //Doctor Doctor=new Doctor();
        String sql = "SELECT u.*,tblusertype.type FROM tblusers u INNER JOIN tblusertype ON tblusertype.id=tblusers.type_fk ";
        try {
            pstmt = conn.conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

        } catch (SQLException ex) {

            conn.closeDB();

        }
        return rs;
    }

    public User removeUser(User findUser) {
        User user = new User();
        conn = new DbConn();
        conn.connectDB();
        //user=findUser;
        String userId = findUser.getUserID();
        String sql = "DELETE  from tblusers where userid = ?";;
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, findUser.getUserID());
            pstmt.executeQuery();
            conn.closeDB();
            return user;//methanin return karanna ona del unada nadda kiyala
        } catch (Exception e) {
            conn.closeDB();
            return user;
        }
        //conn.closeDB();
    }

    public User registerUser(User u) {
        conn = new DbConn();
        conn.connectDB();
        Users users = new Users();
        User user = new User();
        Contact contact = new Contact();
        String success = "";
        String sql = "INSERT INTO tblusers (username, password, email, signupdate, fname, lname, gender, address1, "
                + "address2, address3, type_fk,validId,brithday)VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        System.out.println(sql);
        String sql1 = "INSERT INTO tblcontacts (contactNo,user_fk) VALUES(?,?)";
        try {

            String a = "abd";
            pstmt = conn.conn.prepareStatement(sql);
            PreparedStatement pstmt1 = conn.conn.prepareStatement(sql1);

            pstmt.setString(1, u.getUsername());
            pstmt.setString(2, u.getValidId());
            pstmt.setString(3, u.getEmail());
            // pstmt.setString(4,"now()");// nooooooooooooooooo
            pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            pstmt.setString(5, u.getfName());
            pstmt.setString(6, u.getlName());
            pstmt.setString(7, u.getGender());
            pstmt.setString(8, u.getAddress1());
            pstmt.setString(9, u.getAddress2());
            pstmt.setString(10, u.getAddress3());
            pstmt.setInt(11, parseInt(u.getTypeId()));
            pstmt.setString(12, u.getValidId());
            pstmt.setString(13, u.getBday());

            pstmt.executeUpdate();

            //  pstmt1.setInt(1,Integer(u.getContacts().get(0)));
            int i;
            for (i = 0; i < 2; i++) {
                contact = u.getContacts().get(i);
                if (!contact.getContactNo().isEmpty()) {
                    pstmt1.setString(1, contact.getContactNo());
                    pstmt1.setInt(2, (users.GetLastUserId()));
                    pstmt1.executeUpdate();
                    //  pstmt1.setInt(2,22);
                } else {
                    //pstmt1.executeUpdate();
                }
            }
            //  user.setSuccess(success);
            conn.closeDB();
            return user;
        } catch (SQLException ex) {
            System.out.println("error");
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return user;
        }
    }

    public int GetLastUserId() {
        User user1 = new User();
        conn = new DbConn();
        conn.connectDB();
        User user = new User();
        String sql = "SELECT userid FROM tblusers ORDER BY userid DESC LIMIT 1";
        try {
            stmt = conn.conn.createStatement();

            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                user.setUserID(rs.getString(1));
            }
            return (Integer.parseInt(user.getUserID()));
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            return (Integer.parseInt(user.getUserID()));
        }
    }

}
