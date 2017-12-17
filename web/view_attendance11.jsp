<%-- 
    Document   : view_attendance11
    Created on : Dec 15, 2017, 7:37:11 AM
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
    </head>
    <body>
         <%@include file="admin header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <%@include file="SesssionCheck.jsp" %>
        
        <%
            String branch=request.getParameter("branchSelect");
            int sem=Integer.parseInt(request.getParameter("semesterSelect"));
            int batch=Integer.parseInt(request.getParameter("batchSelect"));
            String sub_code = request.getParameter("subjectSelect");
            String qry = "";
        %>
         
    <div class="container">                                           
    <%
        qry = "select sub_code, sub_name from subject where branch='"+branch+"' and semester='"+sem+"' and batch="+batch+"";
        smt = con.createStatement();
        ResultSet rs = smt.executeQuery(qry);
        if(!rs.next()){
            out.println("<h3 align=\"center\" style=\"color: red; font-size: medium; font-weight: bold ; alignment-adjust: central\">Subjects not added yet! Contact admin if they should be here.</h3>");
        }
        else{
            rs.beforeFirst();
    %>
    <form class="form-horizontal" method="post">
        <fieldset>
            <legend></legend>
            <div class="form-group">
                <label for="subjectSelect" class="col-lg-2 control-label">Subject</label>
                <div class="col-lg-8">
                    <select name="subjectSelect" class="form-control" id="subjectSelect">
                        <%
                            while(rs.next()){
                                if(rs.getString(1).equals(sub_code)){
                        %>
                                <option value="<%=rs.getString(1)%>" selected><%=rs.getString(2)%> (<%=rs.getString(1)%>)</option>
                        <%            
                                }
                                else{
                        %>
                                <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%> (<%=rs.getString(1)%>)</option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
                <input type="hidden" name="branchSelect" value="<%=branch%>">
                <input type="hidden" name="semesterSelect" value="<%=sem%>">
                <input type="hidden" name="batchSelect" value="<%=batch%>">
                <div class="col-lg-2">
                  <button type="submit" class="btn btn-primary" name="btnSubmit">View</button>
                </div>
            </div>
        </fieldset>
    </form>
    <%
        }
        if(request.getParameter("btnSubmit")!=null){
    %>
    <table class="table table-striped table-hover table-bordered">
    <thead style="background-color: black">
        <tr>
            <th style="color: white">Sr No.</th>
            <th style="color: white">Student ID</th>
            <th style="color: white">Name</th>
            <th style="color: white">Lecture Attended</th>
            <th style="color: white">Total lectures</th>
            <th style="color: white">Percentage</th>
        </tr>
    </thead>
    <tbody>
        <%
            int i=1;
            qry = "select roll_no, name from student where branch='"+branch+"' and batch="+batch+" order by roll_no asc";
            smt = con.createStatement();
            ResultSet rs1 = smt.executeQuery(qry), rs2;
            String roll_no, name;
            float attended, total, per;
            while(rs1.next())
            {
                roll_no = rs1.getString(1);
                name = rs1.getString(2);
                attended = 0;
                total = 0;
                per = 100;
                smt = con.createStatement(); 
                String qry2 = "select count(date) from attendance where roll_no='"+roll_no+"' and (attended='yes' or attended='claim') and sub_code='"+sub_code+"' group by sub_code";
                rs2 = smt.executeQuery(qry2);
                if(rs2.next()){
                    attended=Integer.parseInt(rs2.getString(1));
                }
                smt = con.createStatement();
                qry2 = "select count(date) from attendance where roll_no='"+roll_no+"' and sub_code='"+sub_code+"' group by sub_code;";
                rs2 = smt.executeQuery(qry2);
                if(rs2.next()){
                    total=Integer.parseInt(rs2.getString(1));
                    per=attended * 100 / total;
                }

                if(per >=75.0)
                {
         %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=roll_no%></td>
                        <td><%=name%></td>
                        <td><%=attended%></td>
                        <td><%=total%></td>
                        <td><%=per%></td>
                    </tr>
              <%
                }
                else
                {
              %>
                    <tr class="danger">
                        <td><%=i%></td>
                        <td><%=roll_no%></td>
                        <td><%=name%></td>
                        <td><%=attended%></td>
                        <td><%=total%></td>
                        <td><%=per%></td>
                   </tr>
             <%
                }
                i=i+1;
            }
             %>         
    </tbody>
    </table>
    <%
        }
    %>
    </div>   
    </body>
</html>
