/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.model;
import entities.*;
import java.sql.*;
import java.util.*;
/**
 *
 * @author Sagar Timalsina
 */
public class ProductModel {
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
   
    public List<Product> findAll(){
        con=getConnection();
       List<Product> products =new ArrayList<Product>();
       boolean res = true;
        String sql = "select e.pro_id,e.pro_name,e.pro_price,sum(d.quantity) from product e join sales d on(e.pro_id=d.pro_id)";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                
                rs = pstmt.executeQuery();
                while(rs.next()){
                     products.add(new Product(rs.getInt(1),rs.getString(2),rs.getFloat(3),rs.getInt(4)));
                      
                }
            } catch (Exception e) {
                e.printStackTrace();
                res = false;
            }
        }
        
       
      return products;  
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