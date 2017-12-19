<%-- 
    Document   : ajax_valid_PMobileno
    Created on : Nov 18, 2017, 12:17:16 AM
    Author     : Jitesh Mahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             String pmobileno  = request.getParameter("pmobileno");
             String pPMobileno = "^[0-9]{10}$";
        if(!pmobileno.matches(pPMobileno))
            {
                out.println("Invalid Parent's Mobile number.");
            }
        
        int l=pmobileno.length();
        if(l>0)
            {
               %>
               <%@include file="ConnectPage.jsp" %>
               <%
           if(l>0)
            {       
              
                   String qry ="SELECT parent_mobile FROM student WHERE parent_mobile='"+pmobileno+"'";
                   ResultSet rs=smt.executeQuery(qry);   
                   while(rs.next())
                   {
                       %>
                       Parent's Mobile no. <%= rs.getString(1)%> already in use. 
                       <%
                   }
                                              
                   con.close();
               }
           
            }
        %>
    </body>
</html>
