<%-- 
    Document   : category
    Created on : Mar 26, 2022, 3:26:38 PM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="PanelAdmin.jsp" %>
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
            String sql = "select * from category ";
            if (con != null) {
                try {
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(sql);

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }

        %>
        <main class="mt-5 pt-3">

            <div class="container">
                <h1 class="p-3"> Category</h1>
                <hr>
                <button class="btn btn-success" type="submit" data-bs-toggle="modal" data-bs-target="#exampleModal">Add
                    Categories</button>
                <div class="row">

                    <div class="col-md-12 col-sm-12 fs-6">
                        <div class="card m-2">
                            <div class="card-header">
                                <h4> List of Category</h4>
                            </div>
                            <div class="card-body"> 
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col" >Update</th>
                                            <th scope="col" >Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% while (rs.next()) {%>
                                        <tr>
                                            <th scope="row"><%=rs.getInt(1)%></th>
                                            <td><%=rs.getString(2)%></td>
                                            <td><a><button class="btn btn-success">Update</button></a></td>
                                            <td><a><button class="btn btn-danger">Delete</button></a></td>
                                        </tr>
                                        <%}

                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="CategoryAdd">
                                    Category name
                                    <input type="text" name="fname" class="form-control my-3 py-2" placeholder="First Name">
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <input type="submit" class="btn btn-primary" value="Add Category">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
