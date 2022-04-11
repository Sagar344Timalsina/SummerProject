<%-- 
    Document   : EmployeeProfile
    Created on : Mar 22, 2022, 11:26:56 PM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="PanelAdmin.jsp" %>
<%@page import="java.sql.*" %>
<%!
    Connection con;
    Statement stmt;
    ResultSet rs;

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
    String sql = "select * from employee ";
    if (con != null) {
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(sql);

        } catch (Exception e) {
            e.printStackTrace();

        }

    }

%>
<body>
    <main class="mt-5 pt-5">
        <div class="container">
            <h1 class="mx-5">Employee`s Details</h1>
            <hr>
            <a class="text-white" style="text-decoration: none;" href="SignIn.jsp"><button class="btn btn-success " >Add Employee</button></a>

            <div class="row">
                <div class="col-12 col-md-12 col-sm-10">
                    <div class="card m-3">
                        <div class="card-header">

                        </div>

                        <div class="card-body">
                            <table id="tab" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <% while (rs.next()) {%>
                                    <tr>
                                        <th scope="row"><%=rs.getInt(1)%></th>
                                        <td><%=rs.getString(2)%></td>
                                        <td><%=rs.getString(4)%></td>
                                        <td><%=rs.getString(5)%></td>
                                        <td><%=rs.getString(6)%></td>

                                    </tr>
                                    <%}

                                    %>


                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>
                                    
 
</body>