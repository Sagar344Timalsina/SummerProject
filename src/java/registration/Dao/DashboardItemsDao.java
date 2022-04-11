/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.Dao;

import java.util.*;
import java.sql.*;
import java.time.*;
import registration.model.DashboardItems;

/**
 *
 * @author Sagar Timalsina
 */
public class DashboardItemsDao {

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    DashboardItems di = new DashboardItems();

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

    public boolean display() {
        int sum = 5;
        con = getConnection();
//        String result = "Successfully Displayed";
        String sql = "select * from sales";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    sum+= (rs.getInt(5));

                    return true;

                }
                di.setCash(15);
            } catch (Exception e) {
                e.printStackTrace();

            }
            closeCon();
        }

        return false;

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
