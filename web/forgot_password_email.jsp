

<%@page import="java.util.Properties"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>

<%@include file="HeaderPage.jsp" %>      
<%@include file="ConnectPage.jsp" %>

<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
<%
      
    String email;
    email=request.getParameter("inputEmail");
    
try
{
    String qry="select s.email_id, f.email_id from student s, faculty f";
    ResultSet rs= smt.executeQuery(qry);
    if(rs.next())
    {
        int flag=1;
        while(rs.next())
        {
        
        String registered_email_student = rs.getString(1);
        String registered_email_faculty = rs.getString(2);
        
        if(!registered_email_student.equals(email) && !registered_email_faculty.equals(email))
        {
            flag = 1;
            continue;
        }
        else
        {
            flag = 0;
        if(registered_email_student.equals(email))
        {
            try
            {
                String qry1="select roll_no, name, email_id from student where email_id='"+email+"'";
                ResultSet rs1= smt.executeQuery(qry1);
                if(rs1.next())
                {
                    System.out.println("Trying to send mail ...");
                    String username = rs1.getString(1);
                    String name = rs1.getString(2);
        
                String baseUrl = "http://localhost:8080/Interactive-College-Digitalization2/change_pass.jsp";
                
                final String from = "ccetinfoprovider@gmail.com";
                final String password = "d23j27p40";
                String to = email;
                String sub = "Chandiagrh college of Engineering and Technology - Password Resetting";
                String msg = "Hello "+name+", Your Username is "+username+". Please set password by clicking the below link:\n"
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
                    %>
                    <div class="notice_style">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                    Hello,<%=name%>,\n A mail has been sent to your registered email address <%=email%> regarding your username and password. Please login to your email account to find your Username and Password.\nThank you.\n\nRedirecting to Login Page...
                    </div>
                    <div class="col-md-2">
                        
                    </div>
                </div>
            </div>
                    <%
                    response.setHeader("Refresh", "6;url=Generic_login_home.jsp");

                }
                catch (MessagingException e)
                {
                    throw new RuntimeException(e);
                }
            }
               
            }
            catch(Exception ex)
            {
                out.println("ERROR :<BR><p>"+ex+"</p>");  
            }  
            break;
        }
                
       if(registered_email_faculty.equals(email))
       {                   
          try
            {
                String qry2="select f_id, name, email_id from faculty where email_id='"+email+"'";
                ResultSet rs2= smt.executeQuery(qry2);
                if(rs2.next())
                {
                    System.out.println("Trying to send mail ...");
                    String username = rs2.getString(1);
                    String name = rs2.getString(2);
        
                String baseUrl = "http://localhost:8080/Interactive-College-Digitalization2/change_pass.jsp";
                
                final String from = "ccetinfoprovider@gmail.com";
                final String password = "d23j27p40";
                String to = email;
                String sub = "Chandiagrh college of Engineering and Technology - Password Resetting";
                String msg = "Hello "+name+", Your Username is "+username+". Please set password by clicking the below link:\n"
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
                    %>
                    
                    <div class="notice_style">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                    Hello,<%=name%>,\n A mail has been sent to your registered email address <%=email%> regarding your username and password. Please login to your email account to find your Username and Password.\nThank you.\n\nRedirecting to Login Page...
                    </div>
                    <div class="col-md-2">
                        
                    </div>
                </div>
            </div>
                    
                    <%
                    response.setHeader("Refresh", "6;url=Generic_login_home.jsp");

                }
                catch (MessagingException e)
                {
                    throw new RuntimeException(e);
                }
            }
            }
       
            catch(Exception ex)
            {
                out.println("ERROR :<BR><p>"+ex+"</p>");  
            } 
           break;
       
    }
    
        
        
    }
        
    }
        if(flag==1)
        {
            %>
            <div class="notice_style">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                   This is not a registered email address.\nRedirecting to home Page...
                    </div>
                    <div class="col-md-2">
                        
                    </div>
                </div>
            </div>
            
            <%
            response.setHeader("Refresh", "2;url=Generic_login_home.jsp");
        }
    }
    else
    {
        %>
        <div class="notice_style">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                   No records found.
                    </div>
                    <div class="col-md-2">
                        
                    </div>
                </div>
            </div>
        
        <%
    }
}
catch(Exception ex)
{
    out.println(ex);
}
        

        %>
    </div>
    <div class="col-md-2"></div>
</div>
        
