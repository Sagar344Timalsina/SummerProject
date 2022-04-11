/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import com.google.gson.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import registration.model.ProductModel;


/**
 *
 * @author Sagar Timalsina
 */
public class ChartController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductModel productModel=new ProductModel();
        Gson gson=new Gson();
        response.setContentType("application/json");
        PrintWriter out=response.getWriter();
        out.print(gson.toJson(productModel.findAll()));
        
        
        
    }

}
