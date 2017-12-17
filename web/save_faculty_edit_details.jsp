<%-- 
    Document   : save_faculty_edit_details
    Created on : Dec 17, 2017, 1:17:31 PM
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
        
        <%@include file="ConnectPage.jsp" %>
<%@include file="faculty_header.jsp" %>
<%@include file="SesssionCheck.jsp" %>

         <%
       
    String f_id, add, department, uid,email, mobile ,post;

    f_id=request.getParameter("tbfid");
    department=request.getParameter("branchSelect");
    uid=request.getParameter("tbUID");
    mobile=request.getParameter("tbMobile");
    add=request.getParameter("txtAdd");
    email=request.getParameter("tbEmail");
    post=request.getParameter("tbpost");
    
    
        String qry0 ="update faculty set post = '"+post+"', email_id = '"+email+"', department = '"+department+"', mobile = '"+mobile+"', UID = '"+uid+"', address = '"+add+"' where f_id='"+f_id+"'" ;
        System.out.println(qry0);
        int r=smt.executeUpdate(qry0);
        if(r>0)
        {
            %>
            <div class="notice_style">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
            Account Details Updated Succesfully.
            <%
            response.setHeader("Refresh", "1;url=faculty_home.jsp");
        }
        else
        {
            %>
             A problem occured while updating the Details. Please try again later.
            <%
            response.setHeader("Refresh", "2;url=faculty_home.jsp");
        }
       
        
    

%>

</div>
                    <div class="col-md-2">
                        
                    </div>
                </div>
            </div>
        
    </body>
</html>
