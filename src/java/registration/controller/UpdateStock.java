/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package registration.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import registration.Dao.SalesInsertDao;
import registration.Dao.UpdateStockDao;
import java.time.*;

/**
 *
 * @author Sagar Timalsina
 */
public class UpdateStock extends HttpServlet {
SalesInsertDao sid=new SalesInsertDao();
UpdateStockDao dhd = new UpdateStockDao();
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int op = Integer.parseInt(request.getParameter("Operation"));
            int id = Integer.parseInt(request.getParameter("id"));
            int tot = Integer.parseInt(request.getParameter("total"));
            
            int stock = dhd.displayStock(id);
            int ans = stock - op;
            int result = dhd.updateStockSales(ans, id);
            String date=LocalDate.now().toString();
            
            String name=sid.insert(id,op,date,tot);
            
            int realstock = dhd.displayStock(id);
            out.println(realstock);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
