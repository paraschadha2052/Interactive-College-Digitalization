<%-- 
    Document   : mark_attendance
    Created on : Nov 25, 2017, 12:52:47 PM
    Author     : DV
--%>

<%@page import="java.util.Calendar"%>
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
        <table class="table table-striped table-hover table-bordered">
            <thead style="background-color: black">
                <tr>
                  <th style="color: white">Sr No.</th>
                  <th style="color: white">SUBJECT_CODE</th>
                  <th style="color: white">SUBJECT_NAME</th>
                  <th style="color: white">BRANCH</th>
                  <th style="color: white">SEMESTER</th>
                  <th style="color: white">BATCH</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String fid=(String)session.getAttribute("username"), qry;
                    int i=1;
                    Calendar cal = Calendar.getInstance();
                    int year = cal.get(cal.YEAR);
                    int month = cal.get(cal.MONTH)+1;
                    if(month<=6){
                        // month is before july, so last 4 years should be included...
                        qry = "select * from subject where F_id='"+fid+"' and batch>="+Integer.toString(year-4);
                    }
                    else{
                        // month is after june , so last 3 years should be taken in account...
                        qry = "select * from subject where F_id='"+fid+"' and batch>="+Integer.toString(year-3);
                    }
                    ResultSet rs = smt.executeQuery(qry);
                    while(rs.next())
                    {
                %>
  
                <tr onclick="location.href='mark_attendance11.jsp?sub=<%=rs.getString(1)%>&br=<%=rs.getString(4)%>&sem=<%=rs.getString(5)%>&bat=<%=rs.getString(7)%>'">
                      <td> <%=i %> </td>
                      <td><%=rs.getString(1)%></td>
                      <td><%=rs.getString(2)%></td>
                      <td><%=rs.getString(4)%></td>
                      <td><%=rs.getString(5)%></td>
                      <td><%=rs.getString(7)%></td>
                </tr>

                <% 
                i=i+1;
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
