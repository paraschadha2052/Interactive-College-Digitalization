
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
    <%@include file="HeaderPage.jsp" %>

<%
    String error="";
    
    if(request.getParameter("btnSet")!=null){
        
        String username=request.getParameter("username");
        out.println(username);
        String password, confirmPassword;
        password = request.getParameter("inputPassword");
        confirmPassword = request.getParameter("confirmPassword");
        if(password.equals(confirmPassword)){
            smt = con.createStatement();
            String qry = "update login set password = '"+password+"' where username='"+username+"'";
            if(smt.executeUpdate(qry)>0){
                response.sendRedirect("pass_redirect.jsp?un="+username);              
            }
        }
        else{
            error = "Passwords donot match. Try again.";
        }
    }
    

%>

<div class="row">
    <div class="row">
    </div>
</div>
    
<div class="container">

    <form class="form-horizontal" method="post">
  <fieldset>
    
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Enter new Password</label>
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
    
    
     <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
      
          <div class="alert-login">
            <%=error%>
          </div>
         
        <button type="submit" class="btn btn-primary" name="btnSet">Submit</button>
      </div>
    </div>
    
    
    </fieldset>
</form>
        
     </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  
    
    </body>
</html>
