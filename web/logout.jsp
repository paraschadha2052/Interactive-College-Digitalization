<%-- 
    Document   : logout
    Created on : Nov 18, 2017, 12:28:24 AM
    Author     : Jitesh Mahla
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
        session.removeAttribute("username");
        response.sendRedirect("Generic_login_home.jsp");
        %>
    </body>
</html>
