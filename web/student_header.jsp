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
        
    </head>
    <body>
       
        
        <div class="row container-fluid" style="background-color: black">
              <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

                  <div class="collapse navbar-collapse" id="navbarColor02" style="font-size: medium">
    <ul class="nav navbar-nav" >
        <li><a href="student_home.jsp" style="color: wheat"><span class="glyphicon glyphicon-home"></span> HOME</a></li>
          <li><a href="fee_upload.jsp" style="color: wheat">REGISTRATION</a></li>
         <li><a href="student_subject.jsp" style="color: wheat">SUBJECTS</a></li>
         <li><a href="attendance.jsp" style="color: wheat">ATTENDANCE</a></li>
        <li><a href="# " style="color: wheat">MARKSHEETS</a></li>
        <li><a href="edit_student_details.jsp" style="color: wheat">EDIT DETAILS</a></li>
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
