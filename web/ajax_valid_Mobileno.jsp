<%-- 
    Document   : ajax_valid_Mobileno
    Created on : Nov 18, 2017, 12:16:33 AM
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
             String mobileno = request.getParameter("mobileno");
             String pMobileno = "^[0-9]{10}$";
        if(!mobileno.matches(pMobileno))
            {
                out.println("Invalid Mobile number.");
            }
        %>
    </body>
</html>
