<%-- 
    Document   : Login
    Created on : 27 Jan, 2018, 11:03:14 AM
    Author     : Hero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
          <form action="LoginPage" method="get">
        <center><table border="2" class="fm">
                <tr><td>Username:-</td>
                    <td><input type="text" name="l1"/></td>
                </tr>
                <tr><td>Password:-</td>
                    <td><input type="password" name="l2"/></td>
                </tr>
                <tr><td></td><td><input type="submit" value="SignIn" name="b1"/></td></tr></table></center>
             <table align="center"><tr><td><a href="Forget.jsp">Forget Password</a></td></tr></table>
          </form>
    </body>
</html>
