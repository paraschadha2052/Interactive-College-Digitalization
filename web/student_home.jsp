<%-- 
    Document   : student_home
    Created on : Oct 28, 2017, 9:55:31 PM
    Author     : Jitesh Mahla
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
        <%@include file="ConnectPage.jsp" %>
        <%@include file="SesssionCheck.jsp" %>  
        <p>Welcome</p>
         <%
         out.println(username);
        if(username != null)
        {
            out.println("hello");
            out.println(username);
            String qry = "select * from student where roll_no='"+username+"'";
            ResultSet rs = smt.executeQuery(qry);
            if(rs.next())
            {
                 %>
            <table class="t1">
              
                      
                              <tr class="r" ><td>
                                    HI  <%=rs.getString(1)%>
                          </td>
                          <td>
                                      <%=rs.getString(9)%>
                          </td>
                          <td>
                                      <%=rs.getString(10)%>
                          </td></tr>
               
            </table>
           <% }
            else
            {
                out.println("<h3>Record not found.</h3>");
           }
        }
                %>   
    </body>
</html>
