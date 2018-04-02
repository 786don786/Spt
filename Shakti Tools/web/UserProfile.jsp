<%-- 
    Document   : UserProfile
    Created on : 27 Jan, 2018, 11:29:59 AM
    Author     : Hero
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <style>
            #outer{width:auto;height:800px;background-color:#6699ff;}
            #buttonbody{width:auto;height:100px;}
            #outer_controls{width:auto;height:50px;background-color:#0066ff;}
            #oc_blank{width:94%;height:50px;float:left;}
            #oc_place{width:5%;height:50px;float:right;}
            #controls{width:auto;height:25px;background-color:#3366ff;margin-top:0 px;}
            #show{width:600px;}
            .show2{width:25%;}
        </style>
    </head>


    <body>
        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Login.jsp");
            };

        %>
        <%            String conlink = getServletContext().getInitParameter("conlink");
            String dbuser = getServletContext().getInitParameter("dbuser");
            String dbpass = getServletContext().getInitParameter("dbpass");

            String user = (String) session.getAttribute("user");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(conlink, dbuser, dbpass);
                Statement smt = con.createStatement();
                String q = "Select * from regis where User='" + user + "'";
                ResultSet rs = smt.executeQuery(q);
                if (rs.next()) {
        %>
        <div id="outer">
            <div id="buttonbody">  
                <div id="outer_controls">
                    <div id="oc_blank"></div>
                    <div id="oc_place"><form action="Logout" method="post">
                            <input type="submit" class="btn btn-success" value="Logout"></form></div>

                </div>

                <div id="controls"> <form action="UserControls" method="get">
                        <input type="submit" class="btn btn-info" value="Upload new product details" name="unpd">
                        <input type="submit" class="btn btn-info" value="Update profile details" name="upd">
                        <input type="submit" class="btn btn-info" value="My Products" name="mp">
                        <input type="hidden" value="<%=session.getAttribute("user")%>" name="user">

                    </form>
                </div>
            </div>


            <table border="3" align="center" class="table" id="show">
                <tr><td class="show2">Username:-</td><td> <%=rs.getString(1)%></td></tr>
                <tr><td class="show2">Address:- </td><td> <%=rs.getString(3)%></td></tr>
                <tr><td class="show2">City:- </td><td> <%=rs.getString(4)%></td></tr>
                <tr><td class="show2">Gender:- </td><td> <%=rs.getString(5)%></td></tr>
                <tr><td class="show2">Mobile number:- </td><td> <%=rs.getString(6)%></td></tr>
                <tr><td class="show2">Email:- </td><td> <%=rs.getString(7)%></td></tr>
                <tr><td class="show2">Hobby:- </td><td> <%=rs.getString(8)%></td></tr>
                <tr><td class="show2">Answer:- </td><td> <%=rs.getString(9)%></td></tr>
            </table>
            <%
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            %></div>
    </body>
</html>
