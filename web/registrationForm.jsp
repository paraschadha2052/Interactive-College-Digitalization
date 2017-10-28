

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="css/stylesheet.css">
    </head>
    
    <body>
       <%@include file="ConnectPage.jsp" %>
        
        
        
        
        <div class="container">
       <form class="form-horizontal">
  <fieldset>
    <legend>Registration Form</legend>
    
    <div class="form-group">
      <label for="name" class="col-lg-2 control-label">Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbname" class="form-control" id="name" placeholder="Name">
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
          <input type="text" name="tbDob" class="form-control" id="dob" placeholder="dd-mm-yyyy">
      </div>
    </div>
    
    <div class="form-group">
      <label for="fname" class="col-lg-2 control-label">Father's Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbFname" class="form-control" id="fname" placeholder="Father's Name">
      </div>
    </div>
    
    <div class="form-group">
      <label for="mname" class="col-lg-2 control-label">Mother's Name</label>
      <div class="col-lg-10">
          <input type="text" name="tbMname" class="form-control" id="mname" placeholder="Mother's Name">
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
          <input type="text" name="tbRollNo" class="form-control" id="roll_no" placeholder="College Roll No.">
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
          <input type="text" name="tbUID" class="form-control" id="uid" placeholder="UID/Adhar card Number">
      </div>
    </div>
    
    <div class="form-group">
      <label for="mobile_no" class="col-lg-2 control-label">Mobile No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbMobile" class="form-control" id="mobile_no" placeholder="Mobile No.">
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="pmobile_no" class="col-lg-2 control-label">Parent's Mobile No.</label>
      <div class="col-lg-10">
          <input type="text" name="tbPmobile" class="form-control" id="pmobile_no" placeholder="Parent's Mobile No.">
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="email" class="col-lg-2 control-label">Email Id</label>
      <div class="col-lg-10">
          <input type="text" name="tbEmail" class="form-control" id="email" placeholder="email">
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
        
            
             <%
        if(request.getParameter("btnSubmit")!=null) 
           {
               String name,sex,dob,f_name, m_name,add_present, add_permanent, reg_no, roll_no, branch, uid,email, category, batch;
               int mobile ,parent_mobile,hostler;
               
               name=request.getParameter("tbName");
               sex=request.getParameter("sexRadio");
               dob=request.getParameter("tbDob");
               f_name=request.getParameter("tbFname");
               m_name=request.getParameter("tbMname");
               add_present=request.getParameter("txtAddPresent");
               add_permanent=request.getParameter("txtAddPermanent");
               reg_no=request.getParameter("tbRegNo");
               roll_no=request.getParameter("tbRollNo");
               branch=request.getParameter("tbBranch");
               uid=request.getParameter("tbUID");
               mobile=Integer.parseInt(request.getParameter("tbMobile"));
               parent_mobile=Integer.parseInt(request.getParameter("tbPmobile"));
               email=request.getParameter("tbEmail");
               category=request.getParameter("categorySelect");
               hostler=Integer.parseInt(request.getParameter("hostlerRadio"));
               batch=request.getParameter("tbBatch");
               
               
               try
               {
                   
                   smt=con.createStatement();
                   String qry ="insert into student values('"+name+"','"+sex+"','"+dob+"','"+f_name+"', '"+m_name+"','"+add_present+"', '"+add_permanent+"', '"+reg_no+"', '"+roll_no+"','"+ branch+"', '"+uid+"',"+mobile+","+parent_mobile+",'"+email+"', '"+category+"',"+hostler+" ,'"+batch+"')" ;
                   int r=smt.executeUpdate(qry);
                   if(r>0)
                   {
                       out.println("<p>Record has been inserted</p>");
                   }
                   
                   else
                   {
                           out.println("<p>Failed</p>");
                   }
                   con.close();
               }
               
               catch(Exception ex)
                       {
                           out.println("ERROR :<BR><p>"+ex+"</p>");  
                       }
           }
        %>
        
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
        </div>
    </body>
</html>
