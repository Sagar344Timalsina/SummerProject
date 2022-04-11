<%-- 
    Document   : PanelAdmin
    Created on : Mar 20, 2022, 6:47:27 PM
    Author     : Sagar Timalsina
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>

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

    <body onload="startTime()">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");
            if (session.getAttribute("usename") == null) {
                response.sendRedirect("index.html");
            }
        %>
        <!-- -------navbar------- -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container-fluid">
                <!-- Offcanvas Trigger -->
                <button class="navbar-toggler me-3" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
                    <span class="navbar-toggler-icon" data-bs-target="#offcanvasExample"></span>
                </button>
                <!-- Offcanvas Trigger -->
                <a class="navbar-brand fw-bold  me-auto text-uppercase mb-2 fs-4" href="AdminPanel.jsp">Grocery-E-Khata</a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <form class="d-flex ms-auto p-2">
                        <div class="input-group my-3 my-lg-0 text-white  ">

                            <span id="txt"class="px-4 pt-1 fs-5" ></span>
                            <h3 class="">Hello

                                ${usename}!</h3> 
                        </div>
                    </form>
                    <ul class="navbar-nav px-2 mb-lg-0">

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                               data-bs-toggle="dropdown" aria-expanded="true">
                                <i class="bi bi-person-circle "></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="EmployeeProfile.jsp"><span><i class="px-2 bi bi-people"></i></span>Profile</a></li>
                                <hr class="dropdown-divider">
                                <li><a class="dropdown-item" href="Logout.jsp">
                                        <span><i class="bi bi-box-arrow-in-left px-2"></i></span>Logout</a></li>
                                <li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- -------navbar------- -->

        <!----- offcanvas menu ------>
        <div class="offcanvas offcanvas-start bg-dark text-white nav-sidebar" tabindex="1" id="offcanvasExample"
             aria-labelledby="offcanvasExampleLabel">

            <div class="offcanvas-body p-0">
                <nav class="navbar-dark">
                    <ul class="navbar-nav">
                        <li>
                            <div class="text-muted small  fw-bold text-uppercase px-3 pt-3">
                                CORE
                            </div>
                        </li>
                        <li>
                            <a href="AdminPanel.jsp" class="nav-link px-3 active">
                                <span>
                                    <i class="bi bi-columns-gap"></i>
                                </span>
                                <span class="px-2 fs-5">
                                    Dashboard
                                </span>
                            </a>
                        </li>
                        <li class="my-2">
                            <hr class="dropdown-divider">
                        </li>
                        <li>
                            <div class="text-muted small fw-bold text-uppercase px-3 my-2 fs-4">
                                Layouts
                            </div>
                        </li>
                        <li>
                            <a href="Accounts.jsp" class="nav-link px-3 m-2 fs-5 ">
                                <span>
                                    <i class="bi bi-journal-text"></i>
                                </span>
                                <span class="px-2">
                                    Accounts
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="CustomerList.jsp" class="nav-link px-3 m-2 fs-5 ">
                                <span>
                                    <i class="bi bi-person-square"></i>
                                </span>
                                <span class="px-2">
                                    Customer
                                </span>
                            </a>
                        </li>


                        <li>
                            <a href="category.jsp" class="nav-link px-3 m-2 fs-5 ">
                                <span>
                                    <i class="bi bi-bag"></i>
                                </span>
                                <span class="px-2">
                                    Category
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="Sub_Category.jsp" class="nav-link px-3 m-2 fs-5 ">
                                <span>
                                    <i class="bi bi-bag-check-fill"></i>
                                </span>
                                <span class="px-2">
                                    Sub-Category
                                </span>
                            </a>
                        </li>
                        <li>
                        <li>
                            <a href="Product.jsp" class="nav-link px-3 m-2 fs-5 ">
                                <span>
                                    <i class="bi bi-cart4"></i>
                                </span>
                                <span class="px-2">
                                    Products
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#" id="sidebar-link" class="nav-link px-3 m-2 fs-5 sidebar-link "
                               data-bs-toggle="collapse" data-bs-target="#Sales" aria-expanded="false"
                               aria-controls="collapseExample">
                                <span>
                                    <i class="bi bi-bar-chart"></i>
                                </span>
                                <span class="px-2">
                                    Sales
                                </span>
                                <span class="right-icon ms-auto">
                                    <i class="bi bi-chevron-down"></i>
                                </span>
                            </a>

                            <div class="collapse text-muted" id="Sales">
                                <div>
                                    <ul class="navbar-nav ps-3">
                                        <li>
                                            <a href="AddSales.jsp" class="nav-link px-4">
                                                <span class="me-2">

                                                </span>
                                                <span>
                                                    Add Sales 
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="nav-link px-4">
                                                <span class="me-2">

                                                </span>
                                                <span>
                                                    Sales Management 
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>     

                        <li>
                            <a href="supplierAdd.jsp" class="nav-link px-3 m-2 fs-5 ">
                                <span>
                                    <i class="bi bi-person-square"></i>
                                </span>
                                <span class="px-2">
                                    Supplier
                                </span>
                            </a>
                        </li>

                        <li>
                            <a href="" id="sidebar-link" class="nav-link px-3 m-2 fs-5 "
                               data-bs-toggle="collapse" data-bs-target="#collaps" aria-expanded="false"
                               aria-controls="collapseExample">
                                <span>
                                    <i class="bi bi-book"></i>
                                </span>
                                <span class="px-2">
                                    Report
                                </span>
                                <span class="right-icon ms-auto">
                                    <i class="bi bi-chevron-down"></i>
                                </span>
                            </a>

                            <div class="collapse text-muted" id="collaps">
                                <div>
                                    <ul class="navbar-nav ps-3">
                                        <li>
                                            <a href="ReportGenerationDaily.jsp" class="nav-link px-4">
                                                <span class="me-2">

                                                </span>
                                                <span>
                                                    Daily sales
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="ReportGenerationMonthly.jsp" class="nav-link px-4">
                                                <span class="me-2">

                                                </span>
                                                <span>
                                                    Monthly Sales 
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>

                        </li>
                    </ul>


                </nav>

            </div>
        </div>
        <!----- offcanvas menu ------>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <script>
        function startTime() {
            const today = new Date();
            let h = today.getHours();
            let m = today.getMinutes();
            let s = today.getSeconds();
            let session1 = "AM";
            m = checkTime(m);
            s = checkTime(s);
            if (h === 0) {
                h = 12;
            }
            if (h > 12) {
                h = h - 12;
                session1 = "PM";
            }
            document.getElementById('txt').innerHTML = h + ":" + m + ":" + s + " " + session1;
            setTimeout(startTime, 1000);
        }

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i
            }
            ;  // add zero in front of numbers < 10
            return i;
        }
        </script>
    </body>

</html>