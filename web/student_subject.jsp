<%-- 
    Document   : view_attendance11
    Created on : Dec 15, 2017, 7:37:11 AM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
    </head>
    <body>
         <%@include file="student_header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <%@include file="SesssionCheck.jsp" %> 
         
                  <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      
      
      <th style="color: white">Subject Code</th>
       <th style="color: white">Subject Name</th>
      <th style="color: white">Subject Credits</th>
      <th style="color: white">Teacher</th>
      
         </tr>
  </thead>
  <tbody>
      <%
      int i=1;
        if(username != null)
        {
            String qry = "select su.sub_code, su.sub_name, su.sub_credits, f.name from faculty f, student s, subject su where s.roll_no='"+username+"' and s.branch=su.branch and s.semester=su.semester and f.f_id=su.f_id order by su.sub_code asc";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
           
          %>
                                <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td><%=rs.getString(3)%></td>
                                     <td><%=rs.getString(4)%></td>    
                               </tr>
          
           <% 
            i=i+1;
            } 
        }
                 %>
                 
    </tbody>
    </table> 
    </body>
</html>
