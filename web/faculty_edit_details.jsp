
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylesheet.css">
        <link rel="stylesheet" href="css/Logincss.css">
    </head>
    <body>
         <%@include file="ConnectPage.jsp" %>
         <%@include file="faculty_header.jsp" %>
         <%@include file="SesssionCheck.jsp" %>
         
        <div class="container">
            
            

     <%
        if(username != null)
        {
            String qry = "select * from faculty where f_id='"+username+"'";
            ResultSet rs = smt.executeQuery(qry);
            if(rs.next())
            {
                
                 %>            
            
                 <form class="form-horizontal" action="save_faculty_edit_details.jsp" method="post">
  <fieldset>
    <legend>Edit Details</legend>
    
    <div class="form-group">
      <label for="fid" class="col-lg-2 control-label">Registration Id</label>
      
      <div class="col-lg-10">
          <input type="text" name="tbfid" class="form-control" id="fid" value="<%= rs.getString(1)%>" placeholder="Faculty Id" readonly>
           <br> <div  id="resultName"> </div>  
      </div>
    </div>
    
    <div class="form-group">
      <label for="name" class="col-lg-2 control-label">Name</label>
      
      <div class="col-lg-10">
          <input type="text" name="tbName" class="form-control" id="name" value="<%= rs.getString(2)%>" onkeyup="checkName(this.value);" placeholder="Name" readonly>
           <br> <div  id="resultName"> </div>  
      </div>
    </div>
    
     <div class="form-group">
      <label for="branchSelect" class="col-lg-2 control-label">Branch</label>
      <div class="col-lg-10">
          <select name="branchSelect" class="form-control" id="branchSelect">
          <option><%= rs.getString(3)%></option>
        </select>
      </div>
    </div>
    
   <div class="form-group">
      <label for="mobile_no" class="col-lg-2 control-label">Mobile No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbMobile" class="form-control" id="mobile_no" value="<%= rs.getString(4)%>" onkeyup="checkMobileno(this.value)" placeholder="Mobile No." required>
          <br> <div  id="resultMobileno"> </div>
      </div>
    </div>
    
    <div class="form-group">
      <label for="email" class="col-lg-2 control-label">Email Id</label>
      <div class="col-lg-10">
          <input type="text" name="tbEmail" class="form-control" id="email" value="<%= rs.getString(5)%>" onkeyup="checkEmail(this.value)" placeholder="email" required readonly>
          <br> <div  id="resultEmail"> </div>
      </div>
    </div>
    
     <div class="form-group">
      <label for="uid" class="col-lg-2 control-label">UID</label>
      <div class="col-lg-10">
          <input type="text" name="tbUID" class="form-control" id="uid" value="<%= rs.getString(6)%>" onkeyup="checkUid(this.value)" placeholder="UID/Adhar card Number" required>
          <br> <div  id="resultUid"> </div>
      </div>
    </div>
     
    <div class="form-group">
      <label for="add_present" class="col-lg-2 control-label">Address</label>
      <div class="col-lg-10">
          <textarea name="txtAdd" class="form-control" rows="3" id="add_present"  required><%= rs.getString(7)%></textarea>
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="post" class="col-lg-2 control-label">Designation</label>
      <div class="col-lg-10">
          <input type="text" name="tbpost" class="form-control" id="post" value="<%= rs.getString(8)%>" placeholder="Designation" required readonly>
      </div>
    </div>
      
    <%
                                      
                   con.close();
             
             %>
    
     <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
      
          
        <button type="reset" class="btn btn-default" name="btnCancel">Cancel</button> 
        <button type="submit" class="btn btn-primary" name="btnSet">Submit</button>
      </div>
    </div>
             
  </fieldset>
</form>
             
             <% } } %>
        
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
        </div>
        
    </body>
</html>
