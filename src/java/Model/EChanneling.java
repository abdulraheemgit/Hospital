package Model;

import Beans.DbConn;
import Beans.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EChanneling {
    DbConn conn;
    ResultSet rs;
    PreparedStatement pstmt;
    Statement stmt;
    
    public List<User> searchDoctor(String[] searchInputs){
        List<User> doctors = new ArrayList();
        
        return doctors;
    }
}
