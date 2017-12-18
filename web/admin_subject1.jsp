<%-- 
    Document   : admin_subject1
    Created on : Dec 17, 2017, 11:22:57 PM
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
    
        <%@include file="admin header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
          
          <div class="container">  
        
        
        <%
        
        String branch=request.getParameter("branch");
        %>
        <div class="row"> 
            <div class="col-md-2"><p class="admin"><a href="admin_add_subject.jsp" style="color: white">Add Subject</a></p>
          </div>
        </div>
        <br>
            
                         <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      <th style="color: white">SUBJECT_CODE</th>
      <th style="color: white">SEMESTER</th>
      <th style="color: white">SUBJECT_NAME</th>
      <th style="color: white">CREDITS</th>
      <th style="color: white">TEACHER</th>
      <th style="color: white">BATCH</th>
    </tr>
  </thead>
  <tbody>
      <% 
             int i=1;
             
            String qry = "select s.sub_code,s.semester, s.sub_name, s.sub_credits,   f.name, s.batch  from subject s, faculty f where s.branch='"+branch+"' and f.F_id=s.F_id order by s.sub_code";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
          %>
  
      <tr onclick="location.href='admin_update_subject.jsp?i=<%=rs.getString(1)%>&j=<%=rs.getString(6)%>'">
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td><%=rs.getString(3)%></td>
                                     <td><%=rs.getString(4)%></td>
                                     <td><%=rs.getString(5)%></td>
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
