/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.*;
import registration.Dao.SignInDao;
import cryptography.Cryptography;
import javax.servlet.*;
import registration.model.SignInEmployee;

/**
 *
 * @author Sagar Timalsina
 */
public class SignInServlet extends HttpServlet {

    RequestDispatcher rd;
    private static Cryptography cg = new Cryptography();
    private static SignInEmployee se = new SignInEmployee();
    private static SignInDao sd = new SignInDao();
    private static Cryptography ct = new Cryptography();

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//            String uname=request.getParameter("username");
//            String password=request.getParameter("password");
            String name = request.getParameter("name");
            String pass1 = request.getParameter("pass1");
            String pass2 = request.getParameter("pass2");

            if (pass1.equals(pass2)) {
                //String pas = ct.encryption(pass1);
                se.setUsername(name);
                se.setPassword(pass1);
                String result = sd.insert(se);
                response.getWriter().print(result);
                rd = request.getRequestDispatcher("index.html");
                rd.forward(request, response);
            } else {
                rd = request.getRequestDispatcher("SignIn.jsp");
                rd.include(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
