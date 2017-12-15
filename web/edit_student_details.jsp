<%-- 
    Document   : edit_student_details
    Created on : Nov 11, 2017, 10:53:41 AM
    Author     : DV
--%>
<%@page  import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="css/stylesheet.css">
    </head>
    
    <body>
       <%@include file="student_header.jsp" %>
      <%@include file="ConnectPage.jsp" %>
        <%
         String i, j;
         i="CO14327";
         j="14-CET-87";
                 
                   String qry ="select * from student where roll_no='"+i+"'";
                   ResultSet rs=smt.executeQuery(qry);    //resulset is set of records
                   rs.next();
                   %>      
        
        
        <div class="container">
    <form action="save_details.jsp" class="form-horizontal" method="post">
  <fieldset>
    <legend>Edit Details</legend>
    
    <div class="form-group">
      <label for="name" class="col-lg-2 control-label">Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbname" class="form-control" id="name" value="<%= rs.getString(1)%>" >
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-lg-2 control-label">Sex</label>
      <div class="col-lg-10">
        <div class="radio">
          <label>
            <input type="radio" name="sexRadio" id="sexRadio1" value="male" checked="">
            Male
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="sexRadio" id="sexRadio21" value="female">
            Female
          </label>
        </div>
          <div class="radio">
          <label>
            <input type="radio" name="sexRadio" id="sexRadio3" value="transgender">
            Trans-gender
          </label>
        </div>
      </div>
    </div>
    
    <div class="form-group">
      <label for="dob" class="col-lg-2 control-label">Date of Birth</label>
      <div class="col-lg-10">
          <input type="text" name="tbDob" class="form-control" id="dob" value="<%= rs.getString(3)%>">
      </div>
    </div>
    
    <div class="form-group">
      <label for="fname" class="col-lg-2 control-label">Father's Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbFname" class="form-control" id="fname" value="<%= rs.getString(4)%>" >
      </div>
    </div>
    
    <div class="form-group">
      <label for="mname" class="col-lg-2 control-label">Mother's Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbMname" class="form-control" id="mname" value="<%= rs.getString(5)%>" >
      </div>
    </div>
    
    <div class="form-group">
      <label for="add_present" class="col-lg-2 control-label">Present Address</label>
      <div class="col-lg-10">
          <input type="text" name="txtAddPresent" class="form-control"  id="add_present" value="<%= rs.getString(6)%>" >
    
      </div>
    </div>
    
    <div class="form-group">
      <label for="add_permanent" class="col-lg-2 control-label">Permanent Address</label>
      <div class="col-lg-10">
          <input type="text" name="txtAddPermanent" class="form-control"  id="add_permanent" value="<%= rs.getString(7)%>" >
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
      <label for="branchSelect" class="col-lg-2 control-label">Branch</label>
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
      <label for="uid" class="col-lg-2 control-label">UID</label>
      <div class="col-lg-10">
          <input type="text" name="tbUID" class="form-control" id="uid" value="<%= rs.getString(11)%>" >
      </div>
    </div>
    
    <div class="form-group">
      <label for="mobile_no" class="col-lg-2 control-label">Mobile No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbMobile" class="form-control" id="mobile_no" value="<%= rs.getString(12)%>" >
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="pmobile_no" class="col-lg-2 control-label">Parent's Mobile No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbPmobile" class="form-control" id="pmobile_no" value="<%= rs.getString(13)%>" >
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="email" class="col-lg-2 control-label">Email Id</label>
      <div class="col-lg-10">
          <input type="text" name="tbEmail" class="form-control" id="email" value="<%= rs.getString(14)%>" readonly >
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="categorySelect" class="col-lg-2 control-label">Category</label>
      <div class="col-lg-10">
          <select name="categorySelect" class="form-control" id="categorySelect">
          <option>General</option>
          <option>SC</option>
          <option>ST</option>
          <option>OBC</option>
          <option>Other</option>
        </select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-lg-2 control-label">Hostler</label>
      <div class="col-lg-10">
        <div class="radio">
          <label>
            <input type="radio" name="hostlerRadio" id="optionsRadios1" value="1" checked="">
            Yes
          </label>
        </div>
        <div class="radio">
          <label>
            <input type="radio" name="hostlerRadio" id="optionsRadios2" value="0">
            No
          </label>
        </div>
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="batch" class="col-lg-2 control-label">Batch</label>
      <div class="col-lg-10">
          <input type="text" name="tbBatch" class="form-control" id="batch" value="<%= rs.getString(17)%>" >
      </div>
    </div>
     <%
                                      
                   con.close();
             
             %>
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Save</button>
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

