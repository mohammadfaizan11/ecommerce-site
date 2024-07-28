<%-- 
    Document   : showcompany
    Created on : 8 Apr, 2024, 1:02:07 PM
    Author     : VICTUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>company</title>
        <style>
/*            body{
            box-sizing: border-box;
            margin-left: 25rem;
            margin-top: 5rem;
            }*/

            table {
  border-collapse: collapse;
   width: 50%;
   justify-content: center;
   margin-top: 10rem;
   margin-left: 25rem;
   
}

th, td {
  text-align: left;
  padding: 8px;
}
th, td t2 {
  text-align: left;
  padding: 8px;
  width: 5rem;
  margin-right: -5rem;
}
tr:nth-child(even){background-color:#8b9ffa}

th {
    background-color:#00cba9;
  color: white;
}
 header {
  
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color:#ccffcc;
 
}
.navbar {
 display: flex;
 justify-content: space-between;
 align-items: center;
 margin: 0 auto;
 padding: 5px 15px;
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
color:#00ff33;
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
                    <th>Company Name </th>
                    <th>Faizancial Year</th>
                </tr>
            </tbody>
            <%
                String sql = "select * from camp";
                rs = st.executeQuery(sql);
                while (rs.next()) {
            %>
            <tr>
                
                <td><%=rs.getString("Name")%></td>
                <td class="t2"><%=rs.getString("Yeardate")%></td>
                
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
