<%-- 
    Document   : student_home
    Created on : Oct 28, 2017, 9:55:31 PM
    Author     : Jitesh Mahla
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
        if(username != null)
        {
            String qry = "select * from student where roll_no='"+username+"'";
            ResultSet rs = smt.executeQuery(qry);
            if(rs.next())
            {
                
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
      <th>SUBJECT</th>
      <th>TOTAL LECTURES</th>
      <th>LECTURES ATTENDED</th>
    </tr>
  </thead>
  <tbody>
                 <%
        
            String qry1 = "select * from attendance where roll_no='"+username+"'";
            int i=1;
            ResultSet rs1 = smt.executeQuery(qry1);
            while(rs1.next())
            {
                
                 %>
      
    <tr>
      <td> <%=i %> </td>
      <td><%=rs1.getString(2)%></td>
      <td><%=rs1.getString(3)%></td>
      <td><%=rs1.getString(4)%></td>
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
    </body>
</html>
