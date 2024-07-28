<%-- 
    Document   : addorder
    Created on : 12 Mar, 2024, 4:16:04 PM
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

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
                Statement st = con.createStatement();
              
        %>
        <table border="">

            <tbody>
                <tr class="t1">
                    <td>Product ID</td>
                    <td>Product Name</td>
                    <td>Product Catagray</td>
                    <td>PRoduct Prices</td>
                     <td>Produc Quantity</td>
                     <td>Sub total</td>
                    <td>remove</td>
                </tr>
            </tbody>
            <%
                ResultSet rs =st.executeQuery("select * from product inner join cart on product.ID=cart.Product_id ");
                while (rs.next()) {
            %>
            <tr class="t2">
                <td ><%=rs.getInt("id")%></td>
                <td><%=rs.getString("Name")%></td>
                <td><%=rs.getString("catagery")%></td>
                <td><%=rs.getString("Prices")%></td>
                <td><a href="incDecQuantity.jsp?ID=<%=rs.getString("ID")%>">+</a><%=rs.getString("Quantity")%><a href="incDecQuantity.jsp?ID=<%=rs.getString("ID")%>&quantity=dec">-</a></td>
                <td><%=rs.getString("subtotal")%></td>
           <%
               }
%>
       </tbody>
   </table>
   
   
   
   <%
        con.close();
    }   
   catch(Exception e)
   {
   
   System.out.print(e);
   
   }
        %>
    </body>
</html>
