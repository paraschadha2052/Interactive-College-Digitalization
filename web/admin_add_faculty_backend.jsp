

<%@page import="java.util.UUID"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>

<%@include file="HeaderPage.jsp" %>
<%@include file="ConnectPage.jsp" %>

<%
    out.println("HI");

    String f_id, name,add, department, uid,email, mobile ,post;
  
    f_id=request.getParameter("tbfid");
    name=request.getParameter("tbName");  
    department="";
    uid= "";
    mobile="";
    add= "";
    email=request.getParameter("tbEmail");
    post=request.getParameter("tbpost");
       
    out.println(name + " " + email + "\n");

    try
    {    
        System.out.println("Trying to send mail ...");
        String usernamee = f_id;
        String baseUrl = "http://localhost:8080/Interactive-College-Digitalization2/faculty_verify.jsp";
        String uuid = UUID.randomUUID().toString().replace("-", "");
        out.println("Verfification hash: "+uuid);

        final String from = "ccetinfoprovider@gmail.com";
        final String password = "d23j27p40";
        String to = email;
        String sub = "Email Verification !";
        String msg = "Hello "+name+", This is to inform you that you've been registered in the faculty records of Chandigarh College of Engineering and Technology. Click \n"+baseUrl + "?username="+usernamee+"&hash="+uuid+" to enter further details and set your login password.\nThank you.";
                       
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
         String qry ="insert into faculty values('"+f_id+"','"+name+"','"+department+"','"+mobile+"', '"+email+"','"+uid+"', '"+add+"','"+post+"')" ;
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
        qry ="insert into login values ('"+usernamee+"','"+usernamee+"','faculty','no', '"+uuid+"')";
        smt.executeUpdate(qry);
        
        response.sendRedirect("admin_faculty_redirect.jsp?fname="+name); 
    }

    catch(Exception ex)
            {
                out.println("ERROR :<BR><p>"+ex+"</p>");  
            }  

%>