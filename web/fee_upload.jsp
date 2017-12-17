<%-- 
    Document   : fee_upload
    Created on : Nov 11, 2017, 2:24:42 PM
    Author     : DV
--%>

<%@page  import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/stylesheet.css">
         
         <script type="text/javascript">
    function Upload() {
        var file = document.getElementById("pdf");
        if (typeof (file.files) != "undefined") {
            var size = parseInt(file.files[0].size / 1024);
            if(size > 2048){
            alert("File is too large. "+size+" KB.");
            return false;
        }
        } else {
            alert("This browser does not support HTML5.");
            return false;
        }
    }
</script>

    </head>
     
      
      
      <body>
     <%@include file="student_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        <%
         
         String i;
         i=(String)session.getAttribute("username");
                 
                   String qry ="select * from student where roll_no='"+i+"'";
                   smt = con.createStatement(); 
                   ResultSet rs=smt.executeQuery(qry);    //resulset is set of records
                   rs.next();
        %>      
        
        
        <div class="container">
    <form class="form-horizontal" action="uploadpic" enctype="multipart/form-data" onsubmit="return Upload()" method="post">
  <fieldset>
    <legend>Edit Details</legend>
    
    <div class="form-group">
      <label for="name" class="col-lg-2 control-label">Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbname" class="form-control" id="name" value="<%= rs.getString(1)%>" readonly>
      </div>
    </div>
      
      <div class="form-group">
      <label for="reg_no" class="col-lg-2 control-label">University Registration No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbRegNo" class="form-control" id="reg_no" value="<%= rs.getString(8)%>" readonly>
      </div>
    </div>
    
    <div class="form-group">
      <label for="roll_no" class="col-lg-2 control-label">College Roll No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbRollNo" class="form-control" id="roll_no" value="<%= rs.getString(9)%>" readonly>
      </div>
    </div>
      
      <div class="form-group">
      <label for="semesterSelect" class="col-lg-2 control-label">Semester</label>
      <div class="col-lg-10">
          <select name="semesterSelect" class="form-control" id="semesterSelect" required>
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
      <label for="bti" class="col-lg-2 control-label">Bank Transaction ID</label>
      <div class="col-lg-10">
          <input type="text" name="tbBTI" class="form-control" id="BTI" placeholder="Unique bank transaction ID" required>
      </div>
    </div>
      
      <div class="form-group">
      <label for="pdf" class="col-lg-2 control-label">Upload PDF</label>
      <div class="col-lg-10">
          <input type="file" name="pdf" accept="application/pdf" class="form-control" id="pdf" required >
          A maximum file of size 2mb is permitted.
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Reset</button>
        <button type="submit" class="btn btn-primary" name="btnSubmit">Upload</button>
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
