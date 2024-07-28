<%-- 
    Document   : admin
    Created on : 7 Mar, 2024, 11:29:37 PM
    Author     : VICTUS
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
           String admin=request.getParameter("adminname");
           String pass=request.getParameter("adminpass");
           if(admin.equalsIgnoreCase("Admin")&& pass.equals("Admin123"))
           {
           response.sendRedirect("AfterLoginadmin.html");
           }
           else
           {
            response.sendRedirect("invalid.jsp");
           }           
       
       %>
    </body>
</html>
