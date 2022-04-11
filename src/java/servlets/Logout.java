/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Sagar Timalsina
 */
public class Logout extends HttpServlet {

    RequestDispatcher rd;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            session.removeAttribute("usename");
            session.invalidate();
            response.sendRedirect("index.html");
//            rd = request.getRequestDispatcher("index.html");
//            rd.include(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
