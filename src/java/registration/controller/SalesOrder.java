/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import com.google.gson.Gson;
import java.io.*;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import registration.Dao.SalesOrderDao;
import registration.model.SalesAction;
import registration.model.SalesPrice;

/**
 *
 * @author Sagar Timalsina
 */
public class SalesOrder extends HttpServlet {

            SalesAction sa=new SalesAction();
   public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {             
            int op=Integer.parseInt(request.getParameter("operation"));
            SalesOrderDao sad=new SalesOrderDao();
            SalesPrice sp=new SalesPrice();
           
            float res=sad.display(op);              
            out.println(res);
        }

    }
  





}
