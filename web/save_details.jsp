<%-- 
    Document   : save_details
    Created on : Nov 11, 2017, 11:36:33 AM
    Author     : DV
--%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>

<%@include file="ConnectPage.jsp" %>

<%
    String name,sex,dob,f_name, m_name,add_present, add_permanent, reg_no, roll_no, branch, uid,email, category, batch, mobile ,parent_mobile;
    int hostler;

    name=request.getParameter("tbname");
    sex=request.getParameter("sexRadio");
    dob=request.getParameter("tbDob");
    f_name=request.getParameter("tbFname");
    m_name=request.getParameter("tbMname");
    add_present=request.getParameter("txtAddPresent");
    add_permanent=request.getParameter("txtAddPermanent");
    reg_no=request.getParameter("tbRegNo");
    roll_no=request.getParameter("tbRollNo");
    branch=request.getParameter("branchSelect");
    uid=request.getParameter("tbUID");
    mobile=request.getParameter("tbMobile");
    parent_mobile=request.getParameter("tbPmobile");
    email=request.getParameter("tbEmail");
    category=request.getParameter("categorySelect");
    hostler=Integer.parseInt(request.getParameter("hostlerRadio"));
    batch=request.getParameter("tbBatch");
    
    String qry ="update student SET name='"+name+"', sex='"+sex+"', dob='"+dob+"',father_name='"+f_name+"',mother_name= '"+m_name+"',add_present='"+add_present+"',add_permanent= '"+add_permanent+"', branch='"+ branch+"',UID= '"+uid+"',mobile='"+mobile+"',parent_mobile='"+parent_mobile+"',category= '"+category+"',hostler="+hostler+" ,batch='"+batch+"' WHERE roll_no='"+roll_no+"'" ;
     
    int r=smt.executeUpdate(qry);
        if(r>0)
        {
            %>
            <%@include file="student_header.jsp" %>
            <%
            out.println("<p>Record has been updated</p>");
            %>
           
            <%
        }

        else
        {
                out.println("<p>Failed</p>");
        }
       

%>