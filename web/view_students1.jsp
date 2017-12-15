<%-- 
    Document   : view_students1
    Created on : Dec 15, 2017, 8:03:19 AM
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
         <%@include file="admin header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <div class="container-fluid">
         
                  <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      
      <th style="color: white">Roll No</th>
      <th style="color: white">Name</th>
      <th style="color: white">University registration no</th>
      <th style="color: white">Gender</th>
       <th style="color: white">Contact No.</th>
      <th style="color: white">Parent's contact no</th>
      <th style="color: white">Present Address</th>
   
      
         </tr>
  </thead>
  <tbody>
         <%
             String branch=request.getParameter("branchSelect");
             int sem= Integer.parseInt(request.getParameter("semesterSelect"));
             int i=1;
             
            
            
            String qry = "select * from student  where branch='"+branch+"'and semester="+sem+" order by roll_no asc";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
           
          %>
                                <tr>
                                     <td> <%=i %> </td>
                                     <td><%= rs.getString(9)%></td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(8)%></td>
                                     <td><%=rs.getString(2)%></td>                                  
                                     <td><%=rs.getString(12)%></td>                               
                                     <td><%=rs.getString(13)%></td>                                                               
                                     <td><%=rs.getString(6)%></td>
                               </tr>
          
           <% 
            i=i+1;
            }              
                 %>
                
                 
    </tbody>
    </table> 
                  </div>
    </body>
</html>
