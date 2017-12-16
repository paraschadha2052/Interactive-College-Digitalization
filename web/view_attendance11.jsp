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
         <%@include file="admin header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <%@include file="SesssionCheck.jsp" %> 
         
                  <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      
      <th style="color: white">Student ID</th>
      <th style="color: white">Name</th>
      <th style="color: white">Subject Name</th>
       <th style="color: white">Total lectures</th>
      <th style="color: white">Lecture Attended </th>
   
      
         </tr>
  </thead>
  <tbody>
         <%
             String branch=request.getParameter("branchSelect");
             int sem= Integer.parseInt(request.getParameter("semesterSelect"));
             int i=1;
             
            
            
            String qry = "select s.roll_no, s.name, su.sub_name,  a.tot_lec, a.lec_att from attendance a, student s, subject su where s.roll_no=a.roll_no and s.branch='"+branch+"' and su.sub_code=a.sub_code and s.semester="+sem+" order by s.roll_no asc";
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
                                     <td><%=rs.getString(5)%></td>
                               </tr>
          
           <% 
            i=i+1;
            }              
                 %>
                 
    </tbody>
    </table> 
    </body>
</html>
