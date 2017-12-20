<%-- 
    Document   : hod_upload_student_list
    Created on : Dec 20, 2017, 6:56:57 AM
    Author     : Jitesh Mahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
    <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
        
        <script>
            
            var regex = new RegExp("(.*?)\.(csv)$");

        function triggerValidation(el) 
        {
        if (!(regex.test(el.value.toLowerCase()))) {
        el.value = '';
        alert('Please select correct file format');
        }
        }
        function sizeCheck(){
        var file = document.getElementById("csv");
        if (typeof (file.files) != "undefined") {
            var size = parseInt(file.files[0].size / 1024);
            if(size > 25600){
            alert("File is too large. "+size+" KB.");
            return false;
        }
        } else {
            alert("This browser does not support HTML5.");
            return false;
        }}
            </script>
        
    </head>
    <body>
        
         <%@include file="hod_header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <%@include file="SesssionCheck.jsp" %> 
        
         <div class="container">
    <form class="form-horizontal" action="hod_upload_notice" enctype="multipart/form-data" onsubmit="return sizeCheck()" method="post" >
  <fieldset>
    <legend>Upload Subject List(.csv)</legend>
    
     <div class="form-group">
      <label for="csv" class="col-lg-2 control-label">Upload List</label>
      <div class="col-lg-10">
          <input type="file" name="csv" id="csv" accept=".csv,text/csv" class="form-control"  onchange='triggerValidation(this)' required  >
          A maximum file of size 25mb is permitted. 
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Reset</button>
        <button type="submit" class="btn btn-primary" name="btnSubmit"  >Upload</button>
      </div>
    </div>
  </fieldset>
</form>
      
        
    </body>
</html>
