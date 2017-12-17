<%-- 
    Document   : admin_insert_subject
    Created on : Dec 17, 2017, 10:07:23 PM
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
        <%@include file="admin header.jsp" %>
          <%@include file="ConnectPage.jsp" %>
          
          
        
        <%
                   String sub_code,sub_name, branch,f_id;
             int semester, batch=0,sub_credits;
           sub_code=request.getParameter("sub_code");
               sub_name=request.getParameter("sub_name");
               sub_credits=Integer.parseInt(request.getParameter("credits"));
               branch=request.getParameter("branchSelect");
               semester=Integer.parseInt(request.getParameter("semesterSelect"));
               f_id=request.getParameter("faculty");
              batch=Integer.parseInt(request.getParameter("Batch"));
                 
               
                String qry ="insert into subject values ('"+sub_code+"','"+sub_name+"',"+sub_credits+", '"+branch+"',"+semester+",'"+f_id+"',"+batch+" )";
           
                int r=smt.executeUpdate(qry);
                if(r>0)
                {
                    %> <H3 align="center" style="color: red; font-size: medium; font-weight: bold ; alignment-adjust: central">Subject has been added</H3>
          <%    Thread.sleep(200);
                }
                else
                { %> <H3 align="center" style="color: red; font-size: medium; font-weight: bold ; alignment-adjust: central">OOOPPPSSs....Subject has not been added</H3>
          <%
                }
              %>
        
         
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
        
    </body>
</html>
