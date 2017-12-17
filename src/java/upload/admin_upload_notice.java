/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package upload;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
 
/**
 *
 * @author DV
 */
@WebServlet(name = "admin_upload_notice", urlPatterns = {"/admin_upload_notice"})

public class admin_upload_notice extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try{
            MultipartRequest req = new MultipartRequest(request, "C:\\Users\\Monkey\\Documents\\NetBeansProjects\\Interactive-College-Digitalization2\\web\\fileupload");
               
            final long MAX_RESUME_SIZE = 5242880; // 5MB -> 5 * 1024 * 1024
           
            
               String subject, fname;
               subject=req.getParameter("txtSubject");               
               fname=req.getFilesystemName("pdf");
               
               Connection con=null;
               Statement smt;
               
                try
               {       
                   Class.forName("com.mysql.jdbc.Driver");
                   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/college_erp","root","");
                   
                   
                       smt=con.createStatement();
                   String qry ="insert into notice values('"+subject+"','"+fname+"')" ;
             
 
                int r = smt.executeUpdate(qry);
                if (r > 0) 
                {
                   out.println("<h3>\nYour Notice has been Uploaded Succesfully. \n\nThank you.</h3>\n\n <h2>Redirecting to Home...<h2>");
                   response.setHeader("Refresh", "4;url=admin_home.jsp");
                }                  
                   else
                   {
                        out.println("<h3>\nAn error occurred while uploading the Notice. \n\nPlease try agian.</h3>\n\n <h2>Redirecting...<h2>");
                   response.setHeader("Refresh", "4;url=admin_notice_upload.jsp");
                   }
                 con.close();
              
               }
               catch(Exception ex)
                       {
                           out.println("<h3>\nAn error occurred while uploading the Notice. \n\nPlease try agian after some time.</h3>\n\n <h2>Redirecting...<h2>");
                   response.setHeader("Refresh", "4;url=admin_home.jsp");
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