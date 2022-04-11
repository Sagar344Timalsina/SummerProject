<%-- 
    Document   : ReportGenerationDaily
    Created on : Apr 4, 2022, 7:20:08 PM
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
            String sql = "select  total from sales where date=?";
            if (con != null) {
                try {
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, date);
                    rs = pstmt.executeQuery();
                } catch (Exception e) {
                    e.printStackTrace();

                }

            }
           
        %>
        <main class="mt-5 pt-3">
            <div class="container col-md-6">
                <h1 class="p-3">Daily Sales Table</h1>
                <hr>
                <table border="2" class="table table-striped ">
                    
                    <th>Sales in Days</th>
                    
                    
                    <tr>
                        <%while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString(1)%></td> 
                         
                        </tr>
                        <%}%>
                    </tr>
                </table>
            </div>
        </main>
    </body>
</html>
