<%-- 
    Document   : ProfileUpdate
    Created on : 1 Feb, 2018, 10:24:07 PM
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
        <title>JSP Page</title>
    </head>
    <body>
            <% 
            String user="";
            if( session.getAttribute("result")==null)
        {
            if (request.getParameter("user") == null&&session.getAttribute("user") == null) {
                response.sendRedirect("Login.jsp");
            };
        user = request.getParameter("user");
        }
        else
        {
        out.println((String)session.getAttribute("result"));
        user=(String)session.getAttribute("user");
        session.setAttribute("result",null);
        session.setAttribute("user",user);
        out.println("Successful");
        }
          %>
        <form action="Logout" method="post">
            <input type="submit" value="Logout"></form>
            <%
                String conlink = getServletContext().getInitParameter("conlink");
                String dbuser = getServletContext().getInitParameter("dbuser");
                String dbpass = getServletContext().getInitParameter("dbpass");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(conlink, dbuser, dbpass);
                    Statement smt = con.createStatement();
                    String q = "select * from regis where User='" + user + "'";
                    ResultSet rs = smt.executeQuery(q);
                    if (rs.next()) {
            %>
        <form method="post" action="UpdateProfile">
            Username <input type="text" name="t1" value="<%=rs.getString(1)%>"><br>
            Password <input type="text" name="t2" value="<%=rs.getString(2)%>"><br>
            Address <input type="text" name="ta" value="<%=rs.getString(3)%>"><br>
            City <input type="text" name="city" value="<%=rs.getString(4)%>"><br>
            Mobile <input type="text" name="mob" value="<%=rs.getString(6)%>"><br>
            Email <input type="text" name="email" value="<%=rs.getString(7)%>"><br>
            <input type="hidden" value="<%=rs.getString(1)%>" name="user">
            <input type="submit" value="Signup">
        </form>
        <% }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
