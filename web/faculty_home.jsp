<%-- 
    Document   : faculty_home
    Created on : Nov 25, 2017, 12:45:38 PM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css" /> 
    </head>
    
    <body>
        <div class="container-fluid">
        <%@include file="faculty_header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        
        <%@include file="SesssionCheck.jsp" %> 
     
         <%
        if(username != null)
        {
            String qry = "select name from faculty where f_id='"+username+"'";
            ResultSet rs = smt.executeQuery(qry);
            if(rs.next())
            {
                
                 %>
                 <div class="container-fluid">
                     <div class="row">
                         <div class="col-md-2">
                         
                     <div class="notice_style1">    
                    <p>Welcome <%=rs.getString(1)%>!<br>Now Manage your Academic Works Online.</p>
                     </div>
                             
                         </div>
                 <div class="col-md-10">
                     <div class="legend1">
                         
                         
                             LATEST NEWS/NOTICES 
                     </div>
                     <%
            }
        }
                     int i=1;
                     
                    String qry1 = "select * from notice where recipient= 'Faculty' OR recipient = 'Both'";
                    ResultSet rs1 = smt.executeQuery(qry1);
                    if(!rs1.next())
                    {
                        %>
                         <div class="notice_style">
                <div class="row">
                    <div class="col-md-12">
                      
                        <h3>No Current Notices.</h3>   
                        
                    </div>
                </div>
            </div>
                     
                         <%
                    }
                    else
                    {
                        
                        %>
                         <div class="row notice_head">
                                <div class="col-md-2">Date</div>
                                <div class="col-md-7">Subject</div>
                                <div class="col-md-3">Notice</div>
                            </div>
                         <%
                        while(rs1.next())
                            
                        {
                            rs1.beforeFirst();
                            %>
                          <div class="row notice_details">
                              <div class="col-md-2"><%=rs1.getString(4)%></div>
                                <div class="col-md-7"><%=rs1.getString(1)%></div>
                                <div class="col-md-3">
                                    <a href="./noticeupload/<%=rs1.getString(2)%>" target="_blank">Notice</a>
                                </div>
                               
                            </div> 
  
        
            <% 
            }
                    }
            
           
               
                 %>
                
                 
           
        </div>
                     </div>
              
                 </div>
        </div>
        
        
    </body>
</html>
