<%-- 
    Document   : moreone
    Created on : 18 Mar, 2024, 4:46:20 PM
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
            int id = Integer.parseInt(request.getParameter("id"));
//            int quantity =Integer.parseInt(request.getParameter("Quantity"));

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(" SELECT * FROM product where ID ='" + id + "'");

                while (rs.next()) {
                     int quantity = rs.getInt("Quantity");
                    double amount = rs.getDouble("Prices");
                    double gstRate = rs.getDouble("GST");

                    double gstAmount = amount * gstRate / 100;
                    double totalItemAmount = amount + gstAmount;
                    double totalAmount = totalItemAmount * quantity;

                    String sql = " Update product SET ID=?,Quantity=?,Total=? where ID=" +id;
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setInt(1, id);
                    ps.setInt(6, quantity);
                    ps.setDouble(8, totalAmount);

                    int i = ps.executeUpdate();

                    if (i > 0) {
                        out.print("Product Udpade Successfully");
                    } else {
                        out.print("Problem in updating Records...");

                    }

                }
            } catch (Exception e) {

                System.out.print(e);

            }

        %>

    </body>
</html>
