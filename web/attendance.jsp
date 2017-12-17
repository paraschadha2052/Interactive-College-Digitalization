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
        <%@include file="SesssionCheck.jsp" %> 
        <%@include file="student_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>

         <%
        if(username != null)
        {
            float total, attended, per;

            int i=1;
            String qry = "select su.sub_name, f.name, su.sub_code from faculty f, student s, subject su where s.roll_no='"+username+"' and s.branch=su.branch and s.semester=su.semester and f.f_id=su.f_id order by su.sub_code asc";
            ResultSet rs = smt.executeQuery(qry), rs1;
        %>
   
        <h3>Attendance Alert for you :</h3>
        <br>    
        <div class="container-fluid">
            <table class="table table-striped table-hover table-bordered">
                <thead style="background-color: black">
                  <tr>
                    <th style="color: white">Sr No.</th>
                    <th style="color: white">Subject Name</th>
                    <th style="color: white">Teacher</th>
                    <th style="color: white">Lectures Attended</th>
                    <th style="color: white">Total Lectures</th>
                    <th style="color: white">Percentage</th>
                  </tr>
                </thead>
                <tbody>
                <%
                    while(rs.next())
                    {
                        attended = 0;
                        total = 0;
                        per = 100;
                        smt = con.createStatement(); 
                        String qry2 = "select count(date) from attendance where roll_no='"+username+"' and (attended='yes' or attended='claim') and sub_code='"+rs.getString(3)+"' group by sub_code";
                        rs1 = smt.executeQuery(qry2);
                        if(rs1.next()){
                            attended=Integer.parseInt(rs1.getString(1));
                        }
                        smt = con.createStatement();
                        qry2 = "select count(date) from attendance where roll_no='"+username+"' and sub_code='"+rs.getString(3)+"' group by sub_code;";
                        rs1 = smt.executeQuery(qry2);
                        if(rs1.next()){
                            total=Integer.parseInt(rs1.getString(1));
                            per=attended * 100 / total;
                        }
                        
                        if(per >=75.0)
                        {
                 %>
      
                               <tr>
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td><%=attended%></td>
                                     <td><%=total%></td>
                                     <td> <%=per %> </td>
                               </tr>
                      <%
                             }
                             else
                             {
                      %>
                                <tr class="danger">
                                     <td> <%=i %> </td>
                                     <td><%=rs.getString(1)%></td>
                                     <td><%=rs.getString(2)%></td>
                                     <td><%=attended%></td>
                                     <td><%=total%></td>
                                     <td> <%=per %> </td>
                               </tr>
                     <%
                             }
                            i=i+1;
                          }
                     %>
        </tbody>
    </table> 
        <div class="text-warning">
            <p>Maintain 75% attendance in all subjects during the course of your semester as mandatory condition for appearing in INTERNAL & EXTERNAL EXAMINATION.</p>
        </div>
                     
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

