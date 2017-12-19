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
        <link rel="stylesheet" href="css/newDesign.css">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      
    </head>
    <body>
        
        <%@include file="ConnectPage.jsp" %>
        <%@include file="HeaderPage.jsp" %>
    
         <%
        String error=""; 
        String error1="";
        String error2="";
        if(request.getParameter("btnLoginStudent")!=null)
        {
        String username,pass;
        username=request.getParameter("inputUsername");
        pass=request.getParameter("inputPassword");
        
        try
        {
        String qry="select * from login where username='"+username+"' and password='"+pass+"' and type='student'";
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

        %>
        
        <%
        if(request.getParameter("btnLoginFaculty")!=null)
        {
        String username,pass;
        username=request.getParameter("inputUsername");
        pass=request.getParameter("inputPassword");
        
        try
        {
        String qry="select * from login where username='"+username+"' and password='"+pass+"' and type='faculty'";
        ResultSet rs=smt.executeQuery(qry);
        if(rs.next())
        {
            String verified = rs.getString(4);
            System.out.println("Verified: "+verified);
            if(verified.equals("yes")){
                session.setAttribute("username", username);
                response.sendRedirect("faculty_home.jsp");
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

        %>
        
        <div style="background-color: #428bca">
        <nav class="navbar">

                  <div class="container-fluid" style="font-size: medium">
    <ul class="nav navbar-nav navbar-right" >
        <li><a href="registrationForm.jsp" style="color: white"><span class="glyphicon glyphicon-home"></span>Student Registration</a></li>
         <li><a href="hod_login.jsp"  style="color: white">HOD Login</a></li>
        <li><a href="admin_login.jsp" style="color: white">Admin Login</a></li>
      </ul>
     </div>
</nav>
        </div>
        
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
        <marquee  onmousedown="this.stop();" onmouseup="this.start();" scrollamount="8">                                    
            Welcome to Chandigarh College of Engineering and Technology.
        </marquee>
            </div>
            <div class="col-md-1"></div>
        </div>
        
      
        
        <div class="row">
            <div class="col-md-4">
         <div class="form">
      
             <ul class="tab-group" >
        <li class="tab active" ><a href="#student_login">Student Login</a></li>
        <li class="tab" ><a href="#faculty_login">Faculty Login</a></li>
      </ul>
      
      <div class="tab-content">
          
        <div id="student_login"> 
            
          <form method="post">
          
          <div class="field-wrap">
            <label for="inputUsername" class="col-lg-2 control-label">Username</label>
            <div class="col-lg-12">
            <input type="text" class="form-control" id="inputUsername" name="inputUsername" placeholder="Student Username" required>
            </div>
          <div class="alert">
            <%=error1%>
          </div>
          </div>

          <div class="field-wrap">
            <label for="inputPassword" class="col-lg-2 control-label">Password</label>
            <div class="col-lg-12">
                <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password" required>
            </div>
            <div class="alert">
                <%=error2%>
            </div>
          </div>
          
          <div class="form-group">
      
            <div class="alert">
                <%=error%>
            </div>
            
            <div class="row forgot" >  
            <p><a href="forgot_password.jsp" style="color: #064983">Forgot Password?</a></p>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="button" name="btnLoginStudent">Login</button>
            
                </div>
            </div>
            
          </div>
          
          </form>

        </div>
        
        <div id="faculty_login">   
            
          <form method="post">
          
          
          <div class="field-wrap">
            <label for="inputUsername" class="col-lg-2 control-label">Username</label>
            <div class="col-lg-12">
            <input type="text" class="form-control" id="inputUsername" name="inputUsername" placeholder="Faculty Username" required>
            </div>
          <div class="alert">
            <%=error1%>
          </div>
          </div>

          <div class="field-wrap">
            <label for="inputPassword" class="col-lg-2 control-label">Password</label>
            <div class="col-lg-12">
                <input type="password" class="form-control" id="inputPassword" name="inputPassword" placeholder="Password" required>
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
            <p class="forgot"><a href="forgot_password.jsp" style="color: #064983" >Forgot Password?</a></p>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <button type="submit" class="button"  name="btnLoginFaculty">Login</button>
            
                </div>
            </div>
            
          </div>
          
          </form>
        </div>
            
      </div>
            
         </div>
            </div>
            
            
            
            <div class="col-md-8">
               
                    
                   
                <div class="notice_bulletin">
                     <%
                    String qry1 = "select * from notice order by Date desc LIMIT 5";
                    ResultSet rs1 = smt.executeQuery(qry1);
                    if(!rs1.next())
                    {
                        %>
                        
                         <div class="notice_style">
                            <div class="row">
                            <div class="col-md-12">
                      
                                <h3>No Current Notices.</h3>   
                        
                            </div>
                            </div>
                        </div>
                     
                         <%
                    }
                    else
                    {
                        
                        %>
                        <div class="notice_header"> <b>LATEST NEWS/NOTICES</b></div> 
                         <div class="row notice_head">
                                <div class="col-md-2">Date</div>
                                <div class="col-md-7">Subject</div>
                                <div class="col-md-3">Notice</div>
                            </div>
                         <%
                        rs1.beforeFirst();
                        while(rs1.next())
                            
                        {
                            
                            
                            %>
                          <div class="row notice_details">
                              <div class="col-md-2"><%=rs1.getString(4)%></div>
                                <div class="col-md-7"><%=rs1.getString(1)%></div>
                                <div class="col-md-3">
                                    <a href="./noticeupload/<%=rs1.getString(2)%>" target="_blank"><button type="button" class="btn-primary btn-xs" style="background-color: #028fc0" href="">Download</button></a> 	
                                   
                                </div>
                               
                            </div> 
  
        
            <% 
            }
                    }
            
           
               
                 %>
                 
                 <a href="notices.jsp?n=1&next=1&prev=1">view more</a>
                
                </div>
           
        </div>
                
            </div>
            
           
      
    <script  src="js/index.js"></script>
    </body>
</html>
