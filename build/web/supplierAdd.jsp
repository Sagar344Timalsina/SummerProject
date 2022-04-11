<%-- 
    Document   : supplierAdd
    Created on : Mar 22, 2022, 8:53:50 AM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Grocery-E-Khata</title>
        <link rel="stylesheet" href="">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
            String sql = "select * from supplier ";
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
                <h1 class="p-3">Supplier Table</h1>
                <hr>
                <button class="btn btn-success" type="submit" data-bs-toggle="modal" data-bs-target="#exampleModal">Add
                    Supplier</button>
                <div class="row">

                    <div class="col-md-12 col-sm-12 fs-6">

                        <div class="card m-3">
                            <div class="card-header">

                            </div>

                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">Phone Number</th>
                                            <th scope="col">Payable</th>
                                            <th scope="col" >Update</th>
                                            <th scope="col" >Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%while(rs.next()){
                                        %>
                                        <tr>
                                            <th scope="row"><%=rs.getInt(1)%></th>
                                            <td><%=rs.getString(2)%></td>
                                            <td><%=rs.getString(3)%></td>
                                            <td><%=rs.getString(4)%></td>
                                            <td><%=rs.getInt(5)%></td>
                                            
                                            <td><a><button class="btn btn-success">Update</button></a></td>
                                            <td><a><button class="btn btn-danger">Delete</button></a></td>
                                            
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Supplier</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="SupplierAdd">
                                    Supplier name
                                    <input type="text" name="fname" class="form-control my-3 py-2" placeholder="First Name">
                                    <label>Supplier Address</label>
                                    <input type="text" name="address" class="form-control my-3 py-2" placeholder="Addess">
                                    <label>Phone Number</label>
                                    <input type="text" name="phone" class="form-control my-3 py-2"
                                           placeholder="Phone Number">
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Add Supplier</button>
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
