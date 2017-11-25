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
      <form>
            <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      
      <th style="color: white">Student ID</th>
      <th style="color: white">Name</th>
      <th style="color: white">Total Lecture Till Last Amended</th>
      <th style="color: white">Lecture Attended</th>
      <th style="color: white">Lecture Attended After Last Amended</th>
    </tr>
  </thead>
  <tbody>
      <%
               String b=request.getParameter("j");
                String sub_cod=request.getParameter("x");
               int s=Integer.parseInt(request.getParameter("k"));
               
             int i=1;
             
            String qry = "select s.roll_no, s.name, a.tot_lec, a.lec_att from student s, attendance a  where s.roll_no=a.roll_no and s.branch='"+b+"' and s.semester="+s+" and a.sub_code='"+sub_cod+"' order by s.roll_no asc";
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
                                     <td><input type="text" name="<%=rs.getString(1)%>"></td>
                               </tr>
                              
  
        
            <% 
            
            i=i+1;
            }
            
           
               
                 %>
         </tbody>
    </table> 
         
         <div class="form-group">
      <label for="newAtt" class="col-lg-2 control-label">New Total Attendance</label>
      <div class="col-lg-10">
          <input type="text" name="tbNewAtt" class="form-control" id="batch">
      </div>
    </div>
         
         
        
         
         <div class="form-group">
             <div class="col-lg-10 col-lg-offset-2" style="margin-top: 10px">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
         
         
         </form>         
         
         <%
            
            
            %>
              
         </div>        
    </div>
           <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
        
    
    </body>
</html>
