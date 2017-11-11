<%-- 
    Document   : fee_upload_backend
    Created on : Nov 11, 2017, 3:34:13 PM
    Author     : DV
--%>


<%@page import="java.util.UUID"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>


<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>JSP Page</title>
        
        <link href="css/bootstrap.min.css" rel="stylesheet">
         <script type="text/javascript">
            function added()
            {               
                alert("Record Added");  
            }
            function notAdded()
            {               
                alert("Record Adding Failed");  
            }
        </script>
        <link href="admincss.css" rel="stylesheet">
     </head>
   
     <body>    

<%@include file="ConnectPage.jsp" %>
<%
    
    String roll_no, sem, bti, file;

    roll_no=request.getParameter("tbRollNo");
    sem=request.getParameter("semesterSelect");
    bti=request.getParameter("tbBTI");
    file=request.getParameter("pdf");
    

    
   
        // insert into db....
        smt=con.createStatement();
        // TODO: Encrypt passwords using MD5 hash...
        String qry ="insert into fee_recipt values('"+roll_no+"','"+file+"','"+bti+"','"+sem+"')" ;
        int r=smt.executeUpdate(qry);
        if(r>0)
        {
            %>
            added()
            <%
        }

        else
        {
               %>
               notAdded()
               <%
        }
        con.close();
%>

     </body>  
</html>