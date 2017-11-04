
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css" /> 
    </head>
    <body>
        <%@include file="ConnectPage.jsp" %>
    
         <%
        String error=""; 
        String error1="";
        String error2="";
        if(request.getParameter("btnLogin")!=null)
        {
        String username,pass;
        username=request.getParameter("inputUsername");
        pass=request.getParameter("inputPassword");
           
        if((username==null || username=="")&&(pass==null || pass==""))
        {
            error="Invalid Email id and Password";
        }
        else if(username==null || username=="")
        {
                error1="Invalid Email id";
                
        }
        else if(pass==null || pass=="")
        {
                error2="Invalid password";
        }
        else
        {
        
        try
        {
        String qry="select * from login where username='"+username+"' and password='"+pass+"'";
        ResultSet rs=smt.executeQuery(qry);
        if(rs.next())
        {
            String verified = rs.getString(4);
            System.out.println("Verified: "+verified);
            if(verified.equals("yes")){
                session.setAttribute("username", username);
                response.sendRedirect("student_home.jsp");
            }
            else{
                error="Account not verified. Please check your Email.";
            }
        }
        else
        {
            error="Incorrect username or password. Try again.";
        }
        }
        catch(Exception ex)
        {
        out.println(ex);
        }
        }
        }

        %>
        
        
        <div class="container">

        <form class="form-horizontal" method="post">
  <fieldset>
    <legend>Login</legend>
    <div class="form-group">
      <label for="inputUsername" class="col-lg-2 control-label">Username</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="inputUsername" name="inputUsername" placeholder="Username">
      </div>
      <div class="alert-login">
        <%=error1%>
    </div>
    </div>
    
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
      <div class="col-lg-10">
        <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password">
      </div>
      <div class="alert-login">
        <%=error2%>
    </div>
    </div>
    
    
     <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
      
          <div class="alert-login">
            <%=error%>
          </div>
        <button type="reset" class="btn btn-default" name="btnCancel">Cancel</button>
        <button type="submit" class="btn btn-primary" name="btnLogin">Login</button>
      </div>
    </div>
    
    
    </fieldset>
</form>
        
     </div>
       
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  
    
    </body>
</html>
