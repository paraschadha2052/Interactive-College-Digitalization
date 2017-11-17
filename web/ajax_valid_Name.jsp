<%-- 
    Document   : ajax_valid_Name
    Created on : Nov 17, 2017, 11:40:44 PM
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
            
            String name = request.getParameter("name");
            
            String pname = "^[a-zA-Z\\s]+$";
            
            if(!name.matches(pname))
            {
                out.println("Name invalid.");
            }
            
        %>
    </body>
</html>
