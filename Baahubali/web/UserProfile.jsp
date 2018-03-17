<%-- 
    Document   : UserProfile
    Created on : 12 Jul, 2017, 1:38:48 PM
    Author     : Hero
--%>
<%@include file="header.jsp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <link type="text/css" rel="stylesheet" href="hcss.css"/>
    </head>
        <h1 align="center">Welcome to your profile <%
            if(session.getAttribute("usr")!=null)
            {
out.println(session.getAttribute("usr"));
}
            else{
            response.sendRedirect("Login.jsp");
            }
        %></h1>
         <%    String user=(String)session.getAttribute("usr");%>
            <%
            try{
             
             Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lucknowkabab","root","root");
             Statement smt=con.createStatement();
             String s1="select * from table1 where UserName='"+user+"'";
             ResultSet rs=smt.executeQuery(s1);
             if(rs.next())
             {
            %>
            <form action="UpdateDb" method="get">
            <table align="center" border="2" class="fm"> 
             <tr height="50px"><td>Username:-</td> <td> <input type="text" name="t1" value="<%=rs.getString(1)%>" readonly="yes"></td></tr><br>
             <tr height="50px"><td>Password:-</td><td> <input type="text" name="t2" value="<%=rs.getString(2)%>"></td></tr><br>
             <tr height="50px"><td>Address:-</td><td> <input type="text" name="t3" value="<%=rs.getString(3)%>"></td></tr><br>
             <tr height="50px"><td>City:-</td><td>  <input type="text" name="t4" value="<%=rs.getString(4)%>"></td></tr><br>
             <tr height="50px"><td>Gender:-</td><td> <input type="text" name="t5" value="<%=rs.getString(5)%>"></td></tr><br>
             <tr height="50px"><td>Mobile No.:-</td><td> <input type="text" name="t6" value="<%=rs.getString(6)%>"></td></tr><br>
             <tr height="50px"><td>Email ID:-</td><td> <input type="text" name="t7" value="<%=rs.getString(7)%>"></td></tr><br>
             <tr height="50px"><td>Hobbies:-</td><td> <input type="text" name="t8" value="<%=rs.getString(8)%>"></td></tr><br>
             <tr height="50px"><td>Security Question:-</td><td>
             <select name="ques"><%
                 String ans=rs.getString(10);
                 try{
                 
                 String s2="select * from secques";
                 ResultSet rs2;
                 rs2=smt.executeQuery(s2);
                 while(rs2.next())
                 {
                 %>
                 <option><%=rs2.getString(2)%></option>
                 <%  }

                     }
                 catch(Exception e)
                 {
                 out.print(e);
                 }
                 
              %> 
              <tr height="50px"><td>Answer:-</td><td> <input type="text" name="t9" value="<%out.print(ans);%>"></td></tr><br>
             </select></td></tr>
             <tr><td colspan="2"><input type="submit" value="Update Info"/></td><td></td></tr></table></form> 
              <% }}
                  catch(Exception e)
                 {
                 out.print(e);
                 }%>
                
   <form action="ProDb" method="get">
        <table>
            <tr><td>Product Id</td><td><input type="text" name="proid"></td></tr>
            <tr><td>Product Category</td><td><input type="text" name="procat"></td></tr>
            <tr><td>Product Name</td><td><input type="text" name="proname"></td></tr>
            <tr><td>Product Brand</td><td><input type="text" name="probrand"></td></tr>
            <tr><td>Product Price</td><td><input type="text" name="proprice"></td></tr>
            <tr><td><input type="text" hidden="yes" name="user" value="<%=user%>"></td><td><input type="submit" value="Submit" name="b1"/></td></tr>
        </table>
        </form>
</body> 
</html>
