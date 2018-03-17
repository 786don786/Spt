<%-- 
    Document   : Forget
    Created on : 6 Jul, 2017, 8:36:53 PM
    Author     : Hero
--%>
<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Page</title>
        <link type="text/css" rel="stylesheet" href="hcss.css"/>
    </head>
    <body>
          <form action="ForgetDb" method="get">
        <center><table border="2" class="fm">
                <tr height="50px"><td>Enter Username:-</td>
                    <td><input type="text" name="user"/></td>
                </tr>
                <tr height="50px"><td>Security Question:-</td>
                            <td><select name="ques"><option>..Select Ques..</option>
                                    <option>What is your favorite movie?</option>
                                    <option>Who is your best friend? </option>
                                    <option>Who is your favorite person?</option>
                 </tr> 
                  <tr height="50px"><td>Ansswer:-</td>
                    <td><input type="text" name="ans"/></td></tr>
            </table></center></form><br>
              <table align="center" border="2"><tr><td><input type="submit" value="SignUp" class="button"/></td></tr></table>
          </form>
    </body>
</html>
