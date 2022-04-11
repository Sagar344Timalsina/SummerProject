<%-- 
    Document   : DashboardUpdate
    Created on : Apr 2, 2022, 9:40:18 PM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="registration.model.DashboardItems"  %>
<%@page import="registration.Dao.DashboardItemsDao"  %>
<%@page import="java.util.*;"  %>
<%@page import="java.time.*;"  %>
<%@page import="java.sql.*;"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            RequestDispatcher rd;
            Connection con;
            PreparedStatement pstmt;
            ResultSet rs,rs2,rs3;
            DashboardItemsDao did = new DashboardItemsDao();
            DashboardItems di = new DashboardItems();
            boolean res = false;
            boolean res2 = false;
            boolean res3 = false;

            Connection getConnection() {
                String url = "jdbc:mysql://localhost:3306/employeekhata";
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(url, "root", "");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return con;
            }
        %>
        <%    con = getConnection();
            String date = LocalDate.now().toString();
            String sql = "select sum(total) from sales where date=?";
            if (con != null) {
                try {
                    pstmt = con.prepareStatement(sql);
                    //           
                    pstmt.setString(1, date);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        int totalweight = rs.getInt(1);
                        out.print(totalweight);
                        res = true;
                        session.setAttribute("cash", totalweight);
//                        di.setCash(totalweight);

                    }

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }
            if (res) {
//                response.sendRedirect("AdminPanel.jsp");
                rd = request.getRequestDispatcher("AdminPanel.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("Accounts.jsp");
            }


        %>
        <%            String sql2 = "select sum(credit) from creditpayment";

            pstmt = con.prepareStatement(sql2);
            rs2 = pstmt.executeQuery();
            while (rs2.next()) {
                float crsales = rs2.getFloat(1);
                 out.print(crsales);
                res2 = true;
                session.setAttribute("crsales", crsales);
                
                   
            }
            if (res2) {
//                response.sendRedirect("AdminPanel.jsp");
                rd = request.getRequestDispatcher("AdminPanel.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("Accounts.jsp");
            }


        %>
        <%            String sql3 = "select sum(pro_qty) from product";

            pstmt = con.prepareStatement(sql3);
            rs3 = pstmt.executeQuery();
            int qty;
            while (rs3.next()) {
                qty = rs3.getInt(1);
             out.print(qty);      
            }
            if (res3) {
//                response.sendRedirect("AdminPanel.jsp");
                rd = request.getRequestDispatcher("AdminPanel.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("Accounts.jsp");
            }


        %>

    </body>
</html>
