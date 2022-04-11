<%-- 
    Document   : NotificationCrCustomer
    Created on : Apr 4, 2022, 8:01:06 PM
    Author     : Sagar Timalsina
--%>

<%@page import="org.json.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<%@page import="org.json.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <%!
            JSONArray listt = new JSONArray();
            Connection con;
            Statement stmt;
            ResultSet rs;

            public Connection getConnection() {
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
            String sql = " select cus_name,cus_amount from customer where c_id in(select cus_id from creditpayment); ";
            if (con != null) {
                try {
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(sql);
                    
                    while(rs.next()){
                        String name=rs.getString(1);
                        float amount=rs.getFloat(2);
                        JSONObject obj=new JSONObject();
                        obj.put("name",name);
                        obj.put("amount",amount);
                       listt.put(obj);
                    }
                    out.println(listt.toString());
                   

                } catch (Exception e) {
                    e.printStackTrace();

                }

            }

        %>
    </body>
</html>
