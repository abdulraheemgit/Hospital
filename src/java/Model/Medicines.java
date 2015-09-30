package Model;

import Beans.DbConn;
import Beans.Medicine;
import Beans.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Medicines {

    DbConn conn;
    ResultSet rs;
    PreparedStatement pstmt;
    Statement stmt;

    public Medicine AddMedicine(Medicine medicine) {

        Medicine medicine1 = new Medicine();
        conn = new DbConn();
        conn.connectDB();

        String sql = "INSERT INTO tblmedicine(name,dosage) values(?,?)";
        try {
            System.out.println(medicine.getDosage());
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, medicine.getMedicine());
            pstmt.setString(2, medicine.getDosage());
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
    
    public Medicine EditMedicine(Medicine medicine) {

        Medicine medicine1 = new Medicine();
        conn = new DbConn();
        conn.connectDB();

        String sql = "UPDATE tblmedicine set name = ?, dosage = ? where medicineid = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, medicine.getMedicine());
            pstmt.setString(2, medicine.getDosage());
            pstmt.setString(3, medicine.getMedicineId());
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
    
    public Medicine DeleteMedicine(Medicine medicine) {

        Medicine medicine1 = new Medicine();
        conn = new DbConn();
        conn.connectDB();

        String sql = "DELETE  from tblmedicine where medicineid = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, medicine.getMedicineId());
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

    public List<Medicine> GetMedicines() {

        List<Medicine> medicines = new ArrayList<>();
        conn = new DbConn();
        conn.connectDB();
        String sql = "SELECT * From tblmedicine";
        try {
            stmt = conn.conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Medicine medicine = new Medicine();
                medicine.setMedicineId(rs.getString(1));
                medicine.setMedicine(rs.getString(2));
                medicine.setDosage(rs.getString(3));
                medicines.add(medicine);
            }
            conn.closeDB();
            return medicines;
        } catch (SQLException ex) {
            Medicine medicine = new Medicine();
            System.out.println("Error in Retriving Medicine " +ex.getMessage());
            medicine.setError("Error in Retriving Medicine");
            medicines.add(medicine);
            conn.closeDB();
            return medicines;
        }
    }
    public static void main(String[] args) {
        List<Medicine> medicine = new ArrayList<>();
        Medicines medicines = new Medicines();
        medicine = medicines.GetMedicines();
        for (Medicine medicine1 : medicine) {
            String s = medicine1.getMedicine();
            System.out.println(s);
        }
    }
}
