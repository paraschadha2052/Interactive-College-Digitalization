
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
         Connection con = null;
            Statement smt = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/college_erp","root","");
                smt = con.createStatement();     
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
                
        %>
    </body>
</html>
