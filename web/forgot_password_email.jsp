

<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>

<%@include file="HeaderPage.jsp" %>      
<%@include file="ConnectPage.jsp" %>

<%
    String error=""; 
    String error1="";
        
    String email;
    email=request.getParameter("inputEmail");
    
try
{
    String qry="select s.roll_no, s.name, s.email_id, f.f_id, f.name, f.email_id from student s, faculty f";
    ResultSet rs= smt.executeQuery(qry);
    if(rs.next())
    {
        
        String registered_email_student = rs.getString(3);
        String registered_email_faculty = rs.getString(6);
            
        if(registered_email_student.equals(email) || registered_email_faculty.equals(email))
        {
        if(registered_email_student.equals(email))
        {
            try
            {
                System.out.println("Trying to send mail ...");
                String username = rs.getString(1);
        
                String baseUrl = "http://localhost:8080/Interactive-College-Digitalization2/change_pass.jsp";
                
                final String from = "ccetinfoprovider@gmail.com";
                final String password = "d23j27p40";
                String to = email;
                String sub = "Chandiagrh college of Engineering and Technology - Password Resetting";
                String msg = "Hello, Your Username is "+username+". Please set password by clicking the below link:\n"
                + baseUrl + "?username="+username;
       
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

                try
                {
                    Message message = new MimeMessage(sess);
                    message.setFrom(new InternetAddress(from));
                    message.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(to));
                    message.setSubject(sub);
                    message.setText(msg);

                    Transport.send(message);

                    System.out.println("Done");
                    out.println("<h4>Hello, "+rs.getString(2)+",\n A mail has been sent to your registered email address "+email+" regarding your username and password. Please login to your email account to find your Username and Password.\nThank you.</h4>\n\n <h3>Redirecting to Login Page...<h3>");
                    response.setHeader("Refresh", "10;url=Generic_login_home.jsp");

                }
                catch (MessagingException e)
                {
                    throw new RuntimeException(e);
                }
            }
            catch(Exception ex)
            {
                out.println("ERROR :<BR><p>"+ex+"</p>");  
            }  
        }
                
       if(registered_email_faculty.equals(email))
       {                   
           try
           {       
                System.out.println("Trying to send mail ...");
                String username = rs.getString(4);
        
                String baseUrl = "http://localhost:8080/Interactive-College-Digitalization2/change_pass.jsp";
                
                final String from = "ccetinfoprovider@gmail.com";
                final String password = "d23j27p40";
                String to = email;
                String sub = "Chandiagrh college of Engineering and Technology - Password Resetting";
                String msg = "Hello, Your Username is "+rs.getString(4)+". Please set password by clicking the below link:\n"
                + baseUrl + "?username="+username;
       
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

                try
                {

                    Message message = new MimeMessage(sess);
                    message.setFrom(new InternetAddress(from));
                    message.setRecipients(Message.RecipientType.TO,
                                InternetAddress.parse(to));
                    message.setSubject(sub);
                    message.setText(msg);

                    Transport.send(message);

                    System.out.println("Done");
                    out.println("<h4>Hello, "+rs.getString(5)+",\n A mail has been sent to your registered email address "+email+" regarding your username and password. Please login to your email account to find your Username and Password.\nThank you.</h4>\n\n <h3>Redirecting to Login Page...<h3>");
                    response.setHeader("Refresh", "10;url=Generic_login_page.jsp");

                }
                catch (MessagingException e)
                {
                    throw new RuntimeException(e);
                }
            }
            catch(Exception ex)
            {
                out.println("ERROR :<BR><p>"+ex+"</p>");  
            }  
       }
    }
    else
    {
        error="This is not a Registered Email id.";
    }
    }
    else
    {
        error="No records found.";
    }
}
catch(Exception ex)
{
    out.println(ex);
}
        

        %>
