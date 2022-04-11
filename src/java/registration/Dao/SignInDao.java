/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.Dao;

import java.sql.*;
import registration.model.SignInEmployee;

/**
 *
 * @author Sagar Timalsina
 */
public class SignInDao {

    Connection con;
    PreparedStatement pstmt;

    public Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/employeekhata";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public String insert(SignInEmployee emp) {
        con = getConnection();
        String result = "Successfully inserted";
        String sql = "Insert into employeelogin values(?,?)";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, emp.getUsername());
                pstmt.setString(2, emp.getPassword());
                pstmt.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
                result = "Data couldnot insert";
            }
        }
        
        closeCon();
        return result;
    }

    public void closeCon() {
        try {
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
