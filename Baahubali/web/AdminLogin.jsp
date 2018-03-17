<%-- 
    Document   : AdminLogin
    Created on : 20 Jul, 2017, 9:03:12 PM
    Author     : Hero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Login</title>
    </head>
    <body>
        <form action="AdminDb" method="get">
        <center><table border="2" class="fm">
                <tr height="50px"><td>Username:-</td>
                    <td><input type="text" name="l1"/></td>
                </tr>
                <tr height="50px"><td>Password:-</td>
                    <td><input type="password" name="l2"/></td>
                </tr>
                <tr><td></td><td><input type="submit" value="SignIn" name="b1"/></td></tr></table></center>
          </form>
        
    </body>
</html>
