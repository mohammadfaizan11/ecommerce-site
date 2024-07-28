<%-- 
    Document   : productupdate
    Created on : 9 Mar, 2024, 8:18:52 PM
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
         int id1=Integer.parseInt(request.getParameter("id1"));
         String nm=request.getParameter("name");
         int que=Integer.parseInt(request.getParameter("Quantity"));
         String cat=request.getParameter("catagery");
         String pri=request.getParameter("Price");
         PreparedStatement ps = null;
   
        try 
   {
       
 Class.forName("com.mysql.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
String sql=" Update product SET id=?,Name=?,Quantity=?,Catagrey=?,Prices=?,where ID="+id;
ps=con.prepareStatement(sql);
ps.setInt(1,id1);
ps.setString(2,nm);
ps.setInt(3,que);
ps.setString(4,cat);
ps.setString(5,pri);



int i=ps.executeUpdate();

if(i>0)
{
out.print("Employee Record Update successfully...");
}
else
{
out.print("Problem in updating Records...");

}

 con.close();
    }   
   catch(Exception e)
   {
   
   System.out.print(e);
   
   }
        %>
    </body>

    </body>
</html>


