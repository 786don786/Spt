<%-- 
    Document   : Admindash
    Created on : 20 Jul, 2017, 9:44:35 PM
    Author     : Hero
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administration Home</title>
    </head>
    <body>
           <h1 align="center">Welcome <%
            if(session.getAttribute("usr")!=null)
            {
out.println(session.getAttribute("usr"));
}
            else{
            response.sendRedirect("AdminLogin.jsp");
            }
        %></h1>
        <table border="2">
            <tr><td>Id</td><td>Category</td><td>Name</td><td>Brand</td><td>Price</td><td>UserName</td><td>Action</td></tr>
                <%
            try{
             
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lucknowkabab","root","root");
             Statement smt=con.createStatement();
             String s1="select * from prodata where Status='Pending'";
             ResultSet rs=smt.executeQuery(s1);
             while(rs.next())
             {
            %>
          
            <tr><td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><a href="ProApp?id=<%=rs.getString(1)%>">Approve</a></td>
           </tr>
              <%  
                  }
              }
                 catch(Exception e)
                 {
                 out.print(e);
                 }
                 
              %> 
        </table>
        
    </body>
</html>
