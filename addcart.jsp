<%-- 
    Document   : addcart
    Created on : 11 Mar, 2024, 7:55:05 PM
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
        <h1>Order List</h1>
         <%@page import="java.util.*,java.sql.*" %>
        <%
          int Total=0;
          int id=Integer.parseInt(request.getParameter("id"));
    try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = null;
        %>
        <table border="">

            <tbody>
                <tr class="t1">
                    <td>Product ID</td>
                    <td>Product Name</td>
                    <td>PRoduct Prices</td>
                     <td>PRoduct Quantity</td>
                      <td>Sub Total</td>
                    <td>Action</td>
                </tr>
            </tbody>
            <%
                String sql = "select product.ID,product.Name,product.prices,addcart.Quantity,addcart.SubTotal from product inner join addcart ON product.ID=addcart.ID where ID="+id;
                rs = st.executeQuery(sql);
                while (rs.next()) {
            %>
            <tr class="t2">
                <td ><%=rs.getString("id")%></td>
                <td><%=rs.getString("Name")%></td>
                <td><%=rs.getString("Prices")%></td>
                   <td><%=rs.getString("Quantity")%></td>
                      <td><%=rs.getString("SubTotal")%></td>

                <td><a class="update" href="updateProduct.jsp?id=<%=rs.getString("id")%>"> ADD</a></td>
<tr>                <%
                        }
                        con.close();
                    }

                catch (Exception e) {
                        out.print(e);
                    }

                %>
    </body>
</html>
