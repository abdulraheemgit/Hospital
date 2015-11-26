/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Beans.DbConn;
import Beans.Test;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Anobiya
 */
public class Tests {
    DbConn conn;
    ResultSet rs;
    PreparedStatement pstmt;
    Statement stmt;

    public Test AddTest(Test test) {

        Test test1 = new Test();
        conn = new DbConn();
        conn.connectDB();

        String sql = "INSERT INTO tbltests(testname) values(?)";
        try {
            System.out.println(test.getTestName());
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, test.getTestName());
            test1.setSuccess(String.valueOf(pstmt.executeUpdate()));
            conn.closeDB();
            return test1;
        } catch (SQLException ex) {
            System.out.println("Error in AddTest " + ex.getMessage());
            test1.setError("Error in Adding Test");
            conn.closeDB();
            return test1;
        }
    }
    
    public Test EditTest(Test test) {

        Test test1 = new Test();
        conn = new DbConn();
        conn.connectDB();

        String sql = "UPDATE tbltests set id = ?, testname = ? where id = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, test.getTestId());
            pstmt.setString(2, test.getTestName());
            pstmt.setString(3, test.getTestId());
            test1.setSuccess(String.valueOf(pstmt.executeUpdate()));
            conn.closeDB();
            return test1;
        } catch (SQLException ex) {
            System.out.println("Error in AddTest " + ex.getMessage());
            test1.setError("Error in Adding Test");
            conn.closeDB();
            return test1;
        }
    }
    
    public Test DeleteTest(Test test) {

        Test test1 = new Test();
        conn = new DbConn();
        conn.connectDB();

        String sql = "DELETE  from tbltests where id = ?";
        try {
            pstmt = conn.conn.prepareStatement(sql);
            pstmt.setString(1, test.getTestId());
            test1.setSuccess(String.valueOf(pstmt.executeUpdate()));
            conn.closeDB();
            return test1;
        } catch (SQLException ex) {
            System.out.println("Error in AddTest " + ex.getMessage());
            test1.setError("Error in Adding Test");
            conn.closeDB();
            return test1;
        }
    }

    public List<Test> GetTests() {

        List<Test> tests = new ArrayList<>();
        conn = new DbConn();
        conn.connectDB();
        String sql = "SELECT * From tbltests";
        try {
            stmt = conn.conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Test test = new Test();
                test.setTestId(rs.getString(1));
                test.setTestName(rs.getString(2));
                tests.add(test);
            }
            conn.closeDB();
            return tests;
        } catch (SQLException ex) {
            Test test = new Test();
            System.out.println("Error in Retriving Test " +ex.getMessage());
            test.setError("Error in Retriving Test");
            tests.add(test);
            conn.closeDB();
            return tests;
        }
    }
    public static void main(String[] args) {
        List<Test> test = new ArrayList<>();
        Tests tests = new Tests();
        test = tests.GetTests();
        for (Test test1 : test) {
            String s = test1.getTestId();
            System.out.println(s);
        }
    }
}
