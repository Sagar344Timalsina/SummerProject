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
public class ProductDao {
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
    public boolean insert(String fname,String qty,float price,int cat_id,int sup_id,int sub_cat_id,String desc) {

        con = getConnection();
        boolean res = true;
        String sql = "insert into product(pro_name,pro_price,cat_id,sub_cat_id,pro_details,pro_qty,sup_id) values(?,?,?,?,?,?,?)";
        if (con != null) {
            try {

                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, fname);
                pstmt.setFloat(2, price);
                pstmt.setInt(3, cat_id);
                pstmt.setInt(4, sub_cat_id);
                pstmt.setString(5, desc);
                pstmt.setString(6, qty);
                pstmt.setInt(7, sup_id);
                
               
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
