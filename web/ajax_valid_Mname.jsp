<%-- 
    Document   : ajax_valid_Mname
    Created on : Nov 17, 2017, 11:52:02 PM
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
            
            String mname = request.getParameter("mname");
            
            String pMname = "^[a-zA-Z\\s]+$";
            
            if(!mname.matches(pMname))
            {
                out.println("Name invalid");
            }
            
        %>
    </body>
</html>
