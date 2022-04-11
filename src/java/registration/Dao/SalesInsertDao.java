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
public class SalesInsertDao {
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
    
    public String insert( int pid, int qt,String da,int tot) {
        con = getConnection();
        String result = "Successfully inserted";
        String sql = "Insert into sales(pro_id,quantity,date,total) values(?,?,?,?)";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, pid);
                pstmt.setInt(2,qt );
                pstmt.setString(3, da);
                pstmt.setInt(4,tot );
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
