/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registration.Dao.CustomerActionDao;
import registration.model.CustomerAction;


/**
 *
 * @author Sagar Timalsina
 */
public class CustomerUpdate extends HttpServlet {

   RequestDispatcher rd;
   CustomerActionDao cd=new CustomerActionDao();
   CustomerAction ca=new CustomerAction();
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
         try (PrintWriter out = response.getWriter()) {
//            String uname=request.getParameter("username");
//            String password=request.getParameter("password");
            String name = request.getParameter("fname");
            String phone = request.getParameter("phone");
            float amount = Float.parseFloat(request.getParameter("amt"));
                
                ca.setName(name);
                ca.setPhone(phone);
                ca.setAmount(amount);

                boolean res= cd.display(name,phone,amount);
           
                if(res){
                rd = request.getRequestDispatcher("CustomerList.jsp");
                rd.forward(request, response);
                }
                else{
                response.sendRedirect("AdminPanel.jsp");
                }
        } catch (Exception e) {
            e.printStackTrace();
        }

        
    }

    

}
