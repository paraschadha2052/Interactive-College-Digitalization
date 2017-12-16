<%-- 
    Document   : marks3
    Created on : Dec 16, 2017, 8:53:02 PM
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
            String sub_cod=request.getParameter("i");
            int batch =Integer.parseInt(request.getParameter("k"));
            
            
            String qry4 = "select sub_name from subject where sub_code='"+sub_cod+"'";
     ResultSet rs4= smt.executeQuery(qry4);      
     rs4.next();
      String sub_name= rs4.getString(1);
             int count=0;        
             
            Statement smtt=null;
            smtt=con.createStatement();
            String qry = "select roll_no, name from student where branch='"+b+"' and batch="+batch+"  order by roll_no asc";
     ResultSet rs1 = smt.executeQuery(qry);
                     
          while(rs1.next())
              {
                
                String x=rs1.getString(1);
                int a=Integer.parseInt(request.getParameter(x));
              
         
           
                  String qry2 ="insert into result values ('"+x+"','"+sub_cod+"',"+a+")";
                  int r=smtt.executeUpdate(qry2);
                  if(r>0)
                  {
                       count=count+1;
                   }
                   
                            
            }
            
        
               
                 %>
                 
      <H3 align="center" style="color: red; font-size: medium; font-weight: bold ; alignment-adjust: central"> <%= count %> RECORDS HAVE BEEN UPDATED w.r.t. <%=sub_name %> </H3>
            <div class="container-fluid">
            <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      
      <th style="color: white">Student ID</th>
      <th style="color: white">Name</th>      
      <th style="color: white">GPA</th>
    </tr>
  </thead>
  <tbody>
      <%
                 
            int i=1;
            
           String qry3 ="select r.roll_no, s.name, r.SGPA from  result r, student s  where s.branch='"+b+"' and s.batch="+batch+" and s.roll_no=r.roll_no ";
           ResultSet rs3 = smt.executeQuery(qry3);
            while(rs3.next())
            {
          %>

                               <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs3.getString(1)%></td>
                                     <td><%=rs3.getString(2) %></td>
                                     <td> <%=rs3.getString(3) %> </td>
                               </tr>
                              
  
        
            <% 
            
            i=i+1;
            }  
            %>
            </tbody>
                    </table>
            
      
           <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>    
            </div>
        </div>
    </body>
</html>
