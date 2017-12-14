<%-- 
    Document   : view_attendance1
    Created on : Dec 14, 2017, 10:42:30 PM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
    </head>
    <body>
         <%@include file="admin header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <%
             String fid="f005"; 
             int i=1;
             
            String qry = "select * from subject where F_id='"+fid+"'";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
          %>
          
          
           <% 
            i=i+1;
            }              
                 %>
    </body>
</html>
