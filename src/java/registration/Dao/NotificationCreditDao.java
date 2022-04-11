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
import registration.model.SalesAction;

/**
 *
 * @author Sagar Timalsina
 */
public class NotificationCreditDao {
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
    public int[] displayStock(){
        int a[]=new int[20];
         int count=0;
       con = getConnection();
        boolean res = true;
        String sql = "select sum(pro_qty) from product ";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                
                rs = pstmt.executeQuery();
                while(rs.next()){
                  a[count]=(rs.getInt(1)); 
                  count++;
                  
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
