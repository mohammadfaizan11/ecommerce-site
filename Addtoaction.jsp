 <%-- 
    Document   : Addtoaction
    Created on : 13 Mar, 2024, 5:02:14 PM
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
            String nam=request.getParameter("name");
            int Quantity = 2;
            int Product_prices = 0;
            int product_total = 0;
            int cart_Total = 0;

            int z = 0;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
                Statement st = con.createStatement();
                ResultSet rs =st.executeQuery("select * from product where ID ='"+id+"'");
//                String sql = "select * from product where ID ="+id;
//                rs = st.executeQuery(sql);
                while (rs.next()) 
                {

                    Product_prices = rs.getInt(5);
                    product_total = Product_prices;
                }

                ResultSet rs1 = null;
                String sql1 = " select * from cart where Product_id="+id;
                rs1 = st.executeQuery(sql1);
                while (rs1.next()) {
                    cart_Total = rs.getInt(4);
                    cart_Total = cart_Total + product_total;
                    Quantity = rs.getInt(2);
                    Quantity = Quantity + 1;
                    z = 1;

                }
                if (z == 1) {
                    st.executeUpdate("update cart set sub_total='"+cart_Total+"' Total='"+product_total+"',Quantity='" + Quantity + "' where Product_id='"+id+"'");
                }
                if (z == 0) {
                    PreparedStatement ps = con.prepareStatement("insert into cart(Product_id,Product_Name,Quantity,Prices,Total,sub_total) value(?,?,?,?,?)");
                    ps.setInt(1, id);
                    ps.setString(2,nam);
                    ps.setInt(3, Quantity);
                    ps.setInt(4, Product_prices);
                    ps.setInt(5, product_total);
                    ps.setInt(6, cart_Total);
                    ps.executeUpdate();

                }
            } catch (Exception e) {

                System.out.print(e);

            }
        %>






    </body>
</html>
