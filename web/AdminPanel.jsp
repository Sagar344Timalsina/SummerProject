<%-- 
    Document   : AdminPanel.jsp
    Created on : Mar 18, 2022, 2:27:51 PM
    Author     : Sagar Timalsina
--%>
<%@page import="registration.model.DashboardItems"  %>
<%@page import="registration.Dao.DashboardItemsDao"  %>
<%@page import="java.util.*;"  %>
<%@page import="java.time.*;"  %>
<%@page import="java.sql.*;"  %>
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

        <link rel="stylesheet" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

    </head>

    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            if (session.getAttribute("usename") == null) {
                response.sendRedirect("index.html");
            }
        %>
        <%!
            Connection con;
            Statement stmt;
            PreparedStatement pstmt;
            ResultSet rs, rs2;

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
            LocalDate currentDate = LocalDate.now();
            LocalDate currentDateMinus3Months = currentDate.minusMonths(3);
            String threeMonthsBefore = currentDateMinus3Months.toString();
            String sql = "select cus_name,cus_amount,cus_phone from customer where c_id in(select cus_id from creditpayment where date>?)";
            if (con != null) {
                try {
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, threeMonthsBefore);
                    rs = pstmt.executeQuery();

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }


        %>
        <%    con = getConnection();
            String sql2 = "select pro_name,pro_qty from product where pro_qty < 20";
            if (con != null) {
                try {
                    stmt = con.createStatement();
                    rs2 = stmt.executeQuery(sql2);

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }


        %>




        <%@include file="PanelAdmin.jsp" %>

        <!-- Main Body -->
        <main class="mt-5 pt-3">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 fw-bold fs-3 mt-3">
                        Dashboard
                    </div>
                </div>
                <!-- 2nd Row -->
                <div class="row">
                    <div class="col-md-3 mb-3 ">
                        <div class="card text-dark bg-light h-100 ">
                            <div class="card-header">Cash Sales</div>
                            <div class="card-body " style="background-color: darkkhaki; ">
                                <h1 >

                                    Today's Sales :: <span id="sales1"></span>
                                </h1>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-3 ">
                        <div class="card text-dark bg-light h-100">
                            <div class="card-header">Total Credit sales</div>
                            <div class="card-body" style="background-color: rosybrown;">
                                <h1 >

                                    Credit Sales :: <span id="crSales"></span>
                                </h1>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-3 ">
                        <div class="card text-dark bg-light h-100">
                            <div class="card-header">Stock</div>
                            <div class="card-body" style="background-color: background;">
                                <h1 >

                                    Quantity :: <span id="quantity"></span>
                                </h1>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-3 ">
                        <div class="card text-dark bg-light h-100">
                            <div class="card-header">Payments</div>
                            <div class="card-body "style="background-color: rgba(0,0,0,0.2);">
                                <h1 >

                                    Payables :: <span id="Payables"></span>
                                </h1>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 2nd Row -->

                <!-- 3rd Row charts -->
                <div class="row pt-3">
                    <div class="col-md-7">
                        <div class="card">
                            <div class="card-header">
                                Charts
                            </div>
                            <div class="card-body">
                                <canvas id="myChart" ></canvas>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5  ">
                        <div class="row">
                            <div class="col-md-12  ">
                                <div class="card" style="max-height: 500px; overflow-y: auto;">
                                    <div class="card-header" >
                                        Notification
                                    </div>
                                    <div class="card-body">

                                        <table cellpadding="0" id="table" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Product Name</th>
                                                    <th>Quantity</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% while (rs2.next()) {%>
                                                <tr class="gradeC">
                                                    <td><%=rs2.getString(1)%></td>
                                                    <td><%=rs2.getInt(2)%></td>




                                                </tr>
                                                <%}%>
                                            </tbody>

                                        </table>


                                    </div>
                                </div>

                                <div class="col-md-12 pt-3  ">
                                    <div class="card" style="max-height: 400px; overflow-y: auto;">
                                        <div class="card-header" >
                                            Pie Chart of Most Sales
                                        </div>
                                        <div class="card-body">
                                            <table class="columns">
                                                <tr>
                                                    <td><div id="piechart_div" style="border: 1px solid #ccc"></div></td>
                                                   

                                                </tr>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row py-4">

                        <div class="col-md-12">

                            <div id="wrap">
                                <div class="container">
                                    <h3 class="pt-3 pb-2">Credit Customer</h3>
                                    <table cellpadding="0" id="table_id" cellspacing="0" border="0" class="datatable table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Amount</th>
                                                <th>Phone Number</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <% while (rs.next()) {%>
                                            <tr class="gradeC">
                                                <td><%=rs.getString(1)%></td>
                                                <td><%=rs.getFloat(2)%></td>
                                                <td><%=rs.getString(3)%></td>



                                            </tr>
                                            <%}%>
                                        </tbody>

                                    </table>
                                </div>
                            </div>



                        </div>
                    </div>
                    <!-- 3rd Row -->
                </div>
        </main>
        <!-- Main Body -->



        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <script src="mycharts.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript" src="http://www.gstatic.com/charts/loader.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script type="text/javascript">

            $(document).ready(function () {


                $.ajax({
                    url: "DashboardSales",
                    method: "GET",
                    data: {operation: 0},

                    success: function (data) {
                        console.log(data);
                        $('#quantity').html(data);
                    }
                });
                $.ajax({
                    url: "Dashboard",
                    method: "GET",
                    data: {operation: 0},

                    success: function (data) {
                        console.log(data);
                        $('#sales1').html(data);
                    }
                });

                $.ajax({
                    url: "DashboardPayables",
                    method: "GET",
                    data: {operation: 0},

                    success: function (data) {
//                                           console.log(data);
                        console.log(data);
                        $('#Payables').html(data);
                    }
                });
                $.ajax({
                    url: "DashboardCrsales",
                    method: "GET",
                    data: {operation: 0},

                    success: function (data) {
//                                       
                        console.log(data);
                        $('#crSales').html(data);
                    }
                });

            });


        </script>
        <script>
            $(document).ready(function () {
                $('#table_id').dataTable({
                });
            });

        </script>
        
         <script>
            $(document).ready(function(){
                $.ajax({
                    url:"ChartController",
                    dataType:"JSON",
                    success:function(result){
                        google.charts.load('current',{'packages':['corechart']});
                        google.charts.setOnLoadCallback(function(){
                            drawChart(result);
                        });
                    }
            
            
                });
             function drawChart(result){
                var data=new google.visualization.DataTable();
                data.addColumn('string','Name');
                data.addColumn('number','Quantity');
                var dataArray=[];
                $.each(result,function(i,obj){
                   dataArray.push([obj.name,obj.quantity]); 
                });
                data.addRows(dataArray);
                 var piechart_options={
                     title:"Pie chart",
                     width:400,
                     height:300
                 };
                 var piechart=new google.visualization.PieChart(
                    document.getElementById('piechart_div'));
                    piechart.draw(data,piechart_options);
                                 
                 
             }   
    
            });
            
            
            
        </script>
    </body>

</html>