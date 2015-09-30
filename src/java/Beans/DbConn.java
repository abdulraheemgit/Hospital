/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConn {

    public Connection conn;
    private String url = "jdbc:mysql://localhost:3306/";
    private String dbName = "dbhospital";
    private String driver = "com.mysql.jdbc.Driver";
    private String userName = "user1";
    private String password = "k123";

    public void connectDB() {

        try {
            Class.forName(driver);
            conn = (Connection) DriverManager.getConnection(url+dbName,userName,password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("DbConn.connectdb "+e.getMessage());
        }

    }

    public void closeDB() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    public static void main(String[] args) throws SQLException {
        DbConn dbConn = new DbConn();

        dbConn.connectDB();
        String sql = "SELECT * FROM tblusers";
        Statement stmt = dbConn.conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        System.out.println(rs.next());
        System.out.println(rs.getString("username"));
    }

}
