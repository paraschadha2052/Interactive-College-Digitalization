<%-- 
    Document   : ajax_valid_Fname
    Created on : Nov 17, 2017, 11:48:45 PM
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
            
            String fname = request.getParameter("fname");
            
            String pFname = "^[a-zA-Z\\s]+$";
            
            if(!fname.matches(pFname))
            {
                out.println("Name invalid");
            }
            
        %>
    </body>
</html>
