<%-- 
    Document   : hod_view_students1
    Created on : Dec 18, 2017, 11:57:31 PM
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
         <%@include file="hod_header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <%@include file="SesssionCheck.jsp" %> 
         
         <div class="container">
    
  <form method="post" action="export.jsp">
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
      <th style="color: white">Student's Email</th>
      
        <input type="hidden" name="head_1" value="Roll No">
        <input type="hidden" name="head_2" value="Name">
        <input type="hidden" name="head_3" value="University registration no">
        <input type="hidden" name="head_4" value="Gender">
        <input type="hidden" name="head_5" value="Contact No.">
        <input type="hidden" name="head_6" value="Parent's contact no">
        <input type="hidden" name="head_7" value="Student's Email">
      
         </tr>
  </thead>
  <tbody>
         <%
         
         
         String qry1 = "select department from faculty where F_id='"+username+"'";
         ResultSet rs1 = smt.executeQuery(qry1);
         rs1.next();
            
            String branch=rs1.getString(1);
             int sem= Integer.parseInt(request.getParameter("semesterSelect"));
             int i=1;
             
            
            
            String qry = "select * from student  where branch='"+branch+"'and semester="+sem+" order by roll_no asc";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
           
          %>
                                <tr>
                                     <td> <%=i%> </td>
                                     <td><%= rs.getString(9)%></td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(8)%></td>
                                     <td><%=rs.getString(2)%></td>                                  
                                     <td><%=rs.getString(12)%></td>                               
                                     <td><%=rs.getString(13)%></td>
                                     <td><%=rs.getString(14)%></td>
                                     
                                    
                                    <input type="hidden" name="data_<%=i%>:1" value="<%= rs.getString(9)%>">
                                    <input type="hidden" name="data_<%=i%>:2" value="<%=rs.getString(1)%>">
                                    <input type="hidden" name="data_<%=i%>:3" value="<%=rs.getString(8)%>">
                                    <input type="hidden" name="data_<%=i%>:4" value="<%=rs.getString(2)%>">
                                    <input type="hidden" name="data_<%=i%>:5" value="<%=rs.getString(12)%>">
                                    <input type="hidden" name="data_<%=i%>:6" value="<%=rs.getString(13)%>">
                                    <input type="hidden" name="data_<%=i%>:7" value="<%=rs.getString(14)%>">
                               </tr>
          
           <% 
            i=i+1;
            }              
                 %>
                
                 
    </tbody>
    </table>
    <input type="hidden" name="dataLength" value="<%=i%>">
    <center><button type="submit" name="submit" class="btn btn-default">Export as CSV</button></center>
    </form>
                  </div>
    </body>
</html>
