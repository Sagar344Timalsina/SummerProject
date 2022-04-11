/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


/**
 *
 * @author Sagar Timalsina
 */
public class SubCategoryDao {
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
    public boolean insert(String fname,String qtty,int supid) {

        con = getConnection();
        boolean res = true;
        String sql = "insert into sub_category(sub_cat_name,sub_cat_qty,sup_id) values(?,?,?)";
        if (con != null) {
            try {

                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, fname);
                pstmt.setString(2, qtty);
                pstmt.setInt(3, supid);
               
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
