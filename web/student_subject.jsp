<%-- 
    Document   : student_subject
    Created on : Nov 16, 2017, 11:20:56 PM
    Author     : DV
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css" /> 
    </head>
    
    <body>
        <div class="container-fluid">
        <%@include file="student_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        <%@include file="SesssionCheck.jsp" %>  
     
         <%
          String sem="NA", branch="NA";
        if(username != null)
        {
           
            String qry = "select * from student where roll_no='"+username+"'";
            ResultSet rs = smt.executeQuery(qry);
            if(rs.next())
            {
                sem=rs.getString(1);
                branch=rs.getString(10);
                 %>
                 <div class="container-fluid">
                 <h3 class="head3">Welcome <%=rs.getString(1)%>!!  I hope <%=rs.getString(1)%> is going well for you. Happy Engineering :)</h3>
                 <h4>Attendance Alert for you :</h4>
                 <% } else
            {
                out.println("<h3>Record not found.</h3>");
            }
                 %>
                 <br>
                 
                 <div class="container-fluid">
                         <table class="table table-striped table-hover table-bordered">
  <thead class="thead-dark">
    <tr>
      <th></th>
      <th>SUBJECT CODE</th>
      <th>SUBJECT NAME</th>
      <th>CREDITS</th>
    </tr>
  </thead>
  <tbody>
                 <%
        
            String qry1 = "select * from subjects where branch='"+branch+"' and semester='"+sem+"'";
            int i=1;
            ResultSet rs1 = smt.executeQuery(qry1);
            while(rs1.next())
            {
              
                 %>
      
    <tr>
      <td> <%=i %> </td>
      <td><%=rs1.getString(1)%></td>
      <td><%=rs1.getString(2)%></td>
      <td><%=rs1.getString(3)%></td>
    </tr>
            <% 
            i=i+1;
            } 
            %>
  </tbody>
</table> 
  <h3 class="head3">  Happy Engineering :)</h3>
                 </div>
                 </div>
           <% 
            
        }
                %>   
        </div>
        
        
                
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
        
    
    </body>
</html>
