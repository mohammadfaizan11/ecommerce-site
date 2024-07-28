<%-- 
    Document   : demobill
    Created on : 23 Mar, 2024, 11:54:17 PM
    Author     : VICTUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice Calculator</title>
            <style>
table {
  border-collapse: collapse;
  width: 100%;
  margin-top: 7rem;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color:#8b9ffa}

th {
    background-color:#5ad8a0;
  color: black;
}
.total{
    /*width: 40%;*/
    /*margin-left:50rem;*/
    box-sizing: border-box;
    text-align: end;
    /*justify-content:right;*/

}
.totalAmount{
    padding: 5px;
   
   margin-top: 0.5rem;
}
 .print{
    background-color: blue;
    padding: 5px;
    border: 1px solid black;
    border-radius: 10px;
    color: white;
    font-size: 15px;
    cursor: pointer;
}
            </style>
   
</head>
<body>

      <%@page import="java.util.*,java.sql.*" %>
    <h1></h1>
    <table border="1">
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
                try  {          
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
                <td><input type="number" class="qty" name="qty" value="" onchange="calculateInvoice()"></td>
                <td><input type="number" class="rate" name="rate" value="" onchange="calculateInvoice()"></td>
                <td><input type="number"   class="amount" name="rate" value=""></td>
                    
            </tr>
            
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        out.print(e);
                    }

                %>
           
        </tbody>
    </table>
                <!--    <p>Total: <span id="totalAmount"></span></p>-->
<div class="total">
<label for="id">Total:</label>
<input type="text" name="Total"  class="totalAmount" id="totalAmount" value="" /><br>
<label for="id">GST:</label>
<input type="text" name="Total"  class="totalAmount" id="totalAmount" value="" /><br>
<label for="id">Net Amt:</label>
<input type="text" name="Total"  class="totalAmount" id="totalAmount" value="" /><br>
</div>
                <button id="printButton" class="print">Print</button>
</body>
 <script>
        // Function to calculate invoice amount and total
        function calculateInvoice() {
            
            let totalAmount = 0;

            items.forEach(item => {
                var qty = document.getElementByName("qta").value);
                var rate = document.getElementByName("rate").value);
                var amount = qty * rate;
               document.getElementByName("amount").textContent = amount.toFixed(2);
                totalAmount += amount;
            });

            document.getElementById('totalAmount').textContent = totalAmount.toFixed(2);
        }

</script>
<script>
      document.getElementById("printButton").addEventListener("click", function() {
       window.print();
});
    </script>
</html>
