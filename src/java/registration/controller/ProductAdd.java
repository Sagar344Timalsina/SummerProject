/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registration.Dao.ProductDao;

/**
 *
 * @author Sagar Timalsina
 */
public class ProductAdd extends HttpServlet {
RequestDispatcher rd;
ProductDao pd=new ProductDao();

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
         try (PrintWriter out = response.getWriter()) {        
            String name = request.getParameter("fname");
            String qty = request.getParameter("qty");
            float price = Float.parseFloat(request.getParameter("price"));
            
             int cat_id = Integer.parseInt(request.getParameter("category_id"));
             int sup_id = Integer.parseInt(request.getParameter("sup_id"));
             int sub_cat_id = Integer.parseInt(request.getParameter("sub_category_id"));
            String desc = request.getParameter("text");
             
                boolean res= pd.insert(name,qty,price,cat_id,sup_id,sub_cat_id,desc);
           
                if(res){
                rd = request.getRequestDispatcher("Product.jsp");
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
