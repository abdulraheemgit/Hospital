package Model;

import Beans.DbConn;
import Beans.Specialization;
import Beans.Time;
import Beans.User;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EChannelings {
    DbConn conn;
    ResultSet rs;
    PreparedStatement pstmt;
    Statement stmt;
    CallableStatement cstmt;
    
    public static void main(String[] args) {
        EChannelings e = new EChannelings();
        String [] searchInputs = new String[4];
        searchInputs[0] = "a";
        e.searchDoctor(searchInputs);
    }
    
    public List<User> searchDoctor(String[] searchInputs){
            conn = new DbConn();
            conn.connectDB();
            List<User> doctors = new ArrayList();
            String sql = "{call searchdoctors(?,?,?,?)}";
        try {
            cstmt = conn.conn.prepareCall(sql);
            cstmt.setString(1, searchInputs[0]);
            cstmt.setString(2, searchInputs[1]);
            cstmt.setString(3, searchInputs[2]);
            cstmt.setString(4, searchInputs[3]);
            rs = cstmt.executeQuery();
            while(rs.next()){
                User u = new User();
                u.setUserID(rs.getString(1));
                u.setfName(rs.getString(2));
                u.setlName(rs.getString(3));
                u.setDoctorId(rs.getString(4));
                u.setDoctorNote(rs.getString(5));
                u.setSpecialization(rs.getString(6));
                u.setSpecialDesc(rs.getString(7));
                doctors.add(u);
            }
            return doctors;
        } catch (SQLException ex) {
            Logger.getLogger(EChannelings.class.getName()).log(Level.SEVERE, null, ex);
            return doctors;
        }
    }
    
    public List<Specialization> getSpecialization(){
            conn = new DbConn();
            conn.connectDB();
            List<Specialization> specializations = new ArrayList();
            String sql = "select * from tblspecialization";
        try {
            stmt = conn.conn.createStatement();
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                Specialization s = new Specialization();
                s.setId(rs.getString(1));
                s.setSpecialization(rs.getString(2));
                s.setDescription(rs.getString(3));
                specializations.add(s);
            }
            conn.closeDB();
            return specializations;
        } catch (SQLException ex) {
            Logger.getLogger(EChannelings.class.getName()).log(Level.SEVERE, null, ex);
            return specializations;
        }
    }
    
    public List<Time> getTimes(){
            conn = new DbConn();
            conn.connectDB();
            List<Time> times = new ArrayList();
            String sql = "select * from tbltime";
        try {
            stmt = conn.conn.createStatement();
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                Time t = new Time();
                t.setTimeId(rs.getString(1));
                t.setTime(rs.getString(2));
                times.add(t);
            }
            conn.closeDB();
            return times;
        } catch (SQLException ex) {
            Logger.getLogger(EChannelings.class.getName()).log(Level.SEVERE, null, ex);
            return times;
        }
    }
}
