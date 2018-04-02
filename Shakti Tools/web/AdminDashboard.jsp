<%-- 
    Document   : AdminDashboard
    Created on : 31 Jan, 2018, 10:26:26 PM
    Author     : Hero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #admin_dashboard{width:auto;height:60px;border:1px solid black;background-color: red;}
            .admin_content{width:160px;height:59px;border:1px;background-color: black;float:left;}
            .button{color:white;background-color: #4CAF50;border:none;padding:13px 50px;display:inline-block;margin:0px;font-size: 15px;cursor:pointer;}
        </style>
    </head>
    <body>
        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("AdminLogin.jsp");
            }
        %>
        <div id="admin_dashboard">
            <form action="Admin_dashboard_action" method="post">
                <div class="admin_content"><input type="submit" value="New Product" class="button"></div>
                <div class="admin_content"><input type="submit" value="Comments" class="button"></div>
                <div class="admin_content"><input type="submit" value="Logout" class="button"></div>
                <div class="admin_content"><input type="submit" value="Inbox" class="button"></div>
            </form>
        </div>


    </body>
</html>
