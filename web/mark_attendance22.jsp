<%-- 
    Document   : mark attendance22
    Created on : Nov 25, 2017, 8:22:30 PM
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
    <body> <div class="container-fluid">
        <%@include file="faculty_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        <%
            String b=request.getParameter("j");
            String sub_cod=request.getParameter("i");
            int s=Integer.parseInt(request.getParameter("k"));
            int y=Integer.parseInt(request.getParameter("tbNewAtt"));
            int i=1;
            String qry = "select s.roll_no, s.name, a.tot_lec, a.lec_att from student s, attendance a  where s.roll_no=a.roll_no and s.branch='"+b+"' and s.semester="+s+" and a.sub_code='"+sub_cod+"' order by s.roll_no asc";
           
%>   
        
  
         
       
            <div class="container-fluid">
                <form method="post" action="attendance_back.jsp?i=<%=sub_cod%>&j=<%=b%>&k=<%=s%>">
            <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      
      <th style="color: white">Student ID</th>
      <th style="color: white">Name</th>
      <th style="color: white">Total Lectures Till Date</th>
      <th style="color: white">Lecture Attended</th>
    </tr>
  </thead>
  <tbody>
      <%
           
               
            
             
             ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
                String x=rs.getString(1);
                int a=Integer.parseInt(request.getParameter(x));
                int t=y + Integer.parseInt(rs.getString(3));
                int l=a + Integer.parseInt(rs.getString(4));
                
          %>

                               <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2) %></td>
                                     <td><%=t%></td>
                                     <td><%=l%></td>
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
        <button type="submit" class="btn btn-primary">Save</button>
      </div>
    </div>
         
         
         </form>      
         
         
           
         </div>        
    </div>
           <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
        
    </body>
</html>
