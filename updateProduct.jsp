<%-- 
    Document   : updateProduct
    Created on : 9 Mar, 2024, 8:06:33 PM
    Author     : VICTUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
                 body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }
            .container {
                width:50rem;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h2 {
                text-align: center;
            }
            label {
                font-weight: bold;
            }
            input{
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }
            input[type="submit"] {
                width: 100%;
                background-color:#1809fc;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
            </style>
    </head>
    <body>
         <%@page import="java.util.*,java.sql.*" %>
          
        <%
           int id=Integer.parseInt(request.getParameter("id"));      
        try 
   {
       
      Class.forName("com.mysql.jdbc.Driver");
     
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
        
           Statement st = con.createStatement();
           String sql =" select * from product where ID="+id;
            
           ResultSet rs = null;
           rs = st.executeQuery(sql);
           
          
       
          %>
           <%
               while(rs.next())
               {
               
               %>
        
          
               <form action="FinalUpdate.jsp">
                   <div class="container">
                          <h2> Update Product</h2>
                   <input type=hidden name="id" value="<%=rs.getInt("ID")%>"<br>
                   Product ID: <input type="text" name="id1" value="<%=rs.getInt("ID")%>"/><br>
                   Product Name : <input type="text" name="Name" value="<%=rs.getString("Name")%>" /><br>
                     Product Stock : <input type="text" name="stock" value="<%=rs.getInt("stock")%>" /><br>
                   Product Catagray :<input type="text" name="Catagery" value=" <%=rs.getString("catagery")%>" /><br>
                   Product Prices:<input type="text" name="Prices" value="<%=rs.getString("Prices")%>" /><br>
                   Product Product Cost :<input type="text" name="cost" value="<%=rs.getString("Product_Cost")%>" /><br>
                  

                   <input class="button" type="submit" value="Update" />
                   </div> 
               </form>
                             <%
               }
%>
       </tbody>
   </table>
   
   
   
   <%
        con.close();
    }   
   catch(Exception e)
   {
   
   System.out.print(e);
   
   }
        %>
        
        <a class="back" href="index.html">Back</a>
    </body>
</html>
