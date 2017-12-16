<%-- 
    Document   : faculty_verify
    Created on : Dec 16, 2017, 9:36:15 PM
    Author     : Jitesh Mahla
--%>

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
         <%@include file="HeaderPage.jsp" %>
        <div class="container">
            
             <%
             
    String username=request.getParameter("username");
     
    String error1="";
        
    if(request.getParameter("btnSet")!=null){
        
    String f_id, name,add, department, uid,email, mobile ,post;

    f_id=request.getParameter("tbfid");
    department=request.getParameter("branchSelect");
    uid=request.getParameter("tbUID");
    mobile=request.getParameter("tbMobile");
    add=request.getParameter("txtAdd");
    
    
        String qry0 ="update faculty set department = '"+department+"' and mobile = '"+mobile+"' and UID = '"+uid+"' and address = '"+add+"' where f_id='"+f_id+"'" ;
        int r=smt.executeUpdate(qry0);
        if(r>0)
        {
            out.println("<p>Record Updated.</p>");
        }
        else
        {
            out.println("<p>An Error occured while inserting into the database. Try again later</p>");
        }
       
        String password, confirmPassword;
        password = request.getParameter("inputPassword");
        confirmPassword = request.getParameter("confirmPassword");
        if(password.equals(confirmPassword)){
            smt = con.createStatement();
            String qryy = "update login set password = '"+password+"' where username='"+username+"'";
            if(smt.executeUpdate(qryy)>0){
                
                String qry1="select * from login where username='"+username+"'";
                ResultSet rs1=smt.executeQuery(qry1);
                if(rs1.next()){
                    session.setAttribute("username", username);
                    response.sendRedirect("faculty_home.jsp");
                }
            }
        }
        else{
            error1 = "Passwords do not match. Try again.";
        }
    }
    else{
        String hash=request.getParameter("hash");

        String qry2="select * from login where username='"+username+"' and hash='"+hash+"'";
        ResultSet rs2=smt.executeQuery(qry2);
        if(rs2.next()){
            if(rs2.getString(4).equals("no")){
                smt = con.createStatement();
                String qry = "update login set verified = 'yes' where username='"+username+"'";
                if(smt.executeUpdate(qry)>0){
                    session.setAttribute("username", username);
                }
            }
            else{
                // already verified...
                response.sendRedirect("Generic_login_page.jsp");
            }
        }
    }

%>

            <%
    String qry ="select * from faculty where f_id='"+username+"'";
                   smt = con.createStatement(); 
                   ResultSet rs=smt.executeQuery(qry);    //resulset is set of records
                   rs.next();
    %>

                 
            
    <form class="form-horizontal" method="post">
  <fieldset>
    <legend>Please Fill the following Details</legend>
    
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
          <input type="text" name="tbMobile" class="form-control" id="mobile_no" onkeyup="checkMobileno(this.value)" placeholder="Mobile No." required>
          <br> <div  id="resultMobileno"> </div>
      </div>
    </div>
    
    <div class="form-group">
      <label for="email" class="col-lg-2 control-label">Email Id</label>
      <div class="col-lg-10">
          <input type="text" name="tbEmail" class="form-control" id="email" value="<%= rs.getString(5)%>" onkeyup="checkEmail(this.value)" placeholder="email" readonly>
          <br> <div  id="resultEmail"> </div>
      </div>
    </div>
    
     <div class="form-group">
      <label for="uid" class="col-lg-2 control-label">UID</label>
      <div class="col-lg-10">
          <input type="text" name="tbUID" class="form-control" id="uid" onkeyup="checkUid(this.value)" placeholder="UID/Adhar card Number" required>
          <br> <div  id="resultUid"> </div>
      </div>
    </div>
     
    <div class="form-group">
      <label for="add_present" class="col-lg-2 control-label">Address</label>
      <div class="col-lg-10">
          <textarea name="txtAdd" class="form-control" rows="3" id="add_present" required></textarea>
      </div>
    </div>
    
    
    <div class="form-group">
      <label for="post" class="col-lg-2 control-label">Designation</label>
      <div class="col-lg-10">
          <input type="text" name="tbpost" class="form-control" id="post" value="<%= rs.getString(8)%>" placeholder="Designation" readonly>
      </div>
    </div>
       
    <legend>Set Password</legend>
    
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Enter Password</label>
      <div class="col-lg-10">
        <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password" required>
      </div>
    </div>
      
    <div class="form-group">
      <label for="confirmPassword" class="col-lg-2 control-label">Confirm Password</label>
      <div class="col-lg-10">
        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
      </div>
    </div>
    <div class="invalid-feedback">
            <%=error1%>
          </div>
    
    
     <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
      
          
        <button type="reset" class="btn btn-default" name="btnCancel">Cancel</button> 
        <button type="submit" class="btn btn-primary" name="btnSet">Submit</button>
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
