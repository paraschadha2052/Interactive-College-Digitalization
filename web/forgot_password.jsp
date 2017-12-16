
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
        
            
        <div class="form">
        <div class="admin_login_head">Forgot Password or Username?</div>
       
          <form action="forgot_password_email.jsp" method="post">
          
          <div class="field-wrap">
            <label for="inputUsername" class="control-label">Enter your registered email id:</label>
            <div class="col-lg-12">
            <input type="text" class="form-control" id="inputUsername" name="inputEmail" placeholder="Email id" required>
          
          </div>
          </div>
   
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="button" name="btnSubmit">Submit</button>
            
                </div>
            </div>
                     
          </form>
        
        </div>


        
    </body>
</html>
