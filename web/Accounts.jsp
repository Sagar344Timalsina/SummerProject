<%-- 
    Document   : Accounts
    Created on : Mar 27, 2022, 7:24:18 PM
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
            ResultSet rs,rs2;
         
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
            
            String sql = "select sum(cus_amount) from customer";
            if (con != null) {
                try {
                    pstmt = con.prepareStatement(sql);
                    
                    rs = pstmt.executeQuery();
                } catch (Exception e) {
                    e.printStackTrace();

                }

            }
           
        %>
         <%    con = getConnection();
           
            String sql2 = "select sum(payable) from supplier";
            if (con != null) {
                try {
                    pstmt = con.prepareStatement(sql2);
                    
                    rs2 = pstmt.executeQuery();
                } catch (Exception e) {
                    e.printStackTrace();

                }

            }
           
        %>
        <main class="mt-5 pt-3"> 

            <div class="container col-md-8">
                <h1 class="p-3"> Details</h1>
                <hr>
                <div class="card border-0 shadow fs-5  ">
                    <div class="card-header fs-3 fw-500">
                        Company Details
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <div class="col-md-5">
                                    Organization Name
                                    <input type="text" name="fname" class="form-control my-3 py-2" placeholder="Naikap Grocery Shop" readonly>
                                    Established Date
                                    <input type="text" name="date" class="form-control my-3 py-2" placeholder="2075"  readonly>
                                    Accounts Payable Amount
                                    <input type="text" name="pay" class="form-control my-3 py-2" value=<%while(rs.next()){%><%=rs.getInt(1)%><%}%> readonly>
                                    Accounts Receivable Amount
                                    <input type="text" name="rec" class="form-control my-3 py-2" value=<%while(rs2.next()){%><%=rs2.getInt(1)%><%}%> readonly>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
