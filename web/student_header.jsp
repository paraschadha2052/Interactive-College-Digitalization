<%-- 
    Document   : student_header
    Created on : Nov 16, 2017, 9:10:47 PM
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
        <style>
            li:hover{
                background-color: black;
                color: red;
            }
        </style>
    </head>
    <body>
        
        
<%@include file="HeaderPage.jsp" %>
        <div style="background-color: #428bca">
              <nav class="navbar">

                  <div class="collapse navbar-collapse" id="navbarColor02" style="font-size: medium">
                      <ul class=" nav navbar-nav"  >
                          <li ><a href="student_home.jsp" style="color: white"><span class="glyphicon glyphicon-home"></span> HOME</a></li>
          <li><a href="fee_upload.jsp" style="color: white">REGISTRATION</a></li>
         <li><a href="student_subject.jsp" style="color: white">SUBJECTS</a></li>
         <li><a href="attendance.jsp" style="color: white">ATTENDANCE</a></li>
        <li><a href="student_view_marks_sem.jsp" style="color: white">VIEW MARKS</a></li>
        <li><a href="edit_student_details.jsp" style="color: white">EDIT DETAILS</a></li>
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
