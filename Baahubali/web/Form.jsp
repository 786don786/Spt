<%-- 
    Document   : Form
    Created on : 3 Jul, 2017, 8:44:24 PM
    Author     : Hero
--%>
<%@include file="header.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>
        <link type="text/css" rel="stylesheet" href="hcss.css"/>
        <script>
    function checkpswd()
    {
        var ps1=document.getElementById('ps').value;
        var ps2=document.getElementById('rps').value;
        if(ps1!==ps2)
        {
            window.alert("Passwords don't match");
        }
    }
    function checkmob()
    {
        var no=document.getElementById('mob').value;
       if(no.lenght!==10)
       {
           window.alert('10 Digit Only');
       }
    }
    function checkuser()
    {
        var user=documnet.getElementById('user').value;
        window.location.href="\CheckUser?name="+user;
    }
    function submition()
    {
        var t1=documnet.getElementById('user').value;
        var t2=documnet.getElementById('ps').value;
        var user=documnet.getElementById('user').value;
        window.location.href="\CheckUser?name="+user;
    }
        </script>
</head>
<body>
  <form action="FormDb" method="get" >
    <table border="2" width="60%" class="fm" align="center">
        <tr height="50px"><td><center>Username:-</center></td>
    <td align="center"><center><input type="text" name="t1" id="user"/>&nbsp;<button id="b2" formnovalidate="no" onclick="checkuser()">Check</button></center></td></tr>
<tr height="50px"><td>Password:-</td>
    <td align="center"><input type="password" name="t2" id="ps"/></td></tr>
<tr height="50px"><td>Retype Password:-</td>
    <td align="center"><input type="password" name="t3" id="rps" onchange="checkpswd();"/></td></tr>
<tr height="50px"><td>Address:-</td>
    <td><textarea rows="20" col="20" name="ta"></textarea></td>
</tr>
<tr height="50px"><td>City:-</td>
    <td><select name="city"><option>..Select City..</option>
            <option>Mumbai</option>
            <option>Lucknow</option>
            <option>Delhi</option>
            <option>Kanpur</option></select></td>
</tr>
<tr height="50px"><td>Gender:-</td><td><input type="radio"name="r1" value="Male"/>Male
        <input type="radio" name="r1" value="Female">Female</td>
</tr>
<tr height="50px"><td>Mobile no:-</td><td><input type="text" name="txtmob" id="mob" onchange="checkmob();"></td></tr>
<tr height="50px"><td>Email:-</td><td><input type="text" name="txtemail"></td></tr>
<tr height="50px"><td>Hobbies:-</td><td><input type="checkbox" name="c1"/>Sleeping &nbsp;
        <input type="checkbox" name="c2"/>Music &nbsp;
        <input type="checkbox" name="c3"/>Reading &nbsp;</td></tr>
<tr height="50px"><td>Security Question:-</td>
    <td><select name="sq">
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lucknowkabab", "root", "root");
                    Statement smt = con.createStatement();
                    String s1 = "select * from secques";
                    ResultSet rs = smt.executeQuery(s1);
                               while (rs.next()) {%>
            <option><%=rs.getString(2)%></option>
            <%}
                } catch (Exception e) {
                    out.print(e);
                }
            %>
        </select></td>
</tr> 
<tr height="50px"><td>Answer:-</td><td><input type="text" name="sqa"/></td></tr>
</table></center>
<table align="center" border="2"><tr><td><input type="button" value="SignUp" class="button" id="b1" onclick="submition();"/></td></tr></table>
</form>
  </body>
</html>
