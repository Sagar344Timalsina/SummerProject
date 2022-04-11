/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.Dao;

import java.util.*;
import java.sql.*;
import registration.model.LoginEmployee;

/**
 *
 * @author Sagar Timalsina
 */
public class LoginDao {

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    LoginEmployee le = new LoginEmployee();
    SignInDao sn = new SignInDao();

    public boolean display(String uname, String passw) {

        con = sn.getConnection();
//        String result = "Successfully Displayed";
        String sql = "select * from employee where emp_name=? and password=?";
        if (con != null) {
            try {
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, uname);
                pstmt.setString(2, passw);

                rs = pstmt.executeQuery();
                if (rs.next()) {
                    return true;

                }

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
