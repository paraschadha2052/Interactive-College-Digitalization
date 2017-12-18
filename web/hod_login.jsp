<%-- 
    Document   : hod_login
    Created on : Dec 19, 2017, 12:44:18 AM
    Author     : DV
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
        
        <%
        String error=""; 
        String error1="";
        String error2="";
        if(request.getParameter("btnLogin")!=null)
        {
        String username,pass;
        username=request.getParameter("inputUsername");
        pass=request.getParameter("inputPassword");
        
        try
        {
        String qry="select * from login where username='"+username+"' and password='"+pass+"' and type='HOD'";
        ResultSet rs=smt.executeQuery(qry);
        if(rs.next())
        {
            String verified = rs.getString(4);
            System.out.println("Verified: "+verified);
            if(verified.equals("yes")){
                session.setAttribute("username", username);
                response.sendRedirect("hod_home.jsp");
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
       
        <div class="form">
        <div class="admin_login_head">HOD Login</div>
       
          <form method="post">
          
          <div class="field-wrap">
            <label for="inputUsername" class="col-lg-2 control-label">Username</label>
            <div class="col-lg-12">
            <input type="text" class="form-control" id="inputUsername" name="inputUsername" placeholder="Username" required>
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
                <div class="col-md-12">
                    <button type="submit" class="button" name="btnLogin">Login</button>
            
                </div>
            </div>
            
          </div>
          
          </form>
        </div>

        
    </body>
</html>
