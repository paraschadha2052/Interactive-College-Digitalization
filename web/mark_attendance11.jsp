<%-- 
    Document   : mark_attendance11
    Created on : Nov 25, 2017, 3:35:26 PM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="container-fluid">
        <%@include file="faculty_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        
        
        
            <div class="container-fluid">
            <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      <th style="color: white">Semester</th>
      <th style="color: white">Student ID</th>
    </tr>
  </thead>
  <tbody>
      <%
               String b=request.getParameter("j");
               int s=Integer.parseInt(request.getParameter("i"));
             int i=1;
             
            String qry = "select * from student where branch='"+b+"'";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
          %>

                               <tr>
                                     <td> <%=i %> </td>
                                     <td> <%=s %> </td>
                                     <td><%=rs.getString(9)%></td>
                                    
                               </tr>
                              
  
        
            <% 
            i=i+1;
            }
            
           
               
                 %>
         </tbody>
    </table> 
         </div>        
    </div>
         hello
           <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
        
    
    </body>
</html>
