<%-- 
    Document   : ajax_valid_Email
    Created on : Nov 18, 2017, 12:05:56 AM
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
             String email = request.getParameter("email");
             String pemail = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
        + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        if(!email.matches(pemail))
            {
                out.println("Invalid Email address.");
            }
        
        int l=email.length();
            if(l>0)
            {
               %>
               <%@include file="ConnectPage.jsp" %>
               <%
           if(l>0)
            {       
              
                   String qry ="SELECT email_id FROM student WHERE email_id='"+email+"'";
                   ResultSet rs=smt.executeQuery(qry);   
                   while(rs.next())
                   {
                       %>
                       Email id "<%= rs.getString(1)%>" already in use. 
                       <%
                   }
                                              
                   con.close();
               }
           
            }
        %> 
        
    </body>
</html>
