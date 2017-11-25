<%-- 
    Document   : attendance_back
    Created on : Nov 25, 2017, 10:11:00 PM
    Author     : DV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="css/stylesheet.css">
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        
        <div class="container-fluid">
        <%@include file="faculty_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        
           <%
            String b=request.getParameter("j");
            String sub_cod=request.getParameter("i");
            int s=Integer.parseInt(request.getParameter("k"));
            int y=Integer.parseInt(request.getParameter("tbNewAtt"));
            int i=1;
            String qry = "select s.roll_no, s.name, a.tot_lec, a.lec_att from student s, attendance a  where s.roll_no=a.roll_no and s.branch='"+b+"' and s.semester="+s+" and a.sub_code='"+sub_cod+"' order by s.roll_no asc";
          
            
             ResultSet rs1 = smt.executeQuery(qry);
             int count=0;
              while(rs1.next())
              {
                String x=rs1.getString(1);
                int a=Integer.parseInt(request.getParameter(x));
                int t=y + Integer.parseInt(rs1.getString(3));
                int l=a + Integer.parseInt(rs1.getString(4));
                
         
                    Statement smtt=null;
                   smtt=con.createStatement();
                   try{
                   String qry2 ="update attendance set tot_lec='"+t+"',lec_att='"+l+"' where roll_no='"+x+"' and sub_code='"+i+"'";
                   int r=smtt.executeUpdate(qry2);
                   if(r>0)
                   {
                       count=count+1;
                   }
                   }
                   catch(Exception ex)
                    {
                        out.println(ex);   
                    }
                            
            }
            
            
               
                 %>
                 
      <p style="color: blue; font-size: medium; alignment-adjust: central"> <%= count %> RECORDS HAVE BEEN UPDATED </p>
             
        </div>
    </body>
</html>
