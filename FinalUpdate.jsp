<%-- 
    Document   : FinalUpdate
    Created on : 14 Mar, 2024, 11:52:17 PM
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
                int id1=Integer.parseInt(request.getParameter("id"));
                int id=Integer.parseInt(request.getParameter("id1"));
                String nam = request.getParameter("Name");
                int sto = Integer.parseInt(request.getParameter("stock"));
                String cat = request.getParameter("Catagery");
                String pri= request.getParameter("Prices");
                String cost = request.getParameter("cost");
    try 
   {
       
 Class.forName("com.mysql.jdbc.Driver");
 Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
String sql=" Update product SET ID=?,Name=?,stock=?,catagery=?,Prices=?,Product_Cost=? where ID="+id1;
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,id);
ps.setString(2,nam);
ps.setInt(3,sto);
ps.setString(4,cat);
ps.setString(5,pri);
ps.setString(6,cost);

int i=ps.executeUpdate();

if(i>0)
{
out.print("Product Udpade Successfully");
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
</html>
