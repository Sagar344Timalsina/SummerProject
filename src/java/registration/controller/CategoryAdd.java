/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registration.Dao.CategoryAddDao;
/**
 *
 * @author Sagar Timalsina
 */
public class CategoryAdd extends HttpServlet {
 RequestDispatcher rd;
 CategoryAddDao cd=new CategoryAddDao();
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
         try (PrintWriter out = response.getWriter()) {        
            String name = request.getParameter("fname");
             
                boolean res= cd.insert(name);
           
                if(res){
                rd = request.getRequestDispatcher("category.jsp");
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
