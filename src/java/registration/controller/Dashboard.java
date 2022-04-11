/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import registration.Dao.DashboardItemsDao;
import registration.model.DashboardItems;
import java.time.*;
import registration.Dao.DashBoardHeaderDao;

/**
 *
 * @author Sagar Timalsina
 */
public class Dashboard extends HttpServlet {

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    RequestDispatcher rd;
    DashboardItemsDao did = new DashboardItemsDao();
    DashboardItems di = new DashboardItems();

     public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int op = Integer.parseInt(request.getParameter("operation"));
            DashBoardHeaderDao dhd=new DashBoardHeaderDao();
            int result = dhd.displayCurrentSales();
            out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }

}
}
