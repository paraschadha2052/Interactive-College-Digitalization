<%-- 
    Document   : admin_view_faculty
    Created on : Dec 18, 2017, 10:34:11 PM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="admin header.jsp" %>
             <%@include file="ConnectPage.jsp" %>
        
        <div class="container">
            
    <form class="form-horizontal" action="view_faculty.jsp" method="post">
  <fieldset>
    <legend>CHOOSE BRANCH TO VIEW Faculty</legend>
    
         <div class="form-group">
      <label for="branch" class="col-lg-2 control-label">Branch: </label>
      <div class="col-lg-10">
          <select name="branch" class="form-control" id="branch">
          <option>CSE</option>
          <option>ECE</option>
          <option>ME</option>
          <option>CE</option>
          <option>ALL</option>
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
