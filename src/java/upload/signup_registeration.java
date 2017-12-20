/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package upload;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVFormat;
import java.util.UUID;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.Reader;
import java.nio.file.Paths;
import java.nio.file.Files;

/**
 *
 * @author Jitesh Mahla
 */
@WebServlet(name = "signup_registeration", urlPatterns = {"/signup_registeration"})
public class signup_registeration extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try{
            MultipartRequest req = new MultipartRequest(request, "C:\\Users\\Monkey\\Documents\\NetBeansProjects\\Interactive-College-Digitalization2\\web\\Student_images" ,  2097152);
           
            String name,sex,dob,f_name, m_name,add_present, add_permanent, reg_no, roll_no, branch, uid,email, category, batch, mobile ,parent_mobile,image;
    int hostler=0,sem;

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
    //hostler=Integer.parseInt(request.getParameter("hostlerRadio"));
    
     out.println("HI error in radio ");
     
    batch=request.getParameter("tbBatch");
    sem=1;
    image=req.getFilesystemName("image");
    
    out.println("HI i m before csv read ");
    
    String SAMPLE_CSV_FILE_PATH = "C:\\Users\\Monkey\\Documents\\NetBeansProjects\\Interactive-College-Digitalization2\\web\\files\\students.csv";
    Reader reader = Files.newBufferedReader(Paths.get(SAMPLE_CSV_FILE_PATH));
    CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT);
    Iterable<CSVRecord> csvRecords = csvParser.getRecords();
    boolean valid_student = false;
    
    out.println("HI i m after csv read ");
    
    for (CSVRecord csvRecord : csvRecords) {
        if(csvRecord.get(0).equals(roll_no) && csvRecord.get(1).equals(name)){
            valid_student = true;
            break;
        }
    }
           
    out.println("HI i m outside first try");
                try
               {       
                   Connection con = null;
                   Statement smt = null;
                   Class.forName("com.mysql.jdbc.Driver");
                   con =DriverManager.getConnection("jdbc:mysql://localhost:3306/college_erp","root","");
                   
                   if(valid_student){
                    out.println("HI");
                    out.println(name+"\n");

                    try
                    {    
                        System.out.println("Trying to send mail ...");
                        String username = roll_no;
                        String baseUrl = "http://localhost:8080/Interactive-College-Digitalization2/verify.jsp";
                        String uuid = UUID.randomUUID().toString().replace("-", "");

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
                    String qry ="insert into student values('"+name+"','"+sex+"','"+dob+"','"+f_name+"', '"+m_name+"','"+add_present+"', '"+add_permanent+"', '"+reg_no+"', '"+roll_no+"','"+ branch+"', '"+uid+"','"+mobile+"','"+parent_mobile+"','"+email+"', '"+category+"',"+hostler+" ,'"+batch+"',"+sem+",'"+image+"')" ;
                        int r=smt.executeUpdate(qry);
                        if(r>0)
                        {
                            out.println("<p>You will receive a verification link in mail after you have been approved.</p>");
                            
                        }

                        else
                        {
                            out.println("<p>Sorry! Registeration Failed, Try again later.</p>");
                            
                        }
                        smt=con.createStatement();
                        qry ="insert into login values ('"+username+"','"+username+"','student','no', '"+uuid+"')";
                        smt.executeUpdate(qry);
                }

                catch(Exception ex)
                    {
                        out.println("ERROR :<BR><p>"+ex+"</p>");  
                    } 
            }
            else{
                    out.println("<p>You are not a valid student. Please contact college authorities.</p>");
                }
                   response.setHeader("Refresh", "3;url=Generic_login_home.jsp");
                 
              
               }
               catch(Exception ex)
                       {
                           out.println("<h3>\nAn error occurred while Rgisteration. \n\nPlease try agian after some time.</h3>\n\n <h2>Redirecting...<h2>");
                   response.setHeader("Refresh", "4;url=registrationForm.jsp");
                       } 
    
            }
            finally
                {
                    out.close();
                }
        } 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
