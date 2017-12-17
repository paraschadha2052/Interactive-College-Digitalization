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
    <%@include file="admin header.jsp" %>
    <%@include file="SesssionCheck.jsp" %> 
    
        <% 
       
       String fname=request.getParameter("fname");
       %>
       
       <div class="notice_style">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
        A mail has been sent to faculty member <%=fname%> to complete the Registration Process.
               
        </div>
                    <div class="col-md-2">
                        
                    </div>
                </div>
            </div>
                   <%     response.setHeader("Refresh", "2;url=admin_home.jsp");
         
        %>
        
    </body>
</html>
