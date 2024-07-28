<%-- 
    Document   : showaddorder
    Created on : 14 Mar, 2024, 4:47:24 PM
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
                ResultSet rs = null;
        %>
        <table border="">

            <tbody>
                <tr class="t1">
                    <td>Product ID</td>
                    <td>Product Name</td>
                    <td>Product Stock </td>
                    <td>PRoduct Prices</td>
                    <td>PRoducts Total</td>
                    <td>Action</td>
                </tr>
            </tbody>
            <%
                String sql = "select * from cart";
                rs = st.executeQuery(sql);
                while (rs.next()) {
            %>
            <tr class="t2">
                <td ><%=rs.getString("Product_Id")%></td>
                <td><%=rs.getString("Product_Name")%></td>
                <td><input type="text" name="Quantity" value="<%=rs.getString("Quantity")%>"/></td>
                <td><%=rs.getString("Prices")%></td>
                <td><%=rs.getString("Total")%></td>
                    
                    <td><a href="#">Remove</a>
                
                
                   <%
                        }
                        con.close();
                    } catch (Exception e) {
                        out.print(e);
                    }

                %>
    </body>
</html>
