<%-- 
    Document   : Form
    Created on : 24 Jan, 2018, 4:54:03 PM
    Author     : Hero
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    </head>
    <div class="container">
        <form method="post" action="Registration">
            <div class="form-group col-lg-8">
                <label for="name"> Username</label> <input type="text" class="form-control" name="t1" id="name" required><br>
                <label for="pwd">Password </label><input type="password" class="form-control" id="pwd" name="t2" required>   <br>             
                <label for="adress">Address</label> <textarea name="ta" class="form-control" id="address"></textarea><br>
                <label for="city">City</label> <select name="city" class="form-control" id="city"><option>Mumbai</option>
                    <option>Lucknow</option>
                    <option>Delhi</option>
                    <option>Bengaluru</option></select><br>
                Gender <input type="radio" value="male" name="r1" >Male &nbsp; 
                <input type="radio" value="female" name="r1">Female<br>
                <label for="mobile">Mobile</label> <input type="text" class="form-control" name="mob" id="mobile"><br>
                <label for="email">Email</label> <input type="text" class="form-control" name="email" id="email"><br>
                <label for="hobby">Hobby</label> <input type="checkbox" name="c1" id="hobby">Sleeping &nbsp;
                <input type="checkbox" name="c2">Music&nbsp;
                <input type="checkbox" name="c3">Reading<br>
                <label for="secque">Security Question:-</label> <select name="secque" id="secque">
                    <%
                        String conlink = getServletContext().getInitParameter("conlink");
                        String dbuser = getServletContext().getInitParameter("dbuser");
                        String dbpass = getServletContext().getInitParameter("dbpass");

                        try {

                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection(conlink, dbuser, dbpass);
                            Statement smt = con.createStatement();
                            String q = "select * from secque";
                            ResultSet rs = smt.executeQuery(q);
                            if (rs.next()) {
                    %>
                    <option><%=rs.getString(1)%></option>
                    <%  }
                        } catch (Exception e) {
                            out.println(e);
                        }%></select><br>
                <label for="answer">Answer</label> <input type="text" class="form-control" name="sqa" id="answer"><br><br>

                <input type="submit" class="btn btn-primary" value="Signup">
            </div></form>

    </div></body>
</html>

