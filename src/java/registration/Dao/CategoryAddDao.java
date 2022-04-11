/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.Dao;
import java.sql.*;
import registration.model.CustomerAction;
/**
 *
 * @author Sagar Timalsina
 */
public class CategoryAddDao {
      Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    CustomerAction ca=new CustomerAction();

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
    public boolean insert(String fname) {

        con = getConnection();
        boolean res = true;
        String sql = "insert into category(cat_name) values(?)";
        if (con != null) {
            try {

                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, fname);
               
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
