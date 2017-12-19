<%-- 
    Document   : ajax_valid_Uid
    Created on : Nov 18, 2017, 12:14:36 AM
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
             String uid = request.getParameter("uid");
             String pUid = "^[0-9]{12}$";
        if(!uid.matches(pUid))
            {
                out.println("Invalid Uid number.");
            }
        int l=uid.length();
        if(l>0)
            {
               %>
               <%@include file="ConnectPage.jsp" %>
               <%
           if(l>0)
            {       
              
                   String qry ="SELECT UID FROM student WHERE UID='"+uid+"'";
                   ResultSet rs=smt.executeQuery(qry);   
                   while(rs.next())
                   {
                       %>
                       UID no. <%= rs.getString(1)%> already in use. 
                       <%
                   }
                                              
                   con.close();
               }
           
            }
        %>
    </body>
</html>
