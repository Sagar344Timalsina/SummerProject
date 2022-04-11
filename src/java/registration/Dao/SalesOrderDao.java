/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.Dao;

import java.sql.*;
import java.util.*;

import registration.model.SalesAction;
import registration.model.SalesPrice;

/**
 *
 * @author Sagar Timalsina
 */
public class SalesOrderDao {

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    SalesAction product=new SalesAction();

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

    public List<SalesAction> getAllProducts() {
        List<SalesAction> products=new ArrayList<SalesAction>();
        con = getConnection();
        boolean res = true;
        String sql = "select * from product";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while(rs.next()){
                    
                    product.setId(rs.getInt(1));
                    product.setName(rs.getString(2));
                    product.setDetails(rs.getString(6));
                    product.setQty(rs.getInt(7));
                    product.setPrice(rs.getFloat(3));
                    product.setId(rs.getInt(1));
                    
                    products.add(product);
                    
                }
            

            } catch (Exception e) {
                e.printStackTrace();
                res = false;
            }
        }

        closeCon();
        return products;
    }
    public float display(int id){
        float a=0;
         SalesPrice sp=new SalesPrice();
       con = getConnection();
        boolean res = true;
        String sql = "select pro_price from product where pro_id=?";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, id);
                rs = pstmt.executeQuery();
                while(rs.next()){
                  a=(rs.getFloat(1)); 
                  
                }
            } catch (Exception e) {
                e.printStackTrace();
                res = false;
            }
        }
        
        closeCon();
        return a;
    }
    public int displayStock(int id){
        int a=0;
         SalesPrice sp=new SalesPrice();
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

    public void closeCon() {
        try {
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
