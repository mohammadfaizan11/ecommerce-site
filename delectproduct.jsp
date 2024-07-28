<%-- 
    Document   : delectproduct
    Created on : 16 Mar, 2024, 3:53:03 PM
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
       <%@page import="java.util.*,java.sql.*" %>
      <%
           int id=Integer.parseInt(request.getParameter("id"));      
        try 
   {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
           Statement st = con.createStatement();
           String sql = "delete from product where id="+id;
           st.execute(sql);
           out.print("Your Data is Delected");
           con.close();
    }   
   catch(Exception e)
   {
   
   System.out.print(e);
   
   }
        %>

    </body>
</html>
