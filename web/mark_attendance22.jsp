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
           if(request.getParameter("submit")!=null) 
           {
              
            String b=request.getParameter("j");
            String sub_cod=request.getParameter("i");
            int s=Integer.parseInt(request.getParameter("k"));
                     
             
            Statement smtt=null;
            smtt=con.createStatement();
            String qry = "select s.roll_no, s.name, a.tot_lec, a.lec_att from student s, attendance a  where s.roll_no=a.roll_no and s.branch='"+b+"' and s.semester="+s+" and a.sub_code='"+sub_cod+"' order by s.roll_no asc";
            ResultSet rs1 = smt.executeQuery(qry);
            int count=0;
              while(rs1.next())
              {
                
                String x=rs1.getString(1);
                int a=Integer.parseInt(request.getParameter(x));
                String y=rs1.getString(1)+"x";
                int t= Integer.parseInt(request.getParameter(y));
         
            
                   String qry2 ="update attendance set tot_lec="+t+",lec_att="+a+" where roll_no='"+x+"' and sub_code='"+sub_cod+"'";
                   int r=smtt.executeUpdate(qry2);
                   if(r>0)
                   {
                       count=count+1;
                   }
                   
                            
            }
            
        
               
                 %>
                 
      <H3 align="center" style="color: red; font-size: medium; font-weight: bold ; alignment-adjust: central"> <%= count %> RECORDS HAVE BEEN UPDATED </H3>
            <div class="container-fluid">
       <form method="post" >
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
           
               
            int i=1;
           ResultSet rs = smt.executeQuery(qry);
            while(rs.next())
            {
          %>

                               <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2) %></td>
                                     <td> <%=rs.getString(3) %> </td>
                                     <td> <%=rs.getString(4) %></td>
                               </tr>
                              
  
        
            <% 
            
            i=i+1;
            }
            %>
            </tbody>
                    </table>
            <%
           
           }
           else {
            %>
        
        <%
            String b=request.getParameter("j");
            String sub_cod=request.getParameter("i");
            int s=Integer.parseInt(request.getParameter("k"));
            int y=Integer.parseInt(request.getParameter("tbNewAtt"));
            int i=1;
            String qry = "select s.roll_no, s.name, a.tot_lec, a.lec_att from student s, attendance a  where s.roll_no=a.roll_no and s.branch='"+b+"' and s.semester="+s+" and a.sub_code='"+sub_cod+"' order by s.roll_no asc";
           
%>   
              
            <div class="container-fluid">
       <form method="post" >
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
           
               
            
             session.setAttribute("rollNoo", 1);
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
                                     <td><input type="text" name="<%=rs.getString(1)%>x" value="<%=t%>" readonly></td>
                                     <td><input type="text" name="<%=rs.getString(1)%>" value="<%=l%>" readonly></td>
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
        <button type="submit" name="submit" class="btn btn-primary">Save</button>
      </div>
    </div>
         
         
         </form>       
         </div>  
         
                 <%
            }
            %>
         
    </div>  
           <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
        
        
    </body>
</html>
