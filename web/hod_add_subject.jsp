<%-- 
    Document   : hod_add_subject
    Created on : Dec 19, 2017, 12:12:27 PM
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
         <%@include file="hod_header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <%@include file="SesssionCheck.jsp" %> 
         
           <%
           
           String branch="";
      String qry11 = "select department  from faculty where F_id='"+username+"'";
         ResultSet rs11 = smt.executeQuery(qry11);
         rs11.next();
            
             branch=rs11.getString(1); 
            %>
        <div class="container">
            
        
            <form action="admin_insert_subject.jsp" class="form-horizontal" method="post">
  <fieldset>
    <legend>ADD SUBJECT</legend>
    
    
    <div class="form-group">
      <label for="sub_code" class="col-lg-2 control-label">Subject Code</label>
      <div class="col-lg-10">
          <input type="text" name="sub_code" class="form-control" id="sub_code"  placeholder="subject code">
      </div>
    
    </div>
    
    <div class="form-group">
      <label for="sub_name" class="col-lg-2 control-label">Subject Name</label>
      
      <div class="col-lg-10">
          <input type="text" name="sub_name" class="form-control" id="sub_name"  placeholder="Subject name">
      </div>
    </div>
   
    
    <div class="form-group">
      <label for="cedits" class="col-lg-2 control-label">Subject Credits</label>
      
      <div class="col-lg-10">
          <input type="text" name="credits" class="form-control" id="credits"  placeholder="Subject credits">
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="branchSelect" class="col-lg-2 control-label">Branch</label>
      <div class="col-lg-10">
          <select name="branchSelect" class="form-control" id="branchSelect">
          <option><%=branch %></option>
         
        </select>
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
      <label for="faculty" class="col-lg-2 control-label">Faculty: </label>
      <div class="col-lg-10">
          <select name="faculty" class="form-control" id="faculty">
          <% 
           String qry3 = "select * from faculty where department='"+branch+"' " ;
            ResultSet rs3 = smt.executeQuery(qry3);
            while(rs3.next())
            {
            %>
              <option value="<%=rs3.getString(1) %>"><%=rs3.getString(2) %></option>
            
              <% }  %>
        </select>
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="batch" class="col-lg-2 control-label">Batch</label>
      <div class="col-lg-10">
          <input type="text" name="Batch" class="form-control" id="batch" placeholder="Batch (StartingYear)YYYY ">
      </div>
    </div>
    
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
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
