<%-- 
    Document   : fee_upload_backend
    Created on : Nov 11, 2017, 3:34:13 PM
    Author     : DV
--%>


<%@page import="java.util.UUID"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>

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
            out.println("<p>Record has been inserted</p>");
        }

        else
        {
                out.println("<p>Failed</p>");
        }
        con.close();
%>