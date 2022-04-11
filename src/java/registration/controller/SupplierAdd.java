/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registration.Dao.SupplierAddDao;

/**
 *
 * @author Sagar Timalsina
 */
public class SupplierAdd extends HttpServlet {

    RequestDispatcher rd;
    SupplierAddDao sd = new SupplierAddDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("fname");
            String phone = request.getParameter("phone");
            String add = request.getParameter("address");

            boolean res = sd.insert(name, phone, add);

            if (res) {
                rd = request.getRequestDispatcher("supplierAdd.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("AdminPanel.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
