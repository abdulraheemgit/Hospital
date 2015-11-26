/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Beans.DbConn;
import Beans.Madication;
import Beans.PatientMedicine;
import Beans.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PharmacistFunctions {

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
            pstmt.setString(2, "3");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user1.setUserID(user.getUserID());
                user1.setUsername(rs.getString(2));
                user1.setEmail(rs.getString(4));
//                user1.setSignUpDate(String.valueOf(rs.getDate(5)));
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
//                Contact contact = new Contact();                
//                user1.setContacts(contact.GetContacts(user));

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

    public List<Madication> getUserMedications(String patient) {
        List<Madication> medications = new ArrayList<Madication>();
        conn = new DbConn();
        conn.connectDB();

        String sql = "Select * From tblmadication where patientid_fk = ? And status = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, patient);
            pstmt.setString(2, "Not Issued");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Madication medication = new Madication();
                medication.setMadicationId(rs.getString(1));
                medication.setPatientId(rs.getString(2));
                medication.setDoctorId(rs.getString(3));
                medication.setDateGiven(rs.getString(4));
                medication.setStatus(rs.getString(6));
                medications.add(medication);
            }
            conn.closeDB();
            return medications;
        } catch (SQLException ex) {
            Madication medication = new Madication();
            System.out.println("Error in Retriving Medications " + ex.getMessage());
            medication.setError("Error in Retriving Medications");
            medications.add(medication);
            conn.closeDB();
            return medications;
        }
    }

    public List<Madication> getAllMedications() {
        List<Madication> medications = new ArrayList<Madication>();
        conn = new DbConn();
        conn.connectDB();

        String sql = "Select * From tblmadication where status = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, "Not Issued");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Madication medication = new Madication();
                medication.setMadicationId(rs.getString(1));
                medication.setPatientId(rs.getString(2));
                medication.setDoctorId(rs.getString(3));
                medication.setDateGiven(rs.getString(4));
                medication.setStatus(rs.getString(6));
                medications.add(medication);
            }
            conn.closeDB();
            return medications;
        } catch (SQLException ex) {
            Madication medication = new Madication();
            System.out.println("Error in Retriving Medications " + ex.getMessage());
            medication.setError("Error in Retriving Medications");
            medications.add(medication);
            conn.closeDB();
            return medications;
        }
    }
    
    
    public List<Madication> getMedicationsHistory(String patient) {
        List<Madication> medications = new ArrayList<Madication>();
        conn = new DbConn();
        conn.connectDB();

        String sql = "Select * From tblmadication where patientid_fk = ? AND status = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, patient);
            pstmt.setString(2, "Issued");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Madication medication = new Madication();
                medication.setMadicationId(rs.getString(1));
                medication.setPatientId(rs.getString(2));
                medication.setDoctorId(rs.getString(3));
                medication.setDateGiven(rs.getString(4));
                medication.setIssuedDate(rs.getString(5));
                medication.setStatus(rs.getString(6));
                medications.add(medication);
            }
            conn.closeDB();
            return medications;
        } catch (SQLException ex) {
            Madication medication = new Madication();
            System.out.println("Error in Retriving Medications " + ex.getMessage());
            medication.setError("Error in Retriving Medications");
            medications.add(medication);
            conn.closeDB();
            return medications;
        }
    } 


    public boolean checkPatientId(String username) {

        boolean available = false;
        conn = new DbConn();
        conn.connectDB();
        String sql = "Select * From tblmadication where patientid_fk = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next() == true) {
                available = true;
            } else {
                available = false;
            }
            conn.closeDB();
            return available;
        } catch (SQLException ex) {
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return available;
        }
    }

    public Madication EditMedication(int medicationid) {

        Madication medication1 = new Madication();
        conn = new DbConn();
        conn.connectDB();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String sql = "UPDATE tblmadication set status = ?, issuedDate = ? where medicationid = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, "Issued");
            pstmt.setString(2, dateFormat.format(date));
            pstmt.setInt(3, medicationid);
            pstmt.executeUpdate();
            conn.closeDB();
            return medication1;
        } catch (SQLException ex) {
            System.out.println("Error in Issuing Medication " + ex.getMessage());
            medication1.setError("Error in Issuing Medication ");
            conn.closeDB();
            return medication1;
        }
    }
    
    
    public boolean EditPharmacists(String email, String password, String pharmacistid) {
        conn = new DbConn();
        conn.connectDB();
        String sql = "UPDATE tblusers set email = ?, password = ? where username = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, pharmacistid);
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
    
    public boolean contactNumberValidation(String contactnumber){
        int length;
        length = contactnumber.length();
        if(length == 10){
            return true;
        }
        else{
            return false;
        }
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
