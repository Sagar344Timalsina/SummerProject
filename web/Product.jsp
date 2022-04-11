<%-- 
    Document   : Product
    Created on : Mar 26, 2022, 10:59:50 PM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
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
            ResultSet rs, rs2,rs3,rs4;

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
            String sql = "select * from sub_category ";
            if (con != null) {
                try {
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(sql);

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }


        %>
         <%    con = getConnection();
            String sql2 = "select * from category ";
            if (con != null) {
                try {
                    stmt = con.createStatement();
                    rs2 = stmt.executeQuery(sql2);

                } catch (Exception e) {
                    e.printStackTrace();

                }
            }
        %>
        <%    con = getConnection();
            String sql3 = "select * from product ";
            if (con != null) {
                try {
                    stmt = con.createStatement();
                    rs3 = stmt.executeQuery(sql3);

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }


        %>
        <%    con = getConnection();
            String sql4 = "select * from supplier ";
            if (con != null) {
                try {
                    stmt = con.createStatement();
                    rs4 = stmt.executeQuery(sql4);

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }


        %>
        
        <main class="mt-5 pt-3">

            <div class="container">
                <h1 class="p-3"> Product</h1>
                <hr>
                <button class="btn btn-success" type="submit" data-bs-toggle="modal" data-bs-target="#exampleModal">Add
                    Product</button>
                <div class="row">

                    <div class="col-md-12 col-sm-12 fs-6">
                        <div class="card m-2">
                            <div class="card-header">
                                <h4> List of Product</h4>
                            </div>
                            <div class="card-body"> 
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Pro_ID</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col" >Pro-Detail</th>
                                            <th scope="col" >Pro_QTY</th>
                                            <th scope="col" >Update</th>
                                            <th scope="col" >Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% while (rs3.next()) {%>
                                        <tr>
                                            <th scope="row"><%=rs3.getInt(1)%></th>
                                            <td><%=rs3.getString(2)%></td>
                                            <td><%=rs3.getFloat(3)%></td>
                                            <td><%=rs3.getString(6)%></td>
                                            <td><%=rs3.getString(7)%></td>
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
                                <form method="POST" action="ProductAdd">
                                    Product name
                                    <input type="text" name="fname" class="form-control my-3 py-2" placeholder="First Name">
                                    Product Qty
                                    <input type="text" name="qty" class="form-control my-3 py-2" placeholder="Quantity">
                                    Price
                                    <input type="text" name="price" class="form-control my-3 py-2" placeholder="Price">
                                    Select Category
                                    <select name="category_id" class="form-control my-3 py-2" >
                                        <% while (rs2.next()) {%>
                                        <option value="<%=rs2.getInt(1)%>"><%=rs2.getString(2)%></option>
                                        <%}%>
                                    </select><br/>
                                    Select Sub-Category
                                    <select name="sub_category_id" class="form-control my-3 py-2" >
                                        <% while (rs.next()) {%>
                                        <option value="<%=rs.getInt(4)%>"><%=rs.getString(1)%></option>
                                        <%}%>
                                    </select><br/>
                                    Select Supplier
                                    <select name="sup_id" class="form-control my-3 py-2" >
                                        <% while (rs4.next()) {%>
                                        <option value="<%=rs4.getInt(1)%>"><%=rs4.getString(2)%></option>
                                        <%}%>
                                    </select><br/>
                                    Description
                                    <textarea name="text" rows="5" cols="5" class="form-control my-3 py-2"></textarea>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <input type="submit" class="btn btn-primary" value="Add Product">
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
