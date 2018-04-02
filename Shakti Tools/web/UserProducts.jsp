<%-- 
    Document   : UserProducts
    Created on : 11 Mar, 2018, 9:13:08 PM
    Author     : Hero
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Login.jsp");
            }
        %>
        <%
            String conlink = getServletContext().getInitParameter("conlink");
            String dbuser = getServletContext().getInitParameter("dbuser");
            String dbpass = getServletContext().getInitParameter("dbpass");
            String user = (String) session.getAttribute("user");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(conlink, dbuser, dbpass);
                Statement smt = con.createStatement();
                String s1 = "select * from prodetail where userid='" + user + "'";
                ResultSet rs = smt.executeQuery(s1);
                short i = 1;
        %>
        <table border="1">
            <tr><td>Sr. No.</td><td>Product Name</td></tr>
            <%
                while (rs.next()) {

            %>
            <tr><td><%=i++%></td><td><%=rs.getString(1)%></td></tr>
            <%
                }
            %>
        </table><%
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
