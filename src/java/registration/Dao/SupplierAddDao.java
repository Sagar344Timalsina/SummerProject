/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.Dao;

import java.sql.*;

/**
 *
 * @author Sagar Timalsina
 */
public class SupplierAddDao {

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;

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

    public boolean insert(String fname, String num, String add) {

        con = getConnection();
        boolean res = true;
        String sql = "insert into supplier(sup_name,sup_no,sup_address) values(?,?,?) ";
        if (con != null) {
            try {

                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, fname);
                pstmt.setString(2, num);
                pstmt.setString(3, add);
                pstmt.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
                res = false;
            }
        }

        closeCon();
        return res;
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
