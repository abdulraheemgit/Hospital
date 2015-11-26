package Model;

import Beans.DbConn;
//import Beans.Medicine;
import Beans.InPatient;
import Beans.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Admit {

    DbConn conn;
    ResultSet rs;
    PreparedStatement pstmt;
    Statement stmt;

    public InPatient AddMedicine(InPatient medicine) {

        InPatient medicine1 = new InPatient();
        conn = new DbConn();
        conn.connectDB();

        String sql = "INSERT INTO tbloutpatient(patientid_fk,dateadmitted) values(?,?)";
        try {
            System.out.println(medicine.getDateAdmitted());
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, medicine.getPatientId());
            pstmt.setString(2, medicine.getDateAdmitted());
            medicine1.setSuccess(String.valueOf(pstmt.executeUpdate()));
            conn.closeDB();
            return medicine1;
        } catch (SQLException ex) {
            System.out.println("Error in AddMedicine " + ex.getMessage());
            medicine1.setError("Error in Adding Medicine");
            conn.closeDB();
            return medicine1;
        }
    }
    
    public InPatient EditMedicine(InPatient medicine) {

        InPatient medicine1 = new InPatient();
        conn = new DbConn();
        conn.connectDB();

        String sql = "UPDATE tbloutpatient set patientid_fk = ?, datedmitted = ? where medicineid = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, medicine.getPatientId());
            pstmt.setString(2, medicine.getDateAdmitted());
            pstmt.setString(3, medicine.getInPatientId());
            medicine1.setSuccess(String.valueOf(pstmt.executeUpdate()));
            conn.closeDB();
            return medicine1;
        } catch (SQLException ex) {
            System.out.println("Error in AddMedicine " + ex.getMessage());
            medicine1.setError("Error in Adding Medicine");
            conn.closeDB();
            return medicine1;
        }
    }
    
    public InPatient DeleteMedicine(InPatient medicine) {

        InPatient medicine1 = new InPatient();
        conn = new DbConn();
        conn.connectDB();

        String sql = "DELETE  from tbloutpatient where outpatientid = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, medicine.getInPatientId());
            medicine1.setSuccess(String.valueOf(pstmt.executeUpdate()));
            conn.closeDB();
            return medicine1;
        } catch (SQLException ex) {
            System.out.println("Error in AddMedicine " + ex.getMessage());
            medicine1.setError("Error in Adding Medicine");
            conn.closeDB();
            return medicine1;
        }
    }

    public List<InPatient> GetMedicines1() {

        List<InPatient> medicines = new ArrayList<>();
        conn = new DbConn();
        conn.connectDB();
        String sql = "SELECT * From tbloutpatient";
        try {
            stmt = conn.conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                InPatient medicine = new InPatient();
                medicine.setInPatientId(rs.getString(1));
                medicine.setPatientId(rs.getString(2));
                medicine.setDateAdmitted(rs.getString(3));
                medicines.add(medicine);
            }
            conn.closeDB();
            return medicines;
        } catch (SQLException ex) {
            InPatient medicine = new InPatient();
            System.out.println("Error in Retriving Medicine " +ex.getMessage());
            medicine.setError("Error in Retriving Medicine");
            medicines.add(medicine);
            conn.closeDB();
            return medicines;
        }
    }
    public static void main(String[] args) {
        List<InPatient> medicine = new ArrayList<>();
        Admit medicines = new Admit();
        medicine = medicines.GetMedicines1();
        for (InPatient medicine1 : medicine) {
            String s = medicine1.getPatientId();
            System.out.println(s);
        }
    }
}
