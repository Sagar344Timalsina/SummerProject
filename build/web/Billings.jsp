<%-- 
    Document   : Billings
    Created on : Apr 2, 2022, 12:03:07 PM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="PanelAdmin.jsp" %>
        <main class="mt-5 pt-5">
            <div class="container col-lg-8 col-md-10">
                <button class="btn btn-primary p-2 mb-3">Download pdf</button>
                <div class="card">
                    <div class="card-header">
                        Bills
                    </div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-sm-6">
                                <h6 class="mb-3">From:</h6>
                                <div>
                                    <strong>Grocery-E-Khata</strong>
                                </div>
                                <div>Purano Naikap,Kathmandu</div>
                                <div>Email: info@webz.com.pl</div>
                                <div>Phone: 9841125252</div>
                            </div>

                            <div class="col-sm-6">
                                <h6 class="mb-3">To:</h6>
                                <div>
                                    <strong>Bob Mart</strong>
                                </div>
                                <div>Attn: Daniel Marek</div>
                                <div>43-190 Mikolow, Poland</div>
                                <div>Email: marek@daniel.com</div>
                                <div>Phone: +48 123 456 789</div>
                            </div>



                        </div>

                        <div class="table-responsive-sm" id="mdiv">
                            <!--                            <table class="table table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th class="center">#</th>
                                                                    <th>Item</th>
                                                                    <th>Description</th>
                            
                                                                    <th class="right">Unit Cost</th>
                                                                    <th class="center">Qty</th>
                                                                    <th class="right">Total</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td class="center">1</td>
                                                                    <td class="left strong">Origin License</td>
                                                                    <td class="left">Extended License</td>
                            
                                                                    <td class="right">$999,00</td>
                                                                    <td class="center">1</td>
                                                                    <td class="right">$999,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="center">2</td>
                                                                    <td class="left">Custom Services</td>
                                                                    <td class="left">Instalation and Customization (cost per hour)</td>
                            
                                                                    <td class="right">$150,00</td>
                                                                    <td class="center">20</td>
                                                                    <td class="right">$3.000,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="center">3</td>
                                                                    <td class="left">Hosting</td>
                                                                    <td class="left">1 year subcription</td>
                            
                                                                    <td class="right">$499,00</td>
                                                                    <td class="center">1</td>
                                                                    <td class="right">$499,00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="center">4</td>
                                                                    <td class="left">Platinum Support</td>
                                                                    <td class="left">1 year subcription 24/7</td>
                            
                                                                    <td class="right">$3.999,00</td>
                                                                    <td class="center">1</td>
                                                                    <td class="right">$3.999,00</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>-->
                            <table class="col-md-12" id="fetch" border="2" cellspacing="1" cellpadding="8"  >
                                <thead>
                                    <tr>
                                        
                                        <th>Pro_Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-sm-5">

                            </div>

                            <div class="col-lg-4 col-sm-5 ml-auto my-3">
                                <table class="table table-clear">
                                    <tbody>
                                        <tr>
                                            <td class="left">
                                                <strong>Subtotal</strong>
                                            </td>
                                            <td class="right" id="sub-total"></td>
                                        </tr>
                                        <tr>
                                            <td class="left">
                                                <strong>Discount</strong>
                                            </td>
                                            <td class="right" id="disc"></td>
                                        </tr>
                                        <tr>
                                            <td class="left">
                                                <strong>Total</strong>
                                            </td>
                                            <td class="right">
                                                <strong id="total"></strong>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td class="left">
                                                <strong>Paid</strong>
                                            </td>
                                            <td class="right">
                                                <strong id="paid"></strong>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td class="left">
                                                <strong>Balance</strong>
                                            </td>
                                            <td class="right">
                                                <strong id="bal"></strong>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>
            const bodytable = document.querySelector("tbody");
           
            const n = 4;
            var storedPlayerArray = JSON.parse(localStorage.getItem("playerNameArray"));
            
            var dis = JSON.parse(localStorage.getItem("discount"));
            var paidd = JSON.parse(localStorage.getItem("paid"));
            var balan = JSON.parse(localStorage.getItem("crbalance"));
            
            var sub = JSON.parse(localStorage.getItem("sub_total"));
            console.log(sub);
            var total = JSON.parse(localStorage.getItem("total"));
            var a = storedPlayerArray.length;
            fetch = document.getElementById('fetch');
            const result = new Array(Math.ceil(storedPlayerArray.length / n))
                    .fill()
                    .map(_ => storedPlayerArray.splice(0, n));
            
             for(var i=0; i <result.length; i++){
            var newRow = fetch.insertRow(fetch.length);
            for(var j=0; j<result[i].length; j++){
                var cell = newRow.insertCell(j);
                cell.innerHTML = result[i][j];
            }
        }
       document.getElementById("disc").innerHTML+=dis;
       document.getElementById("sub-total").innerHTML+=total;
       document.getElementById("total").innerHTML+=sub;
       document.getElementById("paid").innerHTML+=paidd;
       document.getElementById("bal").innerHTML+=balan;
       
        
     
        </script>
    </body>
</html>
