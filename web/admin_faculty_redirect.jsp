<%-- 
    Document   : admin_faculty_redirect
    Created on : Dec 16, 2017, 10:19:12 PM
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
        <%@include file="ConnectPage.jsp" %>
    <%@include file="HeaderPage.jsp" %>
    <%@include file="SesssionCheck.jsp" %> 
    
        <% 
       
       String fname=request.getParameter("fname");
        out.println("<h4>A mail has been sent to faculty member "+fname+", to complete the Registration Process.<h4>");
               
                        response.setHeader("Refresh", "2;url=admin_home.jsp");
         
        %>
        
    </body>
</html>
