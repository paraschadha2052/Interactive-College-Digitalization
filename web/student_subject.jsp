<%-- 
    Document   : student_subject
    Created on : Nov 16, 2017, 11:20:56 PM
    Author     : DV
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css" /> 
    </head>
    
    <body>
       
        <div class="container-fluid">
            
        
        
        <%@include file="ConnectPage.jsp" %>
        
         <%
          
        if(request.getParameter("btnSubmit")!=null) 
        {
            %>
            <div class="container-fluid">
                         <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      <th style="color: white">SUBJECT_CODE</th>
      <th style="color: white">SUBJECT_NAME</th>
      <th style="color: white">BRANCH</th>
      <th style="color: white">SEMESTER</th>
    </tr>
  </thead>
  <tbody>
      <%
             String fid="f005"; 
             int i=1;
             
            String qry = "select * from subject where F_id='"+fid+"'";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
          %>
                 
                               <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td><%=rs.getString(4)%></td>
                                     <td><%=rs.getString(5)%></td>
                                    
                               </tr>
        
            <% 
            i=i+1;
            }
            
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
