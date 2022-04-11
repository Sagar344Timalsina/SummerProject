/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.Dao;
import java.sql.*;
import java.time.LocalDate;
import java.util.*;
import registration.model.SalesAction;
import registration.model.SalesPrice;
/**
 *
 * @author Sagar Timalsina
 */
public class DashBoardHeaderDao {
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
    public int displayStock(){
        int a=0;
         SalesPrice sp=new SalesPrice();
       con = getConnection();
        boolean res = true;
        String sql = "select sum(pro_qty) from product ";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                
                rs = pstmt.executeQuery();
                while(rs.next()){
                  a=(rs.getInt(1)); 
                  
                }
            } catch (Exception e) {
                e.printStackTrace();
                res = false;
            }
        }
        
        closeCon();
        return a;
    }
    
    public int displayPayables(){
        int b=0;
//         SalesPrice sp=new SalesPrice();
       con = getConnection();
        boolean res = true;
        String sql = "select sum(payable) from supplier";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                
                rs = pstmt.executeQuery();
                while(rs.next()){
                  b=(rs.getInt(1)); 
                  
                }
            } catch (Exception e) {
                e.printStackTrace();
                res = false;
            }
        }
        
        closeCon();
        return b;
    }
    
    public int displayCreditSales(){
        int b=0;
//         SalesPrice sp=new SalesPrice();
       con = getConnection();
        boolean res = true;
        String sql = "select sum(credit) from creditpayment";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                
                rs = pstmt.executeQuery();
                while(rs.next()){
                  b=(rs.getInt(1)); 
                  
                }
            } catch (Exception e) {
                e.printStackTrace();
                res = false;
            }
        }
        
        closeCon();
        return b;
    }
    public int displayCurrentSales(){
        int b=0;
//         SalesPrice sp=new SalesPrice();
       con = getConnection();
        boolean res = true;
        String date = LocalDate.now().toString();
            String sql = "select  sum(total) from sales where date=?";
//        String sql = "select sum(credit) from creditpayment";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,date);
                rs = pstmt.executeQuery();
                while(rs.next()){
                  b=(rs.getInt(1)); 
                  
                }
            } catch (Exception e) {
                e.printStackTrace();
                res = false;
            }
        }
        
        closeCon();
        return b;
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
