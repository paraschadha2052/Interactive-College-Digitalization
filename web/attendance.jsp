<%-- 
    Document   : attendance
    Created on : Nov 17, 2017, 6:10:31 PM
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
        <%@include file="student_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        <%@include file="SesssionCheck.jsp" %>  
     
         <%
        if(username != null)
        {
            float total, attended, per;
            
            String qry1 = "select * from attendance where roll_no='"+username+"'";
            int i=1;
            ResultSet rs1 = smt.executeQuery(qry1);
            
                
                 %>
             
                 
                 <h3>Attendance Alert for you :</h3>
                 <br>
                 
                 <div class="container-fluid">
                         <table class="table table-striped table-hover table-bordered">
  <thead style="background-color: black">
    <tr>
      <th></th>
      <th style="color: white">SUBJECT</th>
      <th style="color: white">TOTAL LECTURES</th>
      <th style="color: white">LECTURES ATTENDED</th>
      <th style="color: white">PERCENTAGE</th>
    </tr>
  </thead>
  <tbody>
                 <%
                      while(rs1.next())
                         {
                             total=Integer.parseInt(rs1.getString(3));
                             attended=Integer.parseInt(rs1.getString(4));
                             per=attended * 100 / total;
                             if(per >=75.0)
                             {
                 %>
      
                               <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs1.getString(2)%></td>
                                     <td><%=rs1.getString(3)%></td>
                                     <td><%=rs1.getString(4)%></td>
                                     <td> <%=per %> </td>
                               </tr>
                      <%
                             }
                             else
                             {
                      %>
                                <tr class="danger">
                                     <td> <%=i %> </td>
                                     <td><%=rs1.getString(2)%></td>
                                     <td><%=rs1.getString(3)%></td>
                                     <td><%=rs1.getString(4)%></td>
                                     <td> <%=per %> </td>
                               </tr>
                     <%
                             }
                            i=i+1;
                          }
                     %>
        </tbody>
    </table> 
                     <h3 class="head3">  Happy Engineering :)</h3>
                 </div>
           
                <% 
                 }
                   else
                 {
                     out.println("<h3>Record not found.</h3>");
                 }
                %>   
        </div>
    </body>
</html>

