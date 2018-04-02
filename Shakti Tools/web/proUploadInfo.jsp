<%-- 
    Document   : proUploadInfo
    Created on : 2 Apr, 2018, 11:41:53 AM
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%

            if (session.getAttribute("result") == null) {
                if (request.getParameter("user") == null && session.getAttribute("user") == null && session.getAttribute("proid") == null) {
                    response.sendRedirect("Login.jsp");
                };
            }
            String user = (String) session.getAttribute("user");
            String proid = (String) session.getAttribute("proid");
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
            System.out.println(basePath);
             String imgname="";
	     String picsrc=null;
        %>
        <h1>Your Product information is successfully uploaded</h1>
        <%
            String conlink = getServletContext().getInitParameter("conlink");
            String dbuser = getServletContext().getInitParameter("dbuser");
            String dbpass = getServletContext().getInitParameter("dbpass");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(conlink, dbuser, dbpass);
                Statement smt = con.createStatement();
                String q = "select * from prodetail where userid='" + user + "' and proid='" + proid + "'";
                ResultSet rs = smt.executeQuery(q);
                if (rs.next()) {
        %>
        <table border="1">
            <tr><th>Name</th><th>Category</th><th>Brand</th><th>Price</th><th>Status</th></tr>
            <tr><td><%= rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(6)%></td></tr>
        </table>
        <% imgname=rs.getString("image");
		if(imgname==null)
		{
			out.println("OOPS");
			
		}
		else{
			
			picsrc=basePath+user+"/"+imgname;
                        
		} %>
       <img src="<%=picsrc %>" style="width:100px;height: 100px" class="img-circle">
        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
