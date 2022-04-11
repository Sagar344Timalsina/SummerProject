<%-- 
    Document   : SignIn
    Created on : Mar 14, 2022, 3:53:28 PM
    Author     : Sagar Timalsina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SigIn</title>
    </head>
    <body>
        <h1>SignIn</h1>
        <form action="EmpServlet" method="POST">
            Username<input type="text" name="name"><br>
            Password<input type="password" name="pass1"><br>
            confirm-Password<input type="password" name="pass2"><br>
            <input type="Submit" value="Submit">
        </form>
    </body>
</html>-->
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SignIn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <section>
        <div class="container pt-4">
            <div class="row">
                <div class="col-12 col-sm-8 col-md-6 m-auto">
                    <div class="card">
                        <div class="card-body border-0 shadow  ">
                            <svg class="mx-auto my-0 " xmlns="http://www.w3.org/2000/svg" width="50" height="40" fill="currentColor" class="bi bi-person-badge" viewBox="0 0 16 16">
                                <path d="M6.5 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1h-3zM11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                <path d="M4.5 0A2.5 2.5 0 0 0 2 2.5V14a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2.5A2.5 2.5 0 0 0 11.5 0h-7zM3 2.5A1.5 1.5 0 0 1 4.5 1h7A1.5 1.5 0 0 1 13 2.5v10.795a4.2 4.2 0 0 0-.776-.492C11.392 12.387 10.063 12 8 12s-3.392.387-4.224.803a4.2 4.2 0 0 0-.776.492V2.5z"/>
                              </svg>
                              <h2 class="text-center text-muted font-weight-bold">Sign In</h2>
                            <form action="EmpServlet"  onsubmit="return validate()" method="POST">
<!--                                <input type="text" name="name" id="" class="form-control my-4 py-2" placeholder="Username" autocomplete="off">
                                <input type="password" name="pass1" id="" class="form-control my-4 py-2" placeholder="Password" autocomplete="off">
                                <input type="password" name="pass2" id="" class="form-control my-4 py-2" placeholder="Confirm-Password" autocomplete="off">
                                <div class="text-center mt-3">
                                    <input type="submit" class="btn btn-primary mb-2 " value="Sign In">
                                    <a href="index.html" class="nav-link mb-3">Already have an account?</a>
                                </div>-->
                                <span id="username" class="text-danger fs-5 fw-bold"> </span>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control " id="nam" name="name" placeholder="Username"
                                        autocomplete="off">
                                    <label for="floatingInput">Username</label>
                                </div>
                                <span id="address" class="text-danger fs-5 fw-bold"> </span>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control " id="add" name="address" placeholder="address"
                                        autocomplete="off">
                                    <label for="floatingInput">Address</label>
                                </div>
                                <span id="email" class="text-danger fs-5 fw-bold"> </span>
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="mail" placeholder="Email"
                                        autocomplete="off" name="email">
                                    <label for="floatingInput">Email</label>
                                </div>
                                <span id="password" class="text-danger fs-5 fw-bold"> </span>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control " autocomplete="off" id="pas1" name="pass1"
                                        placeholder="Password">
                                    <label for="floatingInput">Password</label>
                                </div>
                                <span id="con-password" class="text-danger fs-5 fw-bold"> </span>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control text-muted " autocomplete="off" id="pas2"
                                        name="pass2" placeholder="Confirm-Password">
                                    <label for="floatingInput">Confirm-Password</label>
                                </div>
                                <div class="text-center mt-3">
                                    <input type="submit" class="btn btn-primary mb-2 " value="Sign In">
                                    <a href="#" class="nav-link mb-3">Already have an account?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
<script>

        function validate(){
            var name=document.getElementById('nam').value;
            var pass1=document.getElementById('pas1').value;
            var pass2=document.getElementById('pas2').value;
            var add=document.getElementById('add').value;
            var email=document.getElementById('mail').value;
            //Name---------
            if (name == "") {
                document.getElementById("username").innerHTML = " **Please fill the Username**";
                return false;
            }
            if (name.length < 2 || name.length>20) {
                document.getElementById("username").innerHTML = " **Username must be greater than 2 character and less than 20**";
                return false;
            }
            if (!isNaN(name)) {
                document.getElementById("username").innerHTML = " **Username must be character**";
                return false;
            }
            // Address---------
            if (add == "") {
                document.getElementById("address").innerHTML = " **Please fill the Address**";
                return false;
            }
            //password----------
            if ((pass1 == "" )) {
                document.getElementById("password").innerHTML = " **Please fill the Password**";
                return false;
            }
            if ((pass2 == "" )) {
                document.getElementById("con-password").innerHTML = " **Please fill the Confirm-Password** ";
                return false;
            }
            if (pass1!=pass2 ) {
                document.getElementById("password").innerHTML = " **Please fill the Correct Password** ";
                document.getElementById("con-password").innerHTML = " **Please fill the Correct Password** ";
                return false;
            }
            if (pass1.length < 6 || pass1.length>20) {
                document.getElementById("password").innerHTML = " **Password must be greater than 6 and less than 20**";
                document.getElementById("con-password").innerHTML = " **Password must be greater than 2 and less than 20** ";
                return false;
            }
            //email---------
            var regx=/^[A-Za-z1-9_]{3,}@[A-Za-z1-9]{3,}[.]{1}[A-Za-z.]{2,6}$/;
                if(!regx.test(email)){
                    document.getElementById("email").innerHTML = " **Please fill the Correct Email** ";
                    return false;
                }
        }
    </script>
</body>

</html>
