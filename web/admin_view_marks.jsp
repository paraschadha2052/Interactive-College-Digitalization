<%-- 
    Document   : admin_view_marks
    Created on : Dec 16, 2017, 11:36:54 PM
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
             <%@include file="SesssionCheck.jsp" %> 
        
        <div class="container">
            
    <form class="form-horizontal" action="admin_view_marks1.jsp" method="post">
  <fieldset>
    <legend>CHOOSE CLASS TO VIEW RESULT</legend>
    
       <div class="form-group">
            <label for="batch" class="control-label col-lg-2">Batch:</label>
            <div class="col-lg-10">
            <input type="text" class="form-control" id="batch" name="batch" placeholder="Batch as 2014 " required>
         </div>
       </div>
            
            
         <div class="form-group">
      <label for="semesterSelect" class="col-lg-2 control-label">Semester: </label>
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
      <label for="branchSelect" class="col-lg-2 control-label">Branch:</label>
      <div class="col-lg-10">
          <select name="branchSelect" class="form-control" id="branchSelect">
           <option>CSE</option>
          <option>ECE</option>
          <option>ME</option>
          <option>CE</option>
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
