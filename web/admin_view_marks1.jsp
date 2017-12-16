<%-- 
    Document   : admin_view_marks1
    Created on : Dec 16, 2017, 11:51:50 PM
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
             int batch= Integer.parseInt(request.getParameter("batch"));             
             int sem= Integer.parseInt(request.getParameter("semesterSelect"));
            
             
            
            String qry1 = "select  distinct s.sub_name, s.sub_code from subject s, result r where r.sub_code=s.sub_code and s.branch='"+branch+"' and s.batch='"+batch+"' and s.semester='"+sem+"' order by s.sub_code asc ";
            ResultSet rs1 = smt.executeQuery(qry1);
             while(rs1.next()) {
            %>
            <th style="color: white"><%=rs1.getString(1)%><br><%=rs1.getString(2)%></th>
    
      <% } %>
      
         </tr>
  </thead>
  <tbody>
        <% 
             int i=1;
             
            Statement smttt=null;
              smttt=con.createStatement();
             
            Statement smtt=null;
              smtt=con.createStatement();
             String qry2 = "select roll_no, name from student where branch='"+branch+"' and batch='"+batch+"'  and semester='"+sem+"'  order by roll_no ";
            ResultSet rs2 = smt.executeQuery(qry2);          
          while(rs2.next())
            {
              String qry = "select distinct  r.SGPA , r.sub_code from result r, student s, subject su where r.roll_no='"+rs2.getString(1)+"' and r.roll_no=s.roll_no and su.semester='"+sem+"' order by r.sub_code asc";
              ResultSet rs = smtt.executeQuery(qry); 
              rs1 = smttt.executeQuery(qry1);
           
          %>
                                <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs2.getString(1)%></td>
                                     <td><%=rs2.getString(2)%></td>
           <% 
           while(rs.next())
            { 
               
           %>
                                     <td><%=rs.getString(1)%></td>
           <%  
             
            }
           %>
                                           
                               </tr>
          
           <% 
            i=i+1;
            }              
               
                 %>
                 
    </tbody>
    </table> 
    </body>
</html>
