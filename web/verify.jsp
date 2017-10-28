<%-- 
    Document   : verify
    Created on : 28 Oct, 2017, 10:55:57 PM
    Author     : paras
--%>

<%@include file="ConnectPage.jsp" %>

<%
    String username=request.getParameter("username");
    String hash=request.getParameter("hash");
    
    String qry="select * from login where username='"+username+"' and hash='"+hash+"'";
    ResultSet rs=smt.executeQuery(qry);
    if(rs.next()){
        smt = con.createStatement();
        qry = "update login set verified = 'yes' where username='"+username+"'";
        if(smt.executeUpdate(qry)>0){
            out.println("Verified Successfully ! Please Login");
        }
    }

%>
