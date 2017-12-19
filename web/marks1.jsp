<%-- 
    Document   : marks1
    Created on : Dec 16, 2017, 7:52:54 PM
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
      
        <%@include file="faculty_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        
        <%@include file="SesssionCheck.jsp" %> 
            
        <div class="container"> 
            
            <div class="container-fluid">
                         <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      <th style="color: white">SUBJECT_CODE</th>
      <th style="color: white">SUBJECT_NAME</th>
      <th style="color: white">BRANCH</th>
      <th style="color: white">BATCH</th>
    </tr>
  </thead>
  <tbody>
      <% 
             int i=1;
             
            String qry = "select *  from subject where F_id='"+username+"'";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
          %>
  
      <tr onclick="location.href='marks2.jsp?k=<%=rs.getString(7)%>&j=<%=rs.getString(4)%>&x=<%=rs.getString(1)%>'">
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td><%=rs.getString(4)%></td>
                                     <td><%=rs.getString(7)%></td>
                                    
                               </tr>
    
        
            <% 
            i=i+1;
            }
            
           
               
                 %>
         </tbody>
    </table> 
         </div>        
    </div>
           <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
        
    
    </body>
</html>
