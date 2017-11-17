<%-- 
    Document   : SesssionCheck
    Created on : Oct 28, 2017, 11:04:31 PM
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
            String username="";
            if(session.getAttribute("username")!=null)
            {
                username = session.getAttribute("username").toString(); 
            }
            else
            {
                response.sendRedirect("Generic_login_home.jsp");
            }
            
            %>
    </body>
</html>
