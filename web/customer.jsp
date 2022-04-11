<%-- 
    Document   : customer
    Created on : Mar 18, 2022, 2:35:06 PM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grocery-E-Khata</title>
    <link rel="stylesheet" href="AdminPanel.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
      <%
          response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
          response.setHeader("Pragma", "no-cache");
          response.setHeader("Expires", "0");
        if(session.getAttribute("usename")==null){
            response.sendRedirect("index.html");
        }
    %>

<%@include file="PanelAdmin.jsp" %>

    <!----- Main body ------>
    <main class="mt-5 pt-3">
        <div class="container-fluid">
            <h1>Hello World</h1>
            <div class="row">
                <div class="col-md-12 col-sm-12 fs-4">
                    <div class="card">
                        <div class="card-header">
                            Employee Table
                        </div>
                        <div class="card-body">
                            
                            <table class="table table-hover data-table">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Password</th>
                                        <th scope="col">Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>mark123@gmail.com</td>
                                        <td>@mdo</td>
                                        <td>Update</td>

                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Jacob555@gmail.com</td>
                                        <td>@fat</td>
                                        <td>Update</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td >Larry the Bird</td>
                                        <td>@twitter</td>
                                        <td>@twitter</td>
                                        <td>Update</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

    </main>
    <!----- Main body ------>
   
</body>

</html>