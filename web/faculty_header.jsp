<%-- 
    Document   : faculty_header
    Created on : Nov 25, 2017, 12:47:58 PM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/stylesheet.css">
       
    </head>
    <body>
        
        
<%@include file="HeaderPage.jsp" %>
        <div class="row container-fluid" style="background-color: black">
              <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

                  <div class="collapse navbar-collapse" id="navbarColor02" style="font-size: medium">
    <ul class="nav navbar-nav" >
        <li><a href="faculty_home.jsp" style="color: wheat"><span class="glyphicon glyphicon-home"></span> HOME</a></li>
         <li><a href="mark_attendance.jsp" style="color: wheat">MARK ATTENDANCE</a></li>
        <li><a href="marks1.jsp" style="color: wheat">ADD RESULT</a></li>
        <li><a href="faculty_edit_details.jsp" style="color: wheat">EDIT ACCOUNT DETAILS</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp" style="color: wheat"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
      </ul>
  </div>
</nav>
           
</div>
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
    </body>
</html>
