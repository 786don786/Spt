<%-- 
    Document   : AdminLogin
    Created on : 29 Jan, 2018, 8:24:19 PM
    Author     : Hero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="AdminLogin" method="post">
        <center><table border="2" class="fm">
                <tr height="50px"><td>Username:-</td>
                    <td><input type="text" name="user"/></td>
                </tr>
                <tr height="50px"><td>Password:-</td>
                    <td><input type="password" name="pass"/></td>
                </tr>
                <tr><td></td><td><input type="submit" value="SignIn" name="b1"/></td></tr></table></center>
             <table align="center"><tr><td><a href="Forget.jsp">Forget Password</a></td></tr></table>
          </form>
    </body>
</html>
