
package Beans;

import Model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Contact {
    
    DbConn conn;
    ResultSet rs;
    PreparedStatement pstmt;
    Statement stmt;
    
    private String userId = "";
    private String contactNo = "";    
    private String error = "";
    
    public List<Contact> GetContacts(User u){
        List<Contact> contacts = new ArrayList<>();
        conn = new DbConn();
        conn.connectDB();
        String sql = "Select * From tblcontacts where userid_fk=?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, u.getUserID());
            rs = pstmt.executeQuery();
            
            while (rs.next()) {  
                Contact contact = new Contact();
                contact.setUserId(u.getUserID());
                contact.setContactNo(rs.getString("contactno"));
                contacts.add(contact);
            } 
            conn.closeDB();
            return contacts;
        } catch (SQLException ex) {
            System.out.println("users.getcontacts " + ex.getMessage());
            Logger.getLogger(Users.class.getName()).log(Level.SEVERE, null, ex);
            Contact contact = new Contact();
            contact.setError("error in retrieving contacts");
            contacts.add(contact);
            conn.closeDB();
            return contacts;
        }
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    
}
