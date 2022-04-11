<%-- 
    Document   : modalCustomer
    Created on : Apr 1, 2022, 10:11:11 PM
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
        <%@include  file="PanelAdmin.jsp"%>
        <main class="mt-5 pt-3">
        <button class="btn btn-primary col-md-12  my-2" type="submit" data-bs-toggle="modal" data-bs-target="#exampleModal">Pay</button>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="POST" action="CustomerUpdate">
                            Customer name
                            <input type="text" name="fname" class="form-control my-3 py-2" placeholder="First Name">
                            <label>Phone Number</label>
                            <input type="text" name="phone" class="form-control my-3 py-2"
                                   placeholder="Phone Number">
                            <label>Amount</label>
                            <input type="text" name="amt" class="form-control my-3 py-2" placeholder="Amount">
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <input type="submit" class="btn btn-primary" value="Add Customer">
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
        </main>
    </body>
</html>
