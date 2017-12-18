<%-- 
    Document   : hod_view_attendance
    Created on : Dec 18, 2017, 11:49:09 PM
    Author     : DV
--%>

<%@page import="java.util.Calendar"%>
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
        <%@include file="hod_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
           <%@include file="SesssionCheck.jsp" %>
        
        
        <div class="container">
            
    <form class="form-horizontal" action="hod_view_attendance1.jsp" method="post">
  <fieldset>
    <legend>CHOOSE CLASS TO VIEW ATTENDANCE</legend>
    
      <div class="form-group">
      <label for="semesterSelect" class="col-lg-2 control-label">Semester</label>
      <div class="col-lg-10">
          <select name="semesterSelect" class="form-control" id="semesterSelect">
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
          <option>6</option>
          <option>7</option>
          <option>8</option>
        </select>
      </div>
    </div>
    
    <div class="form-group">
      <label for="batchSelect" class="col-lg-2 control-label">Batch</label>
      <div class="col-lg-10">
        <select name="batchSelect" class="form-control" id="branchSelect">
            <%
                Calendar cal = Calendar.getInstance();
                int year = cal.get(cal.YEAR);
                
                for(int i=0;i<10;i++){
            %>
                    <option value="<%=year-i%>"><%=year-i%> - <%=year-i+4%></option>
            <%
               }
            %>
        </select>
      </div>
    </div>
    
    
        <div class="form-group">
          <div class="col-lg-10 col-lg-offset-2">
            <button type="reset" class="btn btn-default">Cancel</button>
            <button type="submit" class="btn btn-primary" name="btnSubmit">View</button>
          </div>
        </div>
      </fieldset>
    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    </div>
    </body>
</html>
