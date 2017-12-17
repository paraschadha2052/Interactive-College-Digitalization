
<%@page  import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/stylesheet.css">
    </head>
     
      
      
      <body>
     <%@include file="admin header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        <%@include file="SesssionCheck.jsp" %> 
       
        
        <div class="container">
    <form class="form-horizontal" action="admin_upload_notice" enctype="multipart/form-data" method="post">
  <fieldset>
    <legend>Upload File</legend>
    
    <div class="form-group">
      <label for="subject" class="col-lg-2 control-label">Subject</label>
      <div class="col-lg-10">
          <textarea name="txtSubject" class="form-control" rows="2" id="subject"></textarea>
      
      </div>
    </div>
    
    <div class="form-group">
      <label for="RecipientSelect" class="col-lg-2 control-label">Intended Recipient</label>
      <div class="col-lg-10">
          <select name="RecipientSelect" class="form-control" id="RecipientSelect">
          <option>Student</option>
          <option>Faculty</option>
          <option>Both</option>
         
        </select>
      </div>
    </div>
 
      <div class="form-group">
      <label for="pdf" class="col-lg-2 control-label">Upload PDF</label>
      <div class="col-lg-10">
          <input type="file" name="pdf" accept="application/pdf" class="form-control" id="pdf"  >
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary" name="btnSubmit">Save</button>
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

