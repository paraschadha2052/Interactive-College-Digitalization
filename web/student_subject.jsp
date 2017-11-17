<%-- 
    Document   : student_subject
    Created on : Nov 16, 2017, 11:20:56 PM
    Author     : DV
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css" /> 
    </head>
    
    <body>
       
        <div class="container-fluid">
            
        <%@include file="student_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        <%@include file="SesssionCheck.jsp" %> 
        
         <%
          String sem="NA", branch="NA";
        if(username != null)
        {
                
            String qry = "select * from subject where semester='"+sem+"' and branch='"+branch+"'";
            ResultSet rs = smt.executeQuery(qry);
            if(rs.next())
            {
                sem=rs.getString(1);
                branch=rs.getString(10);
                 %>
                 
        
        
        <% 
            }
            }
                 else
            {
                out.println("<h3>Record not found.</h3>");
            }
                 %>
                 
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
        
    
    </body>
</html>
