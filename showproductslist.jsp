<%-- 
    Document   : showproductslist
    Created on : 9 Mar, 2024, 4:37:52 PM
    Author     : VICTUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

tr:nth-child(even){background-color:#99ff99}

th {
    background-color:#00CBA9;
  color: white;
}
 header {
  
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color:#00cba9;
  
 
}
.navbar {
 display: flex;
 justify-content: space-between;
 align-items: center;
 margin: 0 auto;
 padding: 0px 15px;
 /*color:#ff0033;*/
 
}
.navbar .links {

list-style: none;
display: flex;
gap:2rem;
margin-left: 25rem;


}
.links a{
text-decoration: none;
font-size: 20px;
color:#ffff33;
}
h2  a{
text-decoration: none;
color:#ffffff;
font-family:timesnewroman;
font-size: 30px;
}

.button a{
    text-decoration: none;
    color:#ffffff;
    font-size: 25px;
}
 .logo{
  font-family:"Lakki Reddy", serif;
  font-weight: 200;
  font-style:normal;
}
            </style>
    </head>
    <body>
          <header> 
            <nav class="navbar">
                <h2 class="logo"><a href="#">JK Mart </a></h2>
                <ul class="links">
                      <li><a href="index.html" >Home</a></li>
                    <li><a href="admin.html">Admin Login</a></li>
                    <li><a href="showcompany.jsp">company</a></li>
                    <li><a href="productList.jsp">All Product</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <div class="button">
                    <a href="admin.html"><i class='bx bx-user' style='color:#037b16'  ></i>ADMIN LOGIN</a>
                </div>
            </nav>
        </header>
         <%@page import="java.util.*,java.sql.*" %>
        <%
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
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Stock </th>
                    <th>Product Catagray</th>
                    <th>PRoduct Prices</th>
                     <th>GST</th>
                      <th>MRP</th>
                     <th>Produc Cost</th>  
                    <th>Action</th>
                </tr>
            </tbody>
            <%
                String sql = "select * from product";
                rs = st.executeQuery(sql);
                while (rs.next()) {
            %>
            <tr>
                <td ><%=rs.getString("id")%></td>
                <td><%=rs.getString("Name")%></td>
                <td><%=rs.getString("stock")%></td>
                <td><%=rs.getString("catagery")%></td>
                <td><%=rs.getString("Prices")%></td>
                <td><%=rs.getString("GST")%></td>
                <td><%=rs.getString("Total")%>
                
                <td><%=rs.getString("Product_Cost")%></td>
           
        
                

                <td><a class="update" href="updateProduct.jsp?id=<%=rs.getInt("id")%>">Update</a><a class="delete" href="delectproduct.jsp?id=<%=rs.getInt("id")%>">Delete</a></td>
</tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        out.print(e);
                    }

                %>
        </table>
    </body>
</html>
