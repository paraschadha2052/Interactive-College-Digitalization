<%-- 
    Document   : mark_attendance11
    Created on : Nov 25, 2017, 3:35:26 PM
    Author     : DV
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
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
        <%
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String todayDate = dateFormat.format(cal.getTime());
            String msg="";
            
            String br=request.getParameter("br");
            String sub_cod=request.getParameter("sub");
            int sem=Integer.parseInt(request.getParameter("sem"));
            int batch=Integer.parseInt(request.getParameter("bat"));
            
            if(request.getParameter("submit")!=null) 
           {
                Enumeration in = request.getParameterNames();
                while(in.hasMoreElements()) {
                 String paramName = in.nextElement().toString();
                 if(paramName.startsWith("roll_")){
                     String roll = paramName.split("_")[1];
                     int val=Integer.parseInt(request.getParameter(paramName));
                     smt = con.createStatement();
                     if(val==1){
                         String qry = "update attendance set attended = 'yes' where roll_no='"+roll+"' and sub_code='"+sub_cod+"' and date='"+todayDate+"'";
                         if(smt.executeUpdate(qry)==0){
                             smt = con.createStatement();
                             qry = "insert into attendance values('"+roll+"','"+sub_cod+"','"+todayDate+"','yes')";
                             smt.executeUpdate(qry);
                         }
                     }
                     else{
                         String qry = "update attendance set attended = 'no' where roll_no='"+roll+"' and sub_code='"+sub_cod+"' and date='"+todayDate+"'";
                         if(smt.executeUpdate(qry)==0){
                             smt = con.createStatement();
                             qry = "insert into attendance values('"+roll+"','"+sub_cod+"','"+todayDate+"','no')";
                             smt.executeUpdate(qry);
                         }
                     }
                     msg = "Attendance added/updated";
                 }
              }
           }
        %>   
        <div class="container-fluid">
        <h3><center>Attendance for: <%=todayDate%></center></h3>
        <form method="post">
            <table class="table table-striped table-hover table-bordered">
                <thead style="background-color: black">
                    <tr>
                      <th style="color: white">Sr No.</th>
                      <th style="color: white">Student ID</th>
                      <th style="color: white">Name</th>
                      <th style="color: white">Attendance</th>
                    </tr>
                </thead>
                <tbody>
                <%
                   int i=1;
                   boolean flag=false;
                   String qry = "select s.roll_no, s.name, a.attended from student s, attendance a  where s.roll_no=a.roll_no and s.branch='"+br+"' and s.semester="+sem+" and s.batch="+batch+" and a.sub_code='"+sub_cod+"' and a.date='"+todayDate+"' order by s.roll_no asc";
                   System.out.println(qry);
                   ResultSet rs = smt.executeQuery(qry);
                   if(rs.next()){
                       rs.beforeFirst();
                       flag = true;
                   }
                   else{
                       qry = "select s.roll_no, s.name from student s where s.branch='"+br+"' and s.semester="+sem+" and s.batch="+batch+" order by s.roll_no asc";
                       smt = con.createStatement();
                       rs = smt.executeQuery(qry);
                       flag = false;
                   }
                   while(rs.next())
                   {
                %>

                    <tr>
                          <td> <%=i %> </td>
                          <td><%=rs.getString(1)%></td>
                          <td><%=rs.getString(2)%></td>
                          <td>
                               <%
                                if(flag){
                                    System.out.println(rs.getString(3));
                                    if(rs.getString(3).equals("yes")){
                               %>
                                        <input type="radio"  name="roll_<%=rs.getString(1)%>" value="0"> Absent 
                                        <input type="radio"  name="roll_<%=rs.getString(1)%>" value="1" checked> Present<br>
                                <%
                                    }
                                    else{
                                %>
                                        <input type="radio"  name="roll_<%=rs.getString(1)%>" value="0" checked> Absent 
                                        <input type="radio"  name="roll_<%=rs.getString(1)%>" value="1"> Present<br>
                                <%
                                    }
                                }
                                else{
                                %>
                                    <input type="radio"  name="roll_<%=rs.getString(1)%>" value="0"> Absent 
                                    <input type="radio"  name="roll_<%=rs.getString(1)%>" value="1" checked> Present<br>
                                <%
                                    }
                                %>
                          </td>
                    </tr>

                <% 
                    i=i+1;
                    }
                %>
                </tbody>
            </table>
            <div class="alert">
                <%=msg%>
            </div>
            <input type="hidden" name="br" value="<%=br%>">
            <input type="hidden" name="sub" value="<%=sub_cod%>">
            <input type="hidden" name="sem" value="<%=sem%>">
            <input type="hidden" name="bat" value="<%=batch%>">
            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-2" style="margin-top: 10px">
                    <button type="reset" class="btn btn-default">Cancel</button>
                    <button type="submit" name="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </form>         
        </div>        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
