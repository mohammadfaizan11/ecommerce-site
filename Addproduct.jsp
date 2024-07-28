<%-- 
    Document   : Addproduct
    Created on : 9 Mar, 2024, 3:57:33 PM
    Author     : VICTUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   
    <body>
        <%@page  import="java.util.*,java.sql.*" %>
        <%
        try{
         int id=Integer.parseInt(request.getParameter("id"));
         String nm=request.getParameter("name");
         int sto=Integer.parseInt(request.getParameter("Stock"));
         String cat=request.getParameter("catagery");
         String pri=request.getParameter("Price");
         String gst=request.getParameter("GST");
         String mrp=request.getParameter("MRP");
         String pcost=request.getParameter("Pcost");

 
         
         
         
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
                Statement st=con.createStatement();
                String sql="insert into product(ID,Name,Stock,catagery,Prices,GST,Total,Product_Cost)value('"+id+"','"+nm+"','"+sto+"','"+cat+"','"+pri+"','"+gst+"','"+mrp+"','"+pcost+"')";
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
