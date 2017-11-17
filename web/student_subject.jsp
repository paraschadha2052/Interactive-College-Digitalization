<%-- 
    Document   : student_subject
    Created on : Nov 16, 2017, 11:20:56 PM
    Author     : DV
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css" /> 
    </head>
    
    <body>
       
        <div class="container-fluid">
            
        <%@include file="student_header.jsp" %>
        <%@include file="SesssionCheck.jsp" %> 
        
          <%
          
        if(request.getParameter("btnSubmit")==null) 
        {
            %>
        <div class="container">
    <form  class="form-horizontal" method="post">
  <fieldset>
    <legend>Select the class:</legend>
    
     
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
      <div class="col-lg-10 col-lg-offset-2">
          <button type="reset" name="btnCancel" class="btn btn-default">Cancel</button>
          <button type="submit" name="btnSubmit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </fieldset>
</form>
        
        <%
          }
        %>
         
        
        <%@include file="ConnectPage.jsp" %>
        
         <%
          
        if(request.getParameter("btnSubmit")!=null) 
        {
            %>
            <div class="container-fluid">
                         <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      <th style="color: white">SUBJECT_CODE</th>
      <th style="color: white">SUBJECT_NAME</th>
      <th style="color: white">CREDITS</th>
    </tr>
  </thead>
  <tbody>
      <%
             String sem, branch;
             
              sem=request.getParameter("semesterSelect");
              branch=request.getParameter("branchSelect"); 
              
              
             int i=1;
             
            String qry = "select * from subject where semester='"+sem+"' and branch='"+branch+"'";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
          %>
                 
                               <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td><%=rs.getString(3)%></td>
                                    
                               </tr>
        
            <% 
            i=i+1;
            }
            
            }
               
                 %>
         </tbody>
    </table> 
         </div>        
    </div>
        </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
        
    
    </body>
</html>
