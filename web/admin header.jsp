<%-- 
    Document   : admin header
    Created on : Dec 14, 2017, 10:24:42 PM
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
        
<%@include file="HeaderPage.jsp" %>
        <div style="background-color: #428bca">
              <nav class="navbar">

                  <div class="container-fluid" style="font-size: medium">
    <ul class="nav navbar-nav" >
        <li><a href="admin_home.jsp" style="color: white"><span class="glyphicon glyphicon-home"></span> HOME</a></li>
         <li><a href="view_attendance.jsp" style="color: white">ATTENDANCE</a></li>
        <li><a href="view_students.jsp " style="color: white">STUDENTS</a></li>
        <li><a href="admin_view_faculty.jsp" style="color: white">FACULTY</a></li>
        <li><a href="admin_view_marks.jsp" style="color: white">RESULT</a></li>
        <li><a href="admin_notice_upload.jsp" style="color: white">UPLOAD NOTICE</a></li>
        <li><a href="admin_subject.jsp" style="color: white">EDIT SUBJECTS</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp" style="color: white"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
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
