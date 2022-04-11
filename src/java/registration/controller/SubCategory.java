/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registration.Dao.SubCategoryDao;
/**
 *
 * @author Sagar Timalsina
 */
public class SubCategory extends HttpServlet {
     RequestDispatcher rd;
     SubCategoryDao sd=new SubCategoryDao();
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
         try (PrintWriter out = response.getWriter()) {        
            String name = request.getParameter("fname");
            String qty = request.getParameter("qty");
             int s = Integer.parseInt(request.getParameter("category_id"));
            
             
                boolean res= sd.insert(name,qty,s);
           
                if(res){
                rd = request.getRequestDispatcher("Sub_Category.jsp");
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
