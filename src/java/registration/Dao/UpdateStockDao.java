/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.Dao;

import java.sql.*;
import registration.model.SalesAction;
import registration.model.SalesPrice;


/**
 *
 * @author Sagar Timalsina
 */
public class UpdateStockDao {
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
   
    public int displayStock(int id){
        int a=0;
       con = getConnection();
        boolean res = true;
        String sql = "select * from product where pro_id=?";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, id);
                rs = pstmt.executeQuery();
                while(rs.next()){
                  a=(rs.getInt("pro_qty")); 
                  
                }
            } catch (Exception e) {
                e.printStackTrace();
                res = false;
            }
        }
        
        closeCon();
        return a;
    }
    public int updateStockSales(int x,int y){
       con = getConnection();
        int res=0;
            String sql = "update product set pro_qty=? where pro_id=?";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1,x);
                pstmt.setInt(2,y);
                pstmt.executeUpdate();
                res=x;
               
            } catch (Exception e) {
                e.printStackTrace();
               
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
