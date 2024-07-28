<%-- 
    Document   : incDecQuantity
    Created on : 16 Mar, 2024, 12:04:35 AM
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
       int ID=Integer.parseInt(request.getParameter("id"));
       String incdec=request.getParameter("Quantity");
       int prices=0;
       int total=0;
       int quantity=0;
       int final_total=0;
      
       try
       {
       
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
                Statement st = con.createStatement();
                ResultSet rs =st.executeQuery("select * from cart where Product_Id='"+ID+"'");
                while(rs.next())
                {
       
               prices=rs.getInt(4);
              total=rs.getInt(5);
              quantity=rs.getInt(3);
              
              if(quantity==1 && incdec.equals("dec"))
              {
                  total=total-prices;
                  quantity=quantity-1;
                  st.executeQuery("update cart SET sub_total='"+ total+"',Quantity='"+quantity +"'  where Product_Id='"+ID+"'");
                  response.sendRedirect("addorder.jsp");
            }
              else
              {
                  total=total+prices;
                  quantity=quantity+1;
                  st.executeQuery("update cart SET sub_total='"+ total+"',Quantity='"+quantity +"'  where Product_Id='"+ID+"'");
                  response.sendRedirect("addorder.jsp");
              }

       }
       }
       catch(Exception e){
               out.print(e);
               }
       
       }
       %>
    </body>
</html>
