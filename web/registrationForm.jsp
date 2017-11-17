

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
            function checkRollno(str)
            {
                
                var rdiv=document.getElementById("resultRollno");
                var objrequest=new XMLHttpRequest();  //server ko bhejna request
                objrequest.onreadystatechange=function()
                {
                    //event ki binding hori h jb readystatechange hoga
                    //function khud fire hoga
                    if(objrequest.readyState===4 && objrequest.status===200)
                    {
                        //request phuncha ya ni phuncha?
                        //phunch gya to
                        rdiv.innerHTML=objrequest.responseText;
                    }  
                };
                objrequest.open("GET", "ajax_registration.jsp?rollno="+str+"",true);
                objrequest.send();   
            }
            
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
                       
                }
                    objrequest.open("GET","ajax_valid_Name.jsp?name="+str+"",true);
                    objrequest.send();    
            }
            
             function checkFname(str)
            {
                var rdiv = document.getElementById("resultFname");
                var objrequest = new XMLHttpRequest;
                
                objrequest.onreadystatechange = function()
                {
                    if(objrequest.readyState===4 && objrequest.status===200)
                    {
                        rdiv.innerHTML = objrequest.responseText;
                    }
                       
                }
                    objrequest.open("GET","ajax_valid_Fname.jsp?fname="+str+"",true);
                    objrequest.send();    
            }
            function checkMname(str)
            {
                var rdiv = document.getElementById("resultMname");
                var objrequest = new XMLHttpRequest;
                
                objrequest.onreadystatechange = function()
                {
                    if(objrequest.readyState===4 && objrequest.status===200)
                    {
                        rdiv.innerHTML = objrequest.responseText;
                    }
                       
                }
                    objrequest.open("GET","ajax_valid_Mname.jsp?mname="+str+"",true);
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
                       
                }
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
                       
                }
                    objrequest.open("GET","ajax_valid_Mobileno.jsp?mobileno="+str+"",true);
                    objrequest.send();    
            }
             function checkPMobileno(str)
            {
                var rdiv = document.getElementById("resultPMobileno");
                var objrequest = new XMLHttpRequest;
                
                objrequest.onreadystatechange = function()
                {
                    if(objrequest.readyState===4 && objrequest.status===200)
                    {
                        rdiv.innerHTML = objrequest.responseText;
                    }
                       
                }
                    objrequest.open("GET","ajax_valid_PMobileno.jsp?pmobileno="+str+"",true);
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
                       
                }
                    objrequest.open("GET","ajax_valid_Email.jsp?email="+str+"",true);
                    objrequest.send();    
            }
        </script>
                         
    </head>
    
    <body>
       
        
        <div class="container">
    <form action="signup.jsp" class="form-horizontal" method="post">
  <fieldset>
    <legend>Registration Form</legend>
    
    <div class="form-group">
      <label for="name" class="col-lg-2 control-label">Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbname" class="form-control" id="name" onkeyup="checkName(this.value)" placeholder="Name">
           <br> <div  id="resultName"> </div>  
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
          <input type="text" name="tbDob" class="form-control" id="dob" placeholder="MM/DD/YYYY"><script>DateInput('orderdate', true, 'DD-MON-YYYY')</script>
      </div>
    </div>
    
    <div class="form-group">
      <label for="fname" class="col-lg-2 control-label">Father's Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbFname" class="form-control" id="fname" onkeyup="checkFname(this.value)" placeholder="Father's Name">
          <br> <div  id="resultFname"> </div>  
      </div>
    </div>
    
    <div class="form-group">
      <label for="mname" class="col-lg-2 control-label">Mother's Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbMname" class="form-control" id="mname" onkeyup="checkMname(this.value)" placeholder="Mother's Name">
          <br> <div  id="resultMname"> </div> 
      </div>
    </div>
    
    <div class="form-group">
      <label for="add_present" class="col-lg-2 control-label">Present Address</label>
      <div class="col-lg-10">
          <textarea name="txtAddPresent" class="form-control" rows="3" id="add_present"></textarea>
        <span class="help-block">Hostlers to mention their hostel address.</span>
      </div>
    </div>
    
    <div class="form-group">
      <label for="add_permanent" class="col-lg-2 control-label">Permanent Address</label>
      <div class="col-lg-10">
          <textarea name="txtAddPermanent" class="form-control" rows="3" id="add_permanent"></textarea>
      </div>
    </div>
    
    <div class="form-group">
      <label for="reg_no" class="col-lg-2 control-label">University Registration No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbRegNo" class="form-control" id="reg_no" placeholder="University Registration No.">
      </div>
    </div>
    
    <div class="form-group">
      <label for="roll_no" class="col-lg-2 control-label">College Roll No.</label>
      <div class="col-lg-10">
          
          <input type="text" name="tbRollNo" class="form-control" id="roll_no" onkeyup="checkRollno(this.value)" placeholder="College Roll No.">
          <br> <div  id="resultRollno"> </div>  
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
          <input type="text" name="tbUID" class="form-control" id="uid" onkeyup="checkUid(this.value)" placeholder="UID/Adhar card Number">
          <br> <div  id="resultUid"> </div>
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
      <label for="pmobile_no" class="col-lg-2 control-label">Parent's Mobile No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbPmobile" class="form-control" id="pmobile_no" onkeyup="checkPMobileno(this.value)" placeholder="Parent's Mobile No.">
          <br> <div  id="resultPMobileno"> </div>
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
          <input type="text" name="tbBatch" class="form-control" id="batch" placeholder="Batch (StartingYear-EndingYear)YYYY-YYYY ">
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
