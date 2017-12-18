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
      
            
        <%@include file="faculty_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        
        <%@include file="SesssionCheck.jsp" %> 
          <div class="container">
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
                int m=Integer.parseInt(request.getParameter(x));
             
                                         int grade=0;
                                         String remark="";
                                         if(90<=m && m<100)
                                         {
                                             grade=10;
                                             remark="Outstanding";
                                         }
                                         else if(80<=m && m<90)
                                         {
                                             grade=9;
                                             remark="Excellent";
                                         }
                                         else if(70<=m && m<80)
                                         {
                                             grade=8;
                                             remark="Very Good";
                                         }
                                         else if(60<=m && m<70)
                                         {
                                             grade=7;
                                             remark="Good";
                                         }
                                         else if(50<=m && m<60)
                                         {
                                             grade=6;
                                             remark="Average";
                                         }
                                         else if(46<=m && m<50)
                                         {
                                             grade=5;
                                             remark="Below Average";
                                         }
                                         else if(40<=m && m<46)
                                         {
                                             grade=4;
                                             remark="Marginal";
                                         }
                                         else if(m<40)
                                         {
                                             grade=3;
                                             remark="Fail";
                                         }
                                         else
                                         {
                                             grade=0;
                                             remark="Can't Say";
                                         }
                
                String qry3 ="update result set marks="+m+", sgpa="+grade+", remark='"+remark+"' where roll_no='"+x+"' and sub_code='"+sub_cod+"'";
                  int rr=smtt.executeUpdate(qry3);
                  if(rr>0)
                  {
                      String qry2 ="update result set marks="+m+", sgpa="+grade+", remark='"+remark+"'where roll_no='"+x+"' and sub_code='"+sub_cod+"'";
                  int r=smtt.executeUpdate(qry2);
                    if(r>0)
                   {
                       count=count+1;
                   }
                  }
                  else
                  {
           
                  String qry2 ="insert into result values ('"+x+"','"+sub_cod+"',"+m+","+grade+",'"+remark+"') ";
                  int r=smtt.executeUpdate(qry2);
                  if(r>0)
                  {
                       count=count+1;
                   }
                   
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
      <th style="color: white">Marks</th> 
      <th style="color: white">GPA</th>
      <th style="color: white">Remarks</th>
    </tr>
  </thead>
  <tbody>
      <%
                 
            int i=1;
            
           String qry3 ="select r.roll_no, s.name, r.marks, r.SGPA, r.remark from  result r, student s  where s.branch='"+b+"' and s.batch="+batch+" and s.roll_no=r.roll_no and r.sub_code='"+sub_cod+"' order by r.roll_no asc ";
           ResultSet rs3 = smt.executeQuery(qry3);
            while(rs3.next())
            {
                
                                         
                                         
          %>

                               <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs3.getString(1)%></td>
                                     <td><%=rs3.getString(2) %></td>
                                     <td> <%=rs3.getString(3) %> </td>
                                     <td> <%=rs3.getString(4) %> </td>
                                     <td><%=rs3.getString(5) %> </td>
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
