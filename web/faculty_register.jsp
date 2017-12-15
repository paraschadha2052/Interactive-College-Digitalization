

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylesheet.css">
        
        <script type="text/javascript" src="calendarDateInput.js">
        </script>
 
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
            
             function checkUid(str)
            {
                var rdiv = document.getElementById("resultUid");
                var objrequest = new XMLHttpRequest;
                
                objrequest.onreadystatechange = function()
                {
                    if(objrequest.readyState===4 && objrequest.status===200)
                    {
                        rdiv.innerHTML = objrequest.responseText;
                    }
                       
                };
                    objrequest.open("GET","ajax_valid_Uid.jsp?uid="+str+"",true);
                    objrequest.send();    
            }
             function checkMobileno(str)
            {
                var rdiv = document.getElementById("resultMobileno");
                var objrequest = new XMLHttpRequest;
                
                objrequest.onreadystatechange = function()
                {
                    if(objrequest.readyState===4 && objrequest.status===200)
                    {
                        rdiv.innerHTML = objrequest.responseText;
                    }
                       
                };
                    objrequest.open("GET","ajax_valid_Mobileno.jsp?mobileno="+str+"",true);
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
        <div class="container">
            
        
    <form action="faculty_signup.jsp" class="form-horizontal" method="post">
  <fieldset>
    <legend>Registration Form</legend>
    
    <div class="form-group">
      <label for="fid" class="col-lg-2 control-label">Registration Id</label>
      
      <div class="col-lg-10">
          <input type="text" name="tbfid" class="form-control" id="fid" placeholder="Faculty Id">
           <br> <div  id="resultName"> </div>  
      </div>
    </div>
    
    <div class="form-group">
      <label for="name" class="col-lg-2 control-label">Name</label>
      
      <div class="col-lg-10">
          <input type="text" name="tbname" class="form-control" id="name" onkeyup="checkName(this.value);" placeholder="Name">
           <br> <div  id="resultName"> </div>  
      </div>
    </div>
    
     <div class="form-group">
      <label for="branchSelect" class="col-lg-2 control-label">Department</label>
      <div class="col-lg-10">
          <select name="department" class="form-control" id="branchSelect">
          <option>CSE</option>
          <option>ECE</option>
          <option>ME</option>
          <option>CE</option>
         
        </select>
      </div>
    </div>
    
   <div class="form-group">
      <label for="mobile_no" class="col-lg-2 control-label">Mobile No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbMobile" class="form-control" id="mobile_no" onkeyup="checkMobileno(this.value)" placeholder="Mobile No.">
          <br> <div  id="resultMobileno"> </div>
      </div>
    </div>
    
    <div class="form-group">
      <label for="email" class="col-lg-2 control-label">Email Id</label>
      <div class="col-lg-10">
          <input type="text" name="tbEmail" class="form-control" id="email" onkeyup="checkEmail(this.value)" placeholder="email">
          <br> <div  id="resultEmail"> </div>
      </div>
    </div>
    
     <div class="form-group">
      <label for="uid" class="col-lg-2 control-label">UID</label>
      <div class="col-lg-10">
          <input type="text" name="tbUID" class="form-control" id="uid" onkeyup="checkUid(this.value)" placeholder="UID/Adhar card Number">
          <br> <div  id="resultUid"> </div>
      </div>
    </div>
     
    <div class="form-group">
      <label for="add_present" class="col-lg-2 control-label">Address</label>
      <div class="col-lg-10">
          <textarea name="txtAdd" class="form-control" rows="3" id="add_present"></textarea>
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="post" class="col-lg-2 control-label">Designation</label>
      <div class="col-lg-10">
          <input type="text" name="tbpost" class="form-control" id="post" placeholder="Designation">
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
