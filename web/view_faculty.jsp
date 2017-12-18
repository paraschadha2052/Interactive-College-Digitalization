<%-- 
    Document   : view_faculty
    Created on : Dec 15, 2017, 8:39:01 AM
    Author     : DV
--%>


<%@page import="java.sql.ResultSet"%>
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
         
         <div class="container">
         
             <div class="row"> 
            <div class="col-md-2"></div>
            <a href="admin_add_faculty.jsp" style="color: white">
            <div class="col-md-8">
                <p class="admin">Add New Faculty</p>
            </div>
            </a>
            <div class="col-md-2"></div>
        </div>
             
                  <table class="table table-striped table-hover table-bordered">
         <thead style="background-color: black">
     <tr>
      <th></th>
      
      <th style="color: white">ID</th>
      <th style="color: white">Name</th>
      <th style="color: white">Department</th>
      <th style="color: white">Mobile</th>
       <th style="color: white">Email</th>
      <th style="color: white">Present Address</th>
    <th style="color: white">Post</th>
      
         </tr>
  </thead>
  <tbody>
         <%          
         String branch=request.getParameter("branch");
         int i=1;
         String qry;
         if(branch.equals("ALL"))
         {
          //  out.println(branch);
             qry = "select * from faculty order by f_id asc";
         }
         else
         {
            // out.println(branch);
             qry = "select * from faculty where department='"+branch+"'  order by f_id asc";
         }
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
           
          %>
                                <tr>
                                     <td> <%=i %> </td>
                                     <td><%= rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td><%=rs.getString(3)%></td>
                                     <td><%=rs.getString(4)%></td>                                  
                                     <td><%=rs.getString(5)%></td>                                                               
                                     <td><%=rs.getString(7)%></td>                                
                                     <td><%=rs.getString(8)%></td>
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
