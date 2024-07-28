 <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Retrieve form data
    String productId = request.getParameter("product_id");
    int quantity = Integer.parseInt(request.getParameter("quantity"));

    // JDBC Connection
    Connection connection = null;
    Statement statement = null;

    try {
        Class.forName("your.database.driver.ClassName");
        connection = DriverManager.getConnection("your_database_url", "username", "password");
        statement = connection.createStatement();

        // Retrieve product details
        ResultSet resultSet = statement.executeQuery("SELECT * FROM products WHERE product_id=" + productId);

        if (resultSet.next()) {
            String productName = resultSet.getString("product_name");
            double price = resultSet.getDouble("price");

            // Calculate total price
            double totalPrice = price * quantity;

            // Save sale record
            statement.executeUpdate("INSERT INTO sales (product_id, quantity, total_price, sale_date) VALUES (" + productId + ", " + quantity + ", " + totalPrice + ", NOW())");

            // Display success message or redirect to a confirmation page
            out.println("<h2>Product added to cart successfully!</h2>");
            out.println("<p>Product: " + productName + "<br>Quantity: " + quantity + "<br>Total Price: " + totalPrice + "</p>");
        } else {
            out.println("<h2>Error: Product not found!</h2>");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
