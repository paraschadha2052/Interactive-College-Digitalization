<%-- 
    Document   : Generic_login_home
    Created on : Nov 16, 2017, 9:31:01 PM
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
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      
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
        
        
        <div class="jumbotron">
            <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <img src="images/logo.jpg" height="100" width="130" alt="CCET Logo">
                </div>
                <p class="col-md-8" style="margin-top: 30px;">Chandigarh College of Engineering and Technology</p>

            </div>
            </div>
        </div>
        
        
        <div class="row"> 
            <div class="col-md-10"></div>
            <div class="col-md-2">
                <p class="admin"><a href="#" style="color: white">Admin Login</a></p>
            </div>
        </div>
        
        
         <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Student Login</a></li>
        <li class="tab"><a href="#login">Faculty Login</a></li>
      </ul>
      
      <div class="tab-content">
          
        <div id="signup"> 
            
          <form method="post">
          
          <div class="field-wrap">
            <label for="inputUsername" class="col-lg-2 control-label">Username</label>
            <div class="col-lg-12">
            <input type="text" class="form-control" id="inputUsername" name="inputUsername" placeholder="Student Username">
            </div>
          <div class="alert">
            <%=error1%>
          </div>
          </div>

          <div class="field-wrap">
            <label for="inputPassword" class="col-lg-2 control-label">Password</label>
            <div class="col-lg-12">
                <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password">
            </div>
            <div class="alert">
                <%=error2%>
            </div>
          </div>
          
          <div class="form-group">
      
            <div class="alert">
                <%=error%>
            </div>
            
            <div class="row">  
            <p class="forgot"><a href="#">Forgot Password?</a></p>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="button" name="btnLogin">Login</button>
            
                </div>
            </div>
            
          </div>
          
          </form>

        </div>
        
        <div id="login">   
            
          <form action="/" method="post">
          
          
          <div class="form-group">
            <label for="inputUsername" class="col-lg-2 control-label">Username</label>
            <div class="col-lg-10">
            <input type="text" class="form-control" id="inputUsername" name="inputUsername" placeholder="Faculty Username">
            </div>
          <div class="alert">
            <%=error1%>
          </div>
          </div>

          <div class="form-group">
            <label for="inputPassword" class="col-lg-2 control-label">Password</label>
            <div class="col-lg-10">
                <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password">
            </div>
            <div class="alert">
                <%=error2%>
            </div>
          </div>
          
          <div class="form-group">
           
      
            <div class="alert">
                <%=error%>
            </div>
            
            <div class="row">  
            <p class="forgot"><a href="#">Forgot Password?</a></p>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="button" name="btnLogin">Login</button>
            
                </div>
            </div>
          </div>
          
          </form>
        </div>
            
      </div>
            
         </div>
        
           
    <script  src="js/index.js"></script>
    </body>
</html>
