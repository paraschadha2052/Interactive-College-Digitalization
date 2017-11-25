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
@WebServlet(name = "uploadpic", urlPatterns = {"/uploadpic"})

public class uploadpic extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try{
            MultipartRequest req = new MultipartRequest(request, "C:\\Users\\DV\\Documents\\NetBeansProjects\\salon\\web\\images\\");
           
            
               
               String id ,name,desc,fname;
               int price;
               id=req.getParameter("tbId");
               name=req.getParameter("tbName");
               desc=req.getParameter("tbDesc");
               fname=req.getFilesystemName("photo");
               price=Integer.parseInt((req.getParameter("tbPrice")));
               Connection con=null;
               Statement smt;
                         
                try
               {       
                   Class.forName("com.mysql.jdbc.Driver");
                   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/salon","root","");
                   
                   smt=con.createStatement();
                   String qry ="insert into deals values('"+id+"','"+name+"','"+desc+"',"+price+",'"+fname+"')" ;
             
 
                int r = smt.executeUpdate(qry);
                if (r > 0) 
                {
                  response.sendRedirect("products_admin.jsp");
                }                  
                   else
                   {
                             response.sendRedirect("add_products.jsp"); 
                   }
                 con.close();
               }  
               catch(Exception ex)
                       {
                           out.println("ERROR :<BR><p>"+ex+"</p>");  
                           response.sendRedirect("add_products.jsp");
                       }
            }finally
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
