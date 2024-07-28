<%-- 
    Document   : billing
    Created on : 25 Mar, 2024, 12:01:32 AM
    Author     : VICTUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function clac(v){
                var  index=$(v).parent().parent().index();
                var qty =document.getElementByName("qty");
                  var rate =document.getElementByName("rate");
                  var amt= qty * rate;
                  document.getElementById("amount").value=amt;
                  
            }
            </script>
    </head>
    <body>
          <%@page import="java.util.*,java.sql.*" %>
    <h1>Invoice Calculator</h1>
    <table>
        <thead>
            <tr>
                 <th>Item ID</th>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Rate</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody id="invoiceItems">
            <%-- JSP code to fetch invoice items from the database and populate the table --%>
            <%              
                int id=Integer.parseInt(request.getParameter("id"));
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
                Statement st = con.createStatement();
                ResultSet item = null;
                String sql = "select * from product where id="+id ;
                item = st.executeQuery(sql);
                  
              
                while (item.next()) {
                  
            %>
            <tr class="invoice-item">
                <td ><%=item.getInt("id")%></td>
                <td><%=item.getString("Name")%></td>
                <td><input type="number" class="qty" name="qty" value="" onchange="calc()"></td>
                <td><input type="number" class="rate" name="rate" value="" onchange="calc()"></td>
                <td><input type="number"  id="amount" class="amount" name="amount" value="" onchange="calc()"></td>
                    
            </tr>
            <% } %>
        </tbody>
    </table>
<!--    <p>Total: <span id="totalAmount"></span></p>-->
          Total<input type="text" name="Total"  class="totalAmount" id="totalAmount" value="" />
    </body>
</html>
