/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import registration.Dao.DashBoardHeaderDao;

/**
 *
 * @author Sagar Timalsina
 */
public class DashboardCrsales extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int op = Integer.parseInt(request.getParameter("operation"));
            DashBoardHeaderDao dhd=new DashBoardHeaderDao();
            int result = dhd.displayCreditSales();
            out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }

}
}
