<%-- 
    Document   : pass_redirect
    Created on : Dec 16, 2017, 12:48:24 PM
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
       <% 
       String username=request.getParameter("un");
       
        out.println("<h2>Password Set successfully! Redirecting to homepage. . .<h2>");
                
                String qryy="select * from login where username='"+username+"'";
                ResultSet rs=smt.executeQuery(qryy);
                if(rs.next()){
                    if(rs.getString(3).equals("student"))
                    {
                        session.setAttribute("username", username);
                        response.setHeader("Refresh", "2;url=student_home.jsp");
                    }
                    else
                    {
                        session.setAttribute("username", username);
                        response.setHeader("Refresh", "2;url=faculty_home.jsp");
                    }
                     
                    
        
        }
        %>
    </body>
</html>
