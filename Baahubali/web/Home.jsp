<%-- 
    Document   : Home
    Created on : 10 Jul, 2017, 7:23:11 PM
    Author     : Hero
--%>
<%@include file="header.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content=" " />
	
	<link rel="stylesheet" type="text/css" href="engine1/style.css" />
	<script type="text/javascript" src="engine1/jquery.js"></script>
    </head>
    <body>

    <div id="wowslider-container1">
	<div class="ws_images"><ul>
		<li><a href="Home.jsp"><img src="data1/images/1.jpg" alt="1" title="1" id="wows1_0"/></a>Welcome to official site of BBD Software Counsltancy</li>
		<li><a href="Home.jsp"><img src="data1/images/2.jpg" alt="2" title="2" id="wows1_1"/></a>Welcome to official site of BBD Software Counsltancy</li>
		<li><a href="Home.jsp"><img src="data1/images/3.jpg" alt="3" title="3" id="wows1_2"/></a>Welcome to official site of BBD Software Counsltancy</li>
	</ul></div>
	<div class="ws_bullets"><div>
		<a href="#" title="1"><img src="data1/tooltips/1.jpg" alt="1"/>1</a>
		<a href="#" title="2"><img src="data1/tooltips/2.jpg" alt="2"/>2</a>
		<a href="#" title="3"><img src="data1/tooltips/3.jpg" alt="3"/>3</a>
	</div></div><span class="wsl"><a href="Home.jsp">image</a></span>
	<div class="ws_shadow"></div>
	</div>	
	<script type="text/javascript" src="engine1/wowslider.js"></script>
	<script type="text/javascript" src="engine1/script.js"></script>
    <center><table>
             <tr width="400px" height="50px"><td> <a href="Form.jsp">Registration Page</a></td></tr>
             <tr><td width="400px" height="50px"><a href="Login.jsp">Login Page</a></td></tr>
             <tr><td width="400px" height="50px"><a href="">About Us</a></td></tr>
             <tr><td width="400px" height="50px"><a href="Form.jsp">Contact Us</a></td></tr>
    </table></center>
    </body>
</html>
<%@include file="footer.jsp"%>