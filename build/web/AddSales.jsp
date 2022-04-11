<%-- 
    Document   : AddSales
    Created on : Mar 27, 2022, 8:10:29 PM
    Author     : Sagar Timalsina
--%>
<%@page import="registration.model.SalesAction"%>
<%@page import="java.sql.*" %>
<%@page  import="registration.Dao.SalesOrderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="PanelAdmin.jsp" %>

        <% SalesOrderDao sod = new SalesOrderDao();
            SalesAction sa = new SalesAction();
            List<SalesAction> products = sod.getAllProducts();%> 



        <%!                 RequestDispatcher rd;
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
        <%    con = getConnection();

            String sql = "select * from product";
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

            <div class="container col-md-10 col-sm-8">
                <h1 class="p-3">Sale Order</h1>
                <hr>
                <div class="card border-0 shadow fs-5  ">
                    <div class="card-header fs-3 fw-500">

                    </div>
                    <div class="card-body ">
                        <div class="row">
                            <div class="col-md-10 ">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h3>Grocery E Khata</h3>
                                        <label></label>
                                    </div>
                                    <div class="col-md-6">
                                        <h3>Address</h3>
                                        <label>KTM</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <form id="Form" >
                            <div class="row">

                                <div class="col-md-1">
                                    <%int count = 0;


                                    %>
                                    <h4>ID</h4>

                                    <input class="col-md-4 text-center" type="text" disabled id="id" value="<%=++count%>">
                                </div>
                                <div class="col-md-2">
                                    <h4>Product</h4>
                                    <select class="col-md-10" id="pro_name" style="max-height: 200px;overflow-x: hidden;overflow-y: auto;">
                                        <%while (rs.next()) {%>
                                        <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                        <%}%>
                                    </select>


                                </div>

                                <div class="col-md-2">
                                    <h4>Price</h4>
                                    <!--<span id="price1">25.0</span>-->
                                    <input type="text" class="col-md-10" value="25.0"  id="price1" readonly>

                                </div>

                                <div class="col-md-2">
                                    <h4>Quantity</h4>
                                    <input type="text" class="col-md-5" id="qty" onchange="calc(this.value)">
                                </div>
                                <div class="col-md-2">
                                    <h4>Stock</h4>

                                    <input type="text" class="col-md-5" id="qttt" name="qtty"readonly>

                                </div>
                                <div class="col-md-2">
                                    <h4>Total</h4>

                                    <input type="text" class="col-md-5" id="tot_amount"  name="tot_amount" readonly>


                                </div>

                                <div class="col-md-2">
                                    <h4>Action</h4>
                                    <button class="btn btn-success" type="submit" >Add Product</button>
                                </div>

                            </div>
                        </form>
                        <hr>
                        <table class="col-md-10" id="myTable">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Pro_Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>


                        <hr><!-- comment -->


                        <div class="row">
                            <br>
                            <br>
                            <br>
                            <br>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-5">
                                        <h3>Payment Method</h3>
                                        <select class="col-md-12">
                                            <option value="1" disabled>....</option>
                                            <option value="2">Cash</option>
                                            <option value="3">Credit</option>
                                        </select>
                                    </div>


                                    <div class="col-md-5 mx-4">
                                        <h3>Billing System</h3>
                                        <a href="Billings.jsp"   <button class="btn btn-danger" >Print Bill</button></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <form method="GET" action="#" id='myform'>
                                    <div class="row p-1">
                                        <div class="col-md-6">
                                            <h5>Order Total</h5>
                                        </div>
                                        <div class="col-md-6">


                                            <input type="text" class="form-control" id="ordertotal" name="ordertotal" placeholder="Total" readonly>
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-6">
                                            <h5>Order Discount</h5>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="orderdis" name="orderdis" onchange="subTotal(this.value)" placeholder="discount" >
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-6">
                                            <h5>Sub-Total</h5>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="sub_total" name="sub_total" readonly>
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-6">
                                            <h5>Previous Balance</h5>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" name="pre-bal" placeholder="Prev.bal" readonly>
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-6">
                                            <h5>Total</h5>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" name="total" placeholder="Total" readonly >
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-6">
                                            <h5>Paid</h5>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" name="paid"  id="paid"onchange="onPaidBal(this.value)" >
                                        </div>
                                    </div>
                                    <div class="row p-1">
                                        <div class="col-md-6">
                                            <h5>Balance</h5>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" name="cr_bal" id="cr_bal" readonly>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary col-md-12  my-2" type="submit">Pay</button>
                                </form>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
            <script>
                const form = document.getElementById("Form");
                const bodytable = document.querySelector("tbody");
                const tableEl = document.querySelector("table");
                var id = document.getElementById("id").value;
                var select = document.getElementById('pro_name');

                var option = select.options[select.selectedIndex].text;
                var price = document.getElementById('price1').value;
                console.log(price);
                var dis;
                var sub_total12 = document.getElementById('sub_total');
                var creditbalance = document.getElementById('cr_bal');
                var qtty;
                var tot_amount;
                var total;
                var disc;
                var bal;
                var tabledata;
//                function getSelectedValue(){
//                    var select1 = document.getElementById('pro_name').value;
//                    
//                console.log(select1);
//                }

                function calc(val) {
                    qtty = val;
                    tot_amount = val * price;
                    var divobj = document.getElementById('tot_amount');

                    divobj.value = tot_amount;
                }

                function ontable(e) {

                    e.preventDefault();
                    bodytable.innerHTML += "<tr><td>" + id + "</td><td>" + option + "</td><td>" + price + "</td><td>" + qtty + "</td><td>" + tot_amount + "</td><td><button class='btn_delete'>Delete</button></td></tr>";

                    tabletoatal();
                    tabledata = bodytable.innerHTML;
                    createArray();


                }
                function tabletoatal() {
                    var table = document.getElementById("myTable"),
                            sumVal = 0;
                    for (var i = 1; i < table.rows.length; i++) {
                        sumVal = sumVal + parseFloat(table.rows[i].cells[4].innerHTML);
                    }
                    var divobj = document.getElementById('ordertotal');
                    divobj.value = sumVal;
                    total = sumVal;
                    localStorage.setItem("total", JSON.stringify(total));
//                  
                }

                function subTotal(e) {
                    dis = e;
                    var discountedamount = (total * e) / 100;
                    disc = (total - discountedamount);
                    sub_total12.value = disc;
                    localStorage.setItem("discount", JSON.stringify(discountedamount));
                    localStorage.setItem("sub_total", JSON.stringify(disc));

                }

                function onPaidBal(e) {
                    paid = e - disc;
                    creditbalance.value = paid;
//                    sa.setBal(paid);
                    localStorage.setItem("crbalance", JSON.stringify(paid));
                    localStorage.setItem("paid", JSON.stringify(e));
//                   document.location.href="AddSales.jsp?mess=" + paid;
//                    window.location.replace("AddSales.jsp?mess=" + paid);


                }
                function ondelete(e) {
                    if (!e.target.classList.contains('btn_delete')) {
                        return;
                    }
                    const btn = e.target;
                    btn.closest("tr").remove();
                    tabledata = bodytable.innerHTML;
                    createArray();
                    tabletoatal();
                    subTotal(dis);
                }

                function createArray() {
                    var arrayPlayerName = [];
                    var count = 0;
//                    while (count <= tabledata.length) {
//                        arrayPlayerName.push(bodytable.rows[count].cells[1].innerHTML);
//                        count++;
//                    }
                    var table = document.getElementById("myTable");
                    for (var i = 1; i < table.rows.length; i++) {
                        for (var j = 1; j < 5; j++) {
                            arrayPlayerName.push(table.rows[i].cells[j].innerHTML);
                        }
                    }
//                    console.log(arrayPlayerName);
                    localStorage.setItem("playerNameArray", JSON.stringify(arrayPlayerName));
                }
                form.addEventListener('submit', ontable);
                tableEl.addEventListener('click', ondelete);
            </script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#pro_name').on("change", function () {
                        var pro = $('#pro_name').val();
                        console.log(pro);
                        $.ajax({
                            url: "SalesOrder",
                            method: "GET",
                            data: {operation: pro},
                            success: function (data) {
//                                           console.log(data);
                                console.log(data);
                                $('#price1').val(data);
                            }
                        });
                        $.ajax({
                            url: "SalesStock",
                            method: "GET",
                            data: {stock: pro},
                            success: function (dataStock) {
//                                           console.log(data);
                                console.log(dataStock);
                                $('#qttt').val(dataStock);
                            }
                        });
                        //                        console.log(data);
                    });
                    
                    
                    $("#myform").on('submit', function (event) {
                        var pro1 = $('#pro_name').val();
                        var sub_total11 = document.getElementById('sub_total').value;
                        event.preventDefault();
                        var f = qtty;
                        console.log(f);
                        console.log(pro1);
                        console.log(sub_total11);
                        
                        $.ajax({
                            url: "UpdateStock",
                            data: {Operation:f,id:pro1,total:sub_total11},
                            type: "GET",
                            success: function (data) {
                                 $('#qttt').val(data);
                            }
                           
                        });
                    });


                });

            </script>
        </main>
    </body>
</html>
