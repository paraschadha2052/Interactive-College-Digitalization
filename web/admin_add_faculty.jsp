<%-- 
    Document   : admin_add_faculty
    Created on : Dec 16, 2017, 8:36:12 PM
    Author     : Jitesh Mahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="css/stylesheet.css">
            
        <script type="text/javascript">
            function checkName(str)
            {
                var rdiv = document.getElementById("resultName");
                var objrequest = new XMLHttpRequest;
                
                objrequest.onreadystatechange = function()
                {
                    if(objrequest.readyState===4 && objrequest.status===200)
                    {
                        rdiv.innerHTML = objrequest.responseText;
                    }
                       
                };
                    objrequest.open("GET","ajax_valid_Name.jsp?name="+str+"",true);
                    objrequest.send();    
            }
                      
            function checkEmail(str)
            {
                var rdiv = document.getElementById("resultEmail");
                var objrequest = new XMLHttpRequest;
                
                objrequest.onreadystatechange = function()
                {
                    if(objrequest.readyState===4 && objrequest.status===200)
                    {
                        rdiv.innerHTML = objrequest.responseText;
                    }
                       
                };
                    objrequest.open("GET","ajax_valid_Email.jsp?email="+str+"",true);
                    objrequest.send();    
            }
        </script>
        
    </head>
    <body>
        
         <%@include file="HeaderPage.jsp" %>
         <%@include file="SesssionCheck.jsp" %>
         <div class="container">
             
         
         <form action="admin_add_faculty_backend.jsp" class="form-horizontal" method="post">
  <fieldset>
    <legend>Registration Form</legend>
    
    <div class="form-group">
      <label for="fid" class="col-lg-2 control-label">Registration Id</label>
      
      <div class="col-lg-10">
          <input type="text" name="tbfid" class="form-control" id="fid" placeholder="Faculty Id" required>
           <br> <div  id="resultName"> </div>  
      </div>
    </div>
    
    <div class="form-group">
      <label for="name" class="col-lg-2 control-label">Name</label>
      
      <div class="col-lg-10">
          <input type="text" name="tbName" class="form-control" id="name" onkeyup="checkName(this.value);" placeholder="Name" required>
           <br> <div  id="resultName"> </div>  
      </div>
    </div>
    
    <div class="form-group">
      <label for="email" class="col-lg-2 control-label">Email Id</label>
      <div class="col-lg-10">
          <input type="text" name="tbEmail" class="form-control" id="email" onkeyup="checkEmail(this.value)" placeholder="email" required>
          <br> <div  id="resultEmail"> </div>
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="post" class="col-lg-2 control-label">Designation</label>
      <div class="col-lg-10">
          <input type="text" name="tbpost" class="form-control" id="post" placeholder="Designation" required>
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
             </div>
        
    </body>
</html>
