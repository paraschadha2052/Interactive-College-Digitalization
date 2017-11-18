<%-- 
    Document   : signup
    Created on : 28 Oct, 2017, 10:41:34 PM
    Author     : paras
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>

<%@include file="HeaderPage.jsp" %>
<%@include file="ConnectPage.jsp" %>

<%
    out.println("HI");

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
    
    out.println(name + " " + email + "\n");

    try
    {    
        System.out.println("Trying to send mail ...");
        String username = roll_no;
        String baseUrl = "http://localhost:22186/Interactive-College-Digitalization/verify.jsp";
        String uuid = UUID.randomUUID().toString().replace("-", "");
        out.println("Verfification hash: "+uuid);

        final String from = "ccetinfoprovider@gmail.com";
        final String password = "d23j27p40";
        String to = email;
        String sub = "Email Verification !";
        String msg = "Please verify your email id by clicking the below link:\n"
                + baseUrl + "?username="+username+"&hash="+uuid;
       
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                        "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session sess = Session.getInstance(props,
                new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(from,password);
                        }
                });

        try {

                Message message = new MimeMessage(sess);
                message.setFrom(new InternetAddress(from));
                message.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(to));
                message.setSubject(sub);
                message.setText(msg);

                Transport.send(message);

                System.out.println("Done");

        } catch (MessagingException e) {
                throw new RuntimeException(e);
        }
        
        // insert into db....
        smt=con.createStatement();
        // TODO: Encrypt passwords using MD5 hash...
        String qry ="insert into student values('"+name+"','"+sex+"','"+dob+"','"+f_name+"', '"+m_name+"','"+add_present+"', '"+add_permanent+"', '"+reg_no+"', '"+roll_no+"','"+ branch+"', '"+uid+"','"+mobile+"','"+parent_mobile+"','"+email+"', '"+category+"',"+hostler+" ,'"+batch+"')" ;
        int r=smt.executeUpdate(qry);
        if(r>0)
        {
            out.println("<p>Record has been inserted</p>");
        }

        else
        {
                out.println("<p>Failed</p>");
        }
        smt=con.createStatement();
        qry ="insert into login values ('"+username+"','"+username+"','student','no', '"+uuid+"')";
        smt.executeUpdate(qry);
    }

    catch(Exception ex)
            {
                out.println("ERROR :<BR><p>"+ex+"</p>");  
            }  

%>