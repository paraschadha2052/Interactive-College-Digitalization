<%-- 
    Document   : student_home
    Created on : Oct 28, 2017, 9:55:31 PM
    Author     : Jitesh Mahla
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
    <body  style="background-image: url(images/CCET1.png); background-repeat: no-repeat;  ">
        <div class="container-fluid">
        <%@include file="student_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        <%@include file="SesssionCheck.jsp" %>  
     
         <%
        if(username != null)
        {
            String qry = "select * from student where roll_no='"+username+"'";
            ResultSet rs = smt.executeQuery(qry);
            if(rs.next())
            {
                
                 %>
                 <div class="container-fluid">
                 <blockquote class="blockquote">
                    <p>Welcome <%=rs.getString(1)%>!! <br>View and Manage your Academic Details anytime, anywhere!</p>
                 </blockquote>
                     
                     
                 <% } 
        }
            else
            {
                out.println("<h3>Record not found.</h3>");
            }
                 %>
                 </div>
        </div>
    </body>
</html>
