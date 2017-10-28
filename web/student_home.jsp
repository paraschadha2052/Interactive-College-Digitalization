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
    <body>
        <%@include file="ConnectPage.jsp" %>
        <%@include file="SesssionCheck.jsp" %>  
         
            
            <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Home</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav">
        <li><a href="#">Attendance <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Results</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Manage Account<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">My Profile</a></li>
            <li><a href="#">Change Account Settings</a></li>
            <li class="divider"></li>
            <li><a href="#">Change Registration Details</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
            
            <%
            String uname;
            uname = request.getParameter("username");
            String qry = "select * from student where roll_no="+uname;
            ResultSet rs = smt.executeQuery(qry);
            if(rs.next())
            {
                 %>
           <div class="jumbotron">
  <h1>Hello <%=rs.getString(1)%></h1>
             
            <% } %>
            </div>
    </body>
</html>
