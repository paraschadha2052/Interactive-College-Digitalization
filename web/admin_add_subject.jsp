<%-- 
    Document   : admin_add_subject
    Created on : Dec 17, 2017, 9:43:07 PM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .backlink {
    text-decoration: none;
    display: inline-block;
    padding: 8px 16px;
}


backlink:hover {
    background-color: #2c74b2;
    color: white;
}

.previous {
    background-color: #428BCA;
    color: white;
}


.round {
    border-radius: 10%;
}
        </style>
    </head>
      <body>
        <%@include file="admin header.jsp" %>
        <div class="container">
            <% String temp =request.getParameter("branch"); %>
            <div class="row">
            <div class="col-md-2">
        <a href="admin_subject1.jsp?branch=<%=temp%>" class="previous round backlink">Back</a>
            </div>
            <div class="col-md-10"></div>
            
        </div>
            
        
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
          <option>CSE</option>
          <option>ECE</option>
          <option>ME</option>
          <option>CE</option>
         
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
          <%@include file="ConnectPage.jsp" %>
          <%
           String qry3 = "select * from faculty " ;
            ResultSet rs3 = smt.executeQuery(qry3);
            while(rs3.next())
            {
            %>
              <option value="<%=rs3.getString(1) %>"><%=rs3.getString(2) %></option>
            
              <% } %>
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
