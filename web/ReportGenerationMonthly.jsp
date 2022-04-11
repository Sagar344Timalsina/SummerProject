<%-- 
    Document   : ReportGeneration
    Created on : Apr 3, 2022, 6:59:29 AM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%@include file="PanelAdmin.jsp" %>
         <%!
            RequestDispatcher rd;
            Connection con;
            PreparedStatement pstmt;
            ResultSet rs;
         
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
        <%    con = getConnection();
            String date = LocalDate.now().toString();
            String sql = "select DATE_FORMAT(date,'%M %Y'),sum(total) from sales group by year(date),month(date) order by year(date),month(date)";
            if (con != null) {
                try {
                    pstmt = con.prepareStatement(sql);
                    
                    rs = pstmt.executeQuery();
                } catch (Exception e) {
                    e.printStackTrace();

                }

            }
           
        %>
        <main class="mt-5 pt-3">
            <div class="container col-md-8">
                <h1 class="p-3">Monthly Sales Table</h1>
                <hr>
                <table border="2" class="table table-striped ">
                    <tr><th>Date</th>
                    <th>Sales in Month</th>
                    
                    
                    <tr>
                        <%while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString(1)%></td> 
                        <td><%=rs.getString(2)%></td> 
                        </tr>
                        <%}%>
                    </tr>
                </table>
            </div>
        </main>
    </body>
</html>
