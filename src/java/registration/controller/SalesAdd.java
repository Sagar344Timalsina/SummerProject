/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registration.model.SalesAction;

/**
 *
 * @author Sagar Timalsina
 */
public class SalesAdd extends HttpServlet {

    RequestDispatcher rd;
    SalesAction sa = new SalesAction();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
//            float ot = Float.parseFloat(request.getParameter("ordertotal"));
//            float odis = Float.parseFloat(request.getParameter("orderdis"));
//            float subtotal = Float.parseFloat(request.getParameter("sub_total"));
//            float prebal = Float.parseFloat(request.getParameter("pre-bal"));
//            float total = Float.parseFloat(request.getParameter("total"));
//            int paid = Integer.parseInt(request.getParameter("paid"));
            float bal = Float.parseFloat(request.getParameter("cr_bal"));
            sa.setBal(bal);
            out.println("Hello<h1>" + sa.getBal() + "</h1>");

//                boolean res= sd.insert(name,qty,s);
//           
//                if(res){
//                rd = request.getRequestDispatcher("Sub_Category.jsp");
//                rd.forward(request, response);
//                }
//                else{
//                response.sendRedirect("AdminPanel.jsp");
//                }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
