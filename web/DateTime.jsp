<%-- 
    Document   : DateTime
    Created on : Mar 23, 2022, 12:27:57 AM
    Author     : Sagar Timalsina
--%>
<%@page import="sun.util.BuddhistCalendar"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <% //    response.setIntHeader("Refresh", 1);
                       // Get current time
                       Calendar calendar = new GregorianCalendar();
                       String am_pm;
                       int hour = calendar.get(Calendar.HOUR);
                       int minute = calendar.get(Calendar.MINUTE);
                       int second = calendar.get(Calendar.SECOND);
                       
                       if(calendar.get(Calendar.AM_PM) == 0)
                          am_pm = "AM";
                       else
                          am_pm = "PM";
                       String CT = hour+":"+ minute +":"+ second +" "+ am_pm+" ";
                       out.println("Crrent Time: " + CT );%>
    </body>
</html>
