<%-- 
    Document   : newcompany
    Created on : 7 Apr, 2024, 4:55:21 PM
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
          <%@page  import="java.util.*,java.sql.*" %>
        <%
        try{
         String nm=request.getParameter("company_name");
         String cl=request.getParameter("location");
         String add=request.getParameter("address");
         String city=request.getParameter("city");
         String gst=request.getParameter("GSTNO");
         String ydate=request.getParameter("date");
         String cdate=request.getParameter("cdate");
         
         
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
                Statement st=con.createStatement();
                String sql="insert into camp(Name,Location,Address,City,GSTNO,Yeardate,closedate)value('"+nm+"','"+cl+"','"+add+"','"+city+"','"+gst+"','"+ydate+"','"+cdate+"')";
                st.executeUpdate(sql);
                out.print("data interted Successfully");
                con.close();
            }
            catch(Exception e){
                out.print(e);
            }
        %>
        
        %>
    </body>
</html>
