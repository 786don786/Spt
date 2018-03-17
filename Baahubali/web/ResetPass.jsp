<%-- 
    Document   : ResetPass
    Created on : 7 Jul, 2017, 8:03:11 PM
    Author     : Hero
--%>
<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password Page</title>
        <link type="text/css" rel="stylesheet" href="hcss.css"/>
    </head>
    <body>
        <%
            //out.println(session.getAttribute("user"));
            String s1=(String)session.getAttribute("user");
        %>
        <form action="ResetPassDb" method="get">
            <table>
            <tr><td>New Password:-</td><td><input type="password" name="p1"></td></tr> 
            <tr><td>Confirm Password:-</td><td><input type="password" name="p2"></td></tr>    
            <tr><td><input type="text" hidden="yes" name="p3" value="<%=s1%>"></td>
                <td><input type="submit" name="b1"></td></tr>    
            </table>
            </form>
            </body>
</html>
