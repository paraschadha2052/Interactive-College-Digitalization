<%-- 
    Document   : view_attendance1
    Created on : Dec 14, 2017, 10:42:30 PM
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
    
         <%
             String branch=request.getParameter("branchSelect");
             int sem= Integer.parseInt(request.getParameter("semesterSelect"));
             int i=1;
             
            
            String qry1 = "select sub_name,sub_code from subject where branch='"+branch+"' and semester='"+sem+"' order by sub_code asc ";
            ResultSet rs1 = smt.executeQuery(qry1);
             while(rs1.next()) {
            %>
      
       <th style="color: white"><%=rs1.getString(1)%> Lecture Attended</th>
      <th style="color: white"><%=rs1.getString(1)%> Lecture Attended After Last Amended</th>
   
      
      
      <% } %>
      </tr>
  </thead>
  <tbody>
                    <%
            
            String roll_no="";
            String qry = "select s.roll_no, s.name from attendance a, student s where s.branch='"+branch+"' and s.semester="+sem+" order by s.roll_no asc";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
            roll_no=rs.getString(1);
            String qry2 = "select a.tot_lec, a.lec_att from attendance a, subject s where s.branch='"+branch+"' and a.sub_code=s.sub_code and a.roll_no='"+roll_no+"' and s.semester="+sem+" order by s.sub_code asc";
            ResultSet rs2 = smt.executeQuery(qry2);
            
          %>
                                <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <% while(rs2.next()) { %>
                                     <td><%=rs2.getString(1)%></td>
                                     <td><%=rs2.getString(2)%></td>
                                     <% } %>
                               </tr>
          
           <% 
            i=i+1;
            }              
                 %>
                 
    </tbody>
    </table> 
    </body>
</html>
