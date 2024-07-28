<%-- 
    Document   : newjsp
    Created on : 25 Mar, 2024, 11:46:14 PM
    Author     : VICTUS
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<html>
<head>
    <title>Product List with Quantity and Subtotal</title>
    <style>
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>

<%
    // Establish connection to MySQL database
    Connection conn = null;
    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","");
                Statement st=con.createStatement();  Class.forName("com.mysql.jdbc.Driver");
                 ResultSet rs = st.executeQuery("SELECT id, name, price FROM product");
%>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
        </tr>
    </thead>
    <tbody>
<%
        // Display product data and input fields for quantities
        while(rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
%>
        <tr>
            <td><%= id %></td>
            <td><%= name %></td>
            <td>$<%= price %></td>
            <td><input type="number" name="quantity_<%= id %>" value="0"></td>
            <td id="subtotal_<%= id %>">$0.00</td>
        </tr>
<%
        }
%>
    </tbody>
</table>

<script>
    // Calculate subtotal for each product based on quantity entered
    function calculateSubtotal(id) {
        var quantity = document.querySelector('input[name="quantity_' + id + '"]').value;
        var price = <%= price %>; // Replace with actual price from database
        var subtotal = quantity * price;
        document.getElementById('subtotal_' + id).innerHTML = '$' + subtotal.toFixed(2);
    }

    // Attach event listeners to input fields for quantity
<%
    rs.beforeFirst(); // Reset ResultSet cursor
    while(rs.next()) {
        int id = rs.getInt("id");
%>
    document.querySelector('input[name="quantity_<%= id %>"]').addEventListener('input', function() {
        calculateSubtotal(<%= id %>);
    });
<%
    }
%>
</script>

<%
        // Close JDBC objects
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>
