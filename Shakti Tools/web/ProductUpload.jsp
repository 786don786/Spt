<%-- 
    Document   : ProductUpload
    Created on : 1 Feb, 2018, 10:23:41 PM
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
        <% 
            String user="";
            if( session.getAttribute("result")==null)
        {
            if (request.getParameter("user") == null&&session.getAttribute("user") == null) {
                response.sendRedirect("Login.jsp");
            };
        //user = request.getParameter("user");
        }
        else
        {
        out.println((String)session.getAttribute("result"));
        user=(String)session.getAttribute("user");
        session.setAttribute("result",null);
        session.setAttribute("user",user);
        }
        %>
        <form action="Logout" method="post">
            <input type="submit" value="Logout"></form>
        <form action="ProductUpload" method="post" enctype="multipart/form-data">
            Product Name:-<input type="text" name="proname">
            Category:-<select name="procat"><option>Wood</option>
                <option>Metal</option>
                <option>Stone</option></select>
            Brand:-<input type="text" name="probrand">
            Price:-<input type="text" name="proprice">
            <input type="hidden" name="user" value="<%=user%>">
            Picture:-<input type="file" name="proimage">
            <input type="submit" name="s" value="Submit">

        </form>
    </body>
</html>
