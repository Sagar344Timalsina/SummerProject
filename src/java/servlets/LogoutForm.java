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
public class LogoutForm extends HttpServlet {

   RequestDispatcher rd;
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
//          HttpSession session = request.getSession();
//            HttpSession session=request.getSession();
//            String n=(String)session.getAttribute("usename");
            
            out.print("Hello ");
//            response.sendRedirect("");
//             rd = request.getRequestDispatcher("index.html");
//            rd.include(request, response);
        }

    }

