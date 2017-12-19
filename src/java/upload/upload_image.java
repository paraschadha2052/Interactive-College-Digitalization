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
@WebServlet(name = "upload_image", urlPatterns = {"/upload_image"})

public class upload_image extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try{
            MultipartRequest req = new MultipartRequest(request, "C:\\Users\\Monkey\\Documents\\NetBeansProjects\\Interactive-College-Digitalization2\\web\\Student_images" ,  2097152);
           
               String rollno ,sem, bti,fname;
               rollno=req.getParameter("tbRollNo");
               sem=req.getParameter("semesterSelect");
               bti=req.getParameter("tbBTI");
               fname=req.getFilesystemName("pdf");
               Connection con=null;
               Statement smt;
               
                try
               {       
                   Class.forName("com.mysql.jdbc.Driver");
                   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/college_erp","root","");
                   
                   
                       smt=con.createStatement();
                   String qry ="insert into fee_recipt values('"+rollno+"','"+fname+"','"+bti+"','"+sem+"')" ;
             
 
                int r = smt.executeUpdate(qry);
                if (r > 0) 
                {
                   out.println("<h3>\nYour Fee Receipt has been Uploaded Succesfully. \n\nThank you.</h3>\n\n <h2>Redirecting to Home...<h2>");
                   response.setHeader("Refresh", "4;url=student_home.jsp");
                }                  
                   else
                   {
                        out.println("<h3>\nAn error occurred while uploading Fee Receipt. \n\nPlease try agian.</h3>\n\n <h2>Redirecting...<h2>");
                   response.setHeader("Refresh", "4;url=fee_recipt.jsp");
                   }
                 con.close();
              
               }
               catch(Exception ex)
                       {
                           out.println("<h3>\nAn error occurred while uploading Fee Receipt. \n\nPlease try agian after some time.</h3>\n\n <h2>Redirecting...<h2>");
                   response.setHeader("Refresh", "4;url=fee_recipt.jsp");
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
