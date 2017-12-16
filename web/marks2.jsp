<%-- 
    Document   : marks2
    Created on : Dec 16, 2017, 8:46:25 PM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="css/stylesheet.css">
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
          
        <div class="container-fluid">
        <%@include file="faculty_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        <%
                String b=request.getParameter("j");
                String sub_cod=request.getParameter("x");
               int batch=Integer.parseInt(request.getParameter("k"));
               
         String qry1 = "select sub_name from subject where sub_code='"+sub_cod+"'";
     ResultSet rs1 = smt.executeQuery(qry1);      
     rs1.next();
      String a= rs1.getString(1);
               
               
     String qry2 = "select SGPA from result r, student s  where r.sub_code='"+sub_cod+"' and s.batch="+batch+" and r.roll_no=s.roll_no";
     ResultSet rs2 = smt.executeQuery(qry2);
                 
        if(rs2.next())
        {
            %>
            <H3 align="center" style="color: red; font-size: medium; font-weight: bold ; alignment-adjust: central"> YOU HAD ALREADY UPDATED THE RESULT OF  <%= a %>SUBJECT OF  <%=batch %> BATCH </H3>
       
            <%
            
        }
        else{
            
%>   
        
  
        
            <div class="container-fluid">
                <form action="marks3.jsp?i=<%=sub_cod%>&j=<%=b%>&k=<%=batch%>" method="post">
            <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      
      <th style="color: white">Student ID</th>
      <th style="color: white">Name</th>
      <th style="color: white">SGPA </th>
   
    </tr>
  </thead>
  <tbody>
      <%
           
               
             int i=1;
             
            String qry = "select roll_no, name from student   where branch='"+b+"' and batch="+batch+"  order by roll_no asc";
            ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
          %>

                               <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td>
                                         <input type="text"  name="<%=rs.getString(1)%>"> 
                                     </td>
                               </tr>
                              
  
        
            <% 
            
            i=i+1;
            }
            
           
               
                 %>
         </tbody>
    </table> 
         
         <div class="form-group">
         <div class="col-lg-10 col-lg-offset-2" style="margin-top: 10px">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
         
         
         </form>         
         
         <%
        }
            
            %>
              
         </div>        
    </div>
           <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
        
    
    </body>
</html>
