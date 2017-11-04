<%-- 
    Document   : verify
    Created on : 28 Oct, 2017, 10:55:57 PM
    Author     : paras
--%>

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

<%
    String error = "";
    
    if(request.getParameter("btnSet")!=null){
        String username = session.getAttribute("username").toString();
        String password, confirmPassword;
        password = request.getParameter("inputPassword");
        confirmPassword = request.getParameter("confirmPassword");
        if(password.equals(confirmPassword)){
            smt = con.createStatement();
            String qry = "update login set password = '"+password+"' where username='"+username+"'";
            if(smt.executeUpdate(qry)>0){
                out.println("Password Set successfully!<br /> Redirecting to homepage!");
                response.setHeader("Refresh", "1;url=student_home.jsp");
            }
        }
        else{
            error = "Passwords donot match. Try again.";
        }
    }
    else{
        String username=request.getParameter("username");
        String hash=request.getParameter("hash");

        String qry="select * from login where username='"+username+"' and hash='"+hash+"'";
        ResultSet rs=smt.executeQuery(qry);
        if(rs.next()){
            if(rs.getString(4).equals("no")){
                smt = con.createStatement();
                qry = "update login set verified = 'yes' where username='"+username+"'";
                if(smt.executeUpdate(qry)>0){
                    out.println("Verified Successfully !<br /> Please Set your password!");
                    session.setAttribute("username", username);
                }
            }
            else{
                // already verified...
                response.sendRedirect("login_page.jsp");
            }
        }
    }

%>

<div class="container">

    <form class="form-horizontal" method="post">
  <fieldset>
    
    <div class="form-group">
      <label for="inputPassword" class="col-lg-2 control-label">Password</label>
      <div class="col-lg-10">
        <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password">
      </div>
    </div>
      
    <div class="form-group">
      <label for="confirmPassword" class="col-lg-2 control-label">Confirm Password</label>
      <div class="col-lg-10">
        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  
    
    </body>
</html>
