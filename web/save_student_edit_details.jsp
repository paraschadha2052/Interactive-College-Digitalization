<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylesheet.css">
    </head>
    <body>
        
<%@include file="ConnectPage.jsp" %>
<%@include file="student_header.jsp" %>
<%@include file="SesssionCheck.jsp" %>

<%
    String roll_no,sex,add_present, add_permanent, branch, uid,email, category, mobile ,parent_mobile;
    int hostler;

    roll_no=request.getParameter("tbRollNo");
    sex=request.getParameter("sexRadio");
    add_present=request.getParameter("txtAddPresent");
    add_permanent=request.getParameter("txtAddPermanent");
    branch=request.getParameter("branchSelect");
    uid=request.getParameter("tbUID");
    mobile=request.getParameter("tbMobile");
    parent_mobile=request.getParameter("tbPmobile");
    email=request.getParameter("tbEmail");
    category=request.getParameter("categorySelect");
    hostler=Integer.parseInt(request.getParameter("hostlerRadio"));
    
    String qry ="update student SET email_id = '"+email+"',  sex='"+sex+"',add_present='"+add_present+"',add_permanent= '"+add_permanent+"', branch='"+ branch+"',UID= '"+uid+"',mobile='"+mobile+"',parent_mobile='"+parent_mobile+"',category= '"+category+"',hostler="+hostler+" WHERE roll_no='"+roll_no+"'" ;
     
    int r=smt.executeUpdate(qry);
        if(r>0)
        {
            %>
            <div class="notice_style">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                Account Details Updated Succesfully.
            <%
            
            response.setHeader("Refresh", "1;url=student_home.jsp");
            %>
           
            <%
        }

        else
        {
                %>
                A problem occured while updating the Details. Please try again later.
                <%
                response.setHeader("Refresh", "2;url=student_home.jsp");
                
        }
       

%>
                    </div>
                    <div class="col-md-2">
                        
                    </div>
                </div>
            </div>
            
            </body>
</html>