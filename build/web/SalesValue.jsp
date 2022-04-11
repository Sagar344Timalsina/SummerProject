<%-- 
    Document   : SalesValue
    Created on : Apr 1, 2022, 6:40:07 PM
    Author     : Sagar Timalsina
--%>

<%@page import="registration.model.SalesAction"%>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            Connection con;
            PreparedStatement pstmt;
            ResultSet rs, rs2;

            boolean res = false;

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


        <%! int getUpdated(int x, int y) {
                con = getConnection();
                int res = x;
//        String date = LocalDate.now().toString();
                String sql = "update product set pro_qty=? where id=?";
//        String sql = "select sum(credit) from creditpayment";
                if (con != null) {
                    try {
                        pstmt = con.prepareStatement(sql);
                        pstmt.setInt(1, x);
                        pstmt.setInt(2, y);

                        res = pstmt.executeUpdate();

                    } catch (Exception e) {
                        e.printStackTrace();
                        res = 0;
                    }
                }
                return res;
            }
        %>
        
        <%! int getTotalStock() {
                con = getConnection();
                int res=0;
//        String date = LocalDate.now().toString();
                String sql = "select pro_qty from product where id=?";
//        String sql = "select sum(credit) from creditpayment";
                if (con != null) {
                    try {
                        pstmt = con.prepareStatement(sql);
                        pstmt.setInt(1,2);
                         pstmt.executeUpdate();
                        while(rs.next()){
                            res=rs.getInt(1);
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                        
                    }
                }
                return res;
            }
        %>
        
        <%
            SalesAction sa = new SalesAction();
            float bal = Float.parseFloat(request.getParameter("cr_bal"));
            String total = (request.getParameter("ordertotal"));
            int Stock = Integer.parseInt(request.getParameter("Operation"));
//            int Stock = 15;
            String dis = (request.getParameter("orderdis"));
            sa.setBal(bal);
            int tStock=getTotalStock();

//            if (sa.getBal() < 0) {
//                response.sendRedirect("modalCustomer.jsp");
//            } else {
//                int a = getUpdated(Stock, 2);
                out.print(Stock);

//                response.sendRedirect("AdminPanel.jsp");
//            }
        %>
    </body>
</html>
