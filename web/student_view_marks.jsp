<%-- 
    Document   : student_view_marks
    Created on : Dec 17, 2017, 6:17:48 PM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
        <link rel="stylesheet" href="css/newDesign.css">
        <style>
            a {
    text-decoration: none;
    display: inline-block;
    padding: 8px 16px;
}


a:hover {
    background-color: #2c74b2;
    color: white;
}

.previous {
    background-color: #428BCA;
    color: white;
}


.round {
    border-radius: 10%;
}
        </style>
    </head>
    <body>
        
         <%@include file="student_header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <%@include file="SesssionCheck.jsp" %> 
         
         <div class="container">
              
             <div class="row">
            <div class="col-md-2">
        <a href="student_view_marks_sem.jsp" class="previous round">Back</a>
            </div>
            <div class="col-md-10 centr"></div>
            
        </div>
         
         <%
         if(username != null)
        {
            String qry3 = "select branch, batch, semester from student where roll_no='"+username+"'" ;
            ResultSet rs3 = smt.executeQuery(qry3);
            rs3.next();
            
             String branch=rs3.getString(1);
             int batch= Integer.parseInt(rs3.getString(2));     
             int semM=Integer.parseInt(rs3.getString(3)); 
             int sem= Integer.parseInt(request.getParameter("semesterSelect"));
             if(sem>semM)
             {
                 %>
                 
                  <H3 align="center" style="color: red; font-size: medium; font-weight: bold ; alignment-adjust: central"> Don't try to be  over smart kid. You Are in <%=semM %> semester.</H3>
       
                 <%
             }
             else
             {
           String qry = "select  distinct r.sub_code, su.sub_name,  r.marks, r.SGPA, r.remark  from result r, student s, subject su where r.roll_no='"+username+"' and  r.sub_code=su.sub_code and su.semester="+sem+" and su.batch="+batch+" and su.branch='"+branch+"' order by r.sub_code asc";
              ResultSet rs1 = smt.executeQuery(qry);   
              if(rs1.next())
              {
         %>
         
                           <table class="table table-striped table-hover table-bordered">
              <thead style="background-color: black">
    <tr>
        <th></th>
        <th style="color: white">Subject Code</th>
         <th style="color: white">Subject</th> 
      <th style="color: white">Marks</th> 
      <th style="color: white">GPA</th>
      <th style="color: white">Remarks</th>
      </tr>
  </thead>       
  <tbody>
        <% 
             int i=1;
             
              ResultSet rs = smt.executeQuery(qry); 
               while(rs.next()){
          %>
                                <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td><%=rs.getString(3)%></td>
                                      <td><%=rs.getString(4)%></td>
                                       <td><%=rs.getString(5)%></td>
                                           
                               </tr>
          
           <% 
            i=i+1;
               }
             }  
              else
              {
                  
                 %>
                  <H3 align="center" style="color: red; font-size: medium; font-weight: bold ; alignment-adjust: central">Sorry, This result have not been uploaded yet.</H3>
       
                 <%
              }
                    
             }
        } 
                 %>
                 
    </tbody>
    </table> 
         </div>
    </body>
</html>
