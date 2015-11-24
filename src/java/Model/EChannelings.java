package Model;

import Beans.DbConn;
import Beans.DoctorTime;
import Beans.EChanneling;
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
        String[] searchInputs = new String[4];
        searchInputs[0] = "a";
        e.searchDoctor(searchInputs);
    }

    public User viewDoctor(User u) {

        conn = new DbConn();
        conn.connectDB();
        User user = new User();
        String sql = "select u.userid, u.fname, u.lname, u.gender, s.specialization, s.description,d.doctorid, d.doctornote "
                + " from tbldoctor d"
                + " left join tblusers u on d.doctorid = u.doctorid_fk"
                + " left join tblspecialization s on d.specialization_fk = s.id"
                + " where d.doctorid = ? ";
        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+u.getDoctorId());
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, u.getDoctorId());
            System.out.println("sssssssssssssssssssssssssssssssssssssssssssssssssssss"+pstmt);
            rs = pstmt.executeQuery();
            
            rs.next();
            user.setUserID(rs.getString(1));
            user.setfName(rs.getString(2));
            user.setlName(rs.getString(3));
            user.setGender(rs.getString(4));
            user.setSpecialization(rs.getString(5));
            user.setSpecialDesc(rs.getString(6));
            user.setDoctorId(rs.getString(7));
            user.setDoctorNote(rs.getString(8));
            
            conn.closeDB();
            return user;
        } catch (SQLException ex) {
            Logger.getLogger(EChannelings.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return user;
        }
    }

    //edit this
    public List<DoctorTime> doctorSessions(User u) {

        conn = new DbConn();
        conn.connectDB();
        List<DoctorTime> sessions = new ArrayList();
        String sql = "{call doctorsessions(?)}";
        try {
            cstmt = conn.conn.prepareCall(sql);
            cstmt.setString(1, u.getDoctorId());
            rs = cstmt.executeQuery();
            int a, b;
            String time,min,min1,min2,nextSession;
            while (rs.next()) {
                DoctorTime dt = new DoctorTime();
                dt.setDoctorId(rs.getString("doctorid"));
                dt.setDate(rs.getString("date"));
                dt.setDayId(rs.getString("day_fk"));
                dt.setDay(rs.getString("day"));
                a = rs.getInt("sessions");
                b = rs.getInt("apointments");
                dt.setAppointments(String.valueOf(b));
                if (a <= b) {
                    dt.setStatus("Full");
                }
                if (a > b) {
                    dt.setStatus("Available");
                }
                dt.setTimeFrom(rs.getString("timefrom"));
                dt.setTimeTo(rs.getString("timeto"));
                min = rs.getString("mins");
                time = rs.getString("sessiontime");
                min1 = time.substring(time.length()-2,time.length());
                if(min.equals("0")){
                    min2 = time;
                    dt.setNextSession(time);
                }else{
                    min2 = String.valueOf(Integer.parseInt(min1)+Integer.parseInt(min));
                    time = time.substring(0,time.length()-2);
                    dt.setNextSession(time+min2);
                }
                
                
                System.out.println("time "+time+min2);
                
                sessions.add(dt);
            }
            conn.closeDB();
            return sessions;
        } catch (SQLException ex) {
            Logger.getLogger(EChannelings.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return sessions;
        }
    }

    public List<User> searchDoctor(String[] searchInputs) {
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
            while (rs.next()) {
                User u = new User();
                u.setUserID(rs.getString(1));
                u.setfName(rs.getString(2));
                u.setlName(rs.getString(3));
                u.setGender(rs.getString(4));
                u.setDoctorId(rs.getString(5));
                u.setDoctorNote(rs.getString(6));
                u.setSpecialization(rs.getString(7));
                u.setSpecialDesc(rs.getString(8));
                doctors.add(u);
            }
            conn.closeDB();
            return doctors;
        } catch (SQLException ex) {
            Logger.getLogger(EChannelings.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return doctors;
        }
    }

    public List<Specialization> getSpecialization() {
        conn = new DbConn();
        conn.connectDB();
        List<Specialization> specializations = new ArrayList();
        String sql = "select * from tblspecialization";
        try {
            stmt = conn.conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
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
            conn.closeDB();
            return specializations;
        }
    }

    public List<Time> getTimes() {
        conn = new DbConn();
        conn.connectDB();
        List<Time> times = new ArrayList();
        String sql = "select * from tbltime";
        try {
            stmt = conn.conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Time t = new Time();
                t.setTimeId(rs.getString(1));
                t.setTime(rs.getString(2));
                times.add(t);
            }
            conn.closeDB();
            return times;
        } catch (SQLException ex) {
            Logger.getLogger(EChannelings.class.getName()).log(Level.SEVERE, null, ex);
            conn.closeDB();
            return times;
        }
    }

    public EChanneling makeAppointment(EChanneling ch) {
        
            conn = new DbConn();
            conn.connectDB();
            EChanneling ec = new EChanneling();
            
            String sql =    "INSERT INTO tblechanneling (patientfname,patientlname,applieddate,contactno,"
                    +   "doctorid_fk,patientid_fk,time,dayid_fk,date,nic,notes) values(?,?,NOW(),?,?,?,?,?,?,?,?)";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, ch.getPatientFName());
            pstmt.setString(2, ch.getPatientLName());
            pstmt.setString(3, ch.getContactNo());
            pstmt.setString(4, ch.getDoctorId());
            pstmt.setString(5, ch.getPatientId());
            pstmt.setString(6, ch.getTime());
            pstmt.setString(7, ch.getDayId());
            pstmt.setString(8, ch.getDate());
            pstmt.setString(9, ch.getNic());
            pstmt.setString(10, ch.getNotes());
            System.out.println(pstmt);
            int r = pstmt.executeUpdate();
            ec.setSuccess(String.valueOf(r));
            return ec;
        } catch (SQLException ex) {
            Logger.getLogger(EChannelings.class.getName()).log(Level.SEVERE, null, ex);
            ec.setSuccess("0");
            return ec;
        }
    }
}
