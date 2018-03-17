<%-- 
    Document   : Login
    Created on : 6 Jul, 2017, 7:20:56 PM
    Author     : Hero
--%>
<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link type="text/css" rel="stylesheet" href="hcss.css"/>
    </head>
    <body>
          <form action="LoginDb" method="get">
        <center><table border="2" class="fm">
                <tr height="50px"><td>Username:-</td>
                    <td><input type="text" name="l1"/></td>
                </tr>
                <tr height="50px"><td>Password:-</td>
                    <td><input type="password" name="l2"/></td>
                </tr>
                <tr><td></td><td><input type="submit" value="SignIn" name="b1"/></td></tr></table></center>
             <table align="center"><tr><td><a href="Forget.jsp">Forget Password</a></td></tr></table>
          </form>
    </body>
</html>
