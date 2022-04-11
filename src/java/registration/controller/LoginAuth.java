/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import cryptography.Cryptography;
import java.io.*;
import javax.servlet.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registration.Dao.LoginDao;
import registration.model.LoginEmployee;

/**
 *
 * @author Sagar Timalsina
 */
public class LoginAuth extends HttpServlet {
  LoginEmployee le=new LoginEmployee();
  LoginDao ld=new LoginDao();
  Cryptography cg=new Cryptography();
    RequestDispatcher rd;
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out=response.getWriter();
        String name=request.getParameter("user");
        String pass=request.getParameter("pass");    
        if(ld.display(name,pass)){
            HttpSession session=request.getSession();
            session.setAttribute("usename", name);
                rd=request.getRequestDispatcher("AdminPanel.jsp");
                rd.forward(request, response);
                        
            }
        else{
            response.sendRedirect("index.html");
        }
        
    }

    

}
