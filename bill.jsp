<%-- 
    Document   : bill
    Created on : 23 Mar, 2024, 1:17:09 PM
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
      <form name="bill" onchange="Calc(rowNumber)">
      
        <%
            int id=Integer.parseInt(request.getParameter("id"));
    try
          {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = null;
        %>
        <table border="">

            <tbody>
                <tr>
                    <td>Product ID</td>
                    <td>Product Name</td>
                    <td>PRoduct Quantity</td> 
                    <td>PRoduct Prices</td> 
                    <td>Amount</td>
                </tr>
            </tbody>
            <%
                String sql = "select * from product where id="+id ;
                rs = st.executeQuery(sql);
                while (rs.next()) {
            %>
            <tr class="t2">
                <td ><%=rs.getInt("id")%></td>
                <td><%=rs.getString("Name")%></td>
                <td><input type="text" name="Quantity" id="quantity" value="" onchange="Calc(this)"></td>
                <td><input type="text" name="Prices" id="Prices" value="<%=rs.getString("Prices")%>" onchange="Calc(this)"> </td>
                <td><input type="text" name="Amount" id="amount" value="" onchange="Calc(this)"></td>
                <!--<td><input type="text" name="Amount" id="Amount" value=""   onchange="Calc(this);"></td>-->

            </tr>

              
                 <%
                        }
                        con.close();
                    } 
                catch (Exception e) 
                   {
                        out.print(e);
                    }

                %>
<!--                <input type="text" name="totalAmount" id="totalAmount" value="" />-->
                 </form>
                
                <script>
              Funcition Calc(rowNumber){
                  
            var quantity = parseFloat(document.getElementById("quantity" + rowNumber).value);
            var rate = parseFloat(document.getElementById("Prices" + rowNumber).value);
//            var qty =decument.getElementByName("Quantity")[index].value;
//                  var Pri =decument.getElementByName("Prices")[index].value;
                  
              var amount = quantity * rate;
              document.getElementById("amount" + rowNumber).value = amount.toFixed(2);

                  
              }
                    
                    
                    
                </script>
    </body>
</html>
