<%-- 
    Document   : Logout
    Created on : Mar 18, 2022, 5:12:59 PM
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
        <%
//            String n=(String)session.getAttribute("usename");
             session.removeAttribute("usename");
            session.invalidate();
            response.sendRedirect("index.html");
            
        %>
    </body>
</html>
