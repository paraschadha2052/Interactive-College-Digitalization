<%-- 
    Document   : notices
    Created on : Dec 18, 2017, 11:53:02 PM
    Author     : Jitesh Mahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylesheet.css">
        <link rel="stylesheet" href="css/Logincss.css">
        <link rel="stylesheet" href="css/newDesign.css">
        <style>
            .disabled {
    pointer-events:none; //This makes it not clickable
    opacity:0.6;         //This grays it out to look disabled
}
            </style>
    </head>
    <body>
        <%@include file="ConnectPage.jsp" %>
        <%@include file="HeaderPage.jsp" %>
        
        <div class="container">
        <div class="legend1">
                        LATEST NOTICES 
                     </div>
                     <%
                    int next=Integer.parseInt(request.getParameter("next"));
                    int prev=Integer.parseInt(request.getParameter("prev"));
                    int n=Integer.parseInt(request.getParameter("n"));
                    int nnpp = 10;
                    int tnp = 10;
                    int flag = 0;
                    
                    String qry = "select * from notice order by Date desc";
                    ResultSet rs = smt.executeQuery(qry);
                    if(!rs.next())
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
                             <div class="col-md-7">Title</div>
                                <div class="col-md-2">Date</div>
                                
                                <div class="col-md-3">Detail</div>
                            </div>
                         <%
                        
           
            }
                    
             if(n==1)
             {
                 
                        rs.absolute(next);
                        for(int x=1;x<=nnpp;x++)
                        {
                        %>
                          <div class="row notice_details">
                              <div class="col-md-7"><%=rs.getString(1)%></div>
                              <div class="col-md-2"><%=rs.getString(4)%></div>
                                
                                <div class="col-md-3">
                                    <a href="./noticeupload/<%=rs.getString(2)%>" target="_blank">Notice</a>
                                </div>
                               
                            </div> 
  
        
            <% 
            if(!rs.next())
                    {
                        flag= 1;
                        break;
                    }
            }
              
                 %>
       
                
<ul class="pager">
  <li class="disabled previous"><a href="notices.jsp?">Previous</a></li>
  <%if(flag==1){%>
  <li class="disabled next"><a href="notices.jsp?next=<%=next+nnpp%>&prev=<%=prev%>&n=<%=n+1%>">Next</a></li>
  <%}
  else{%>
  <li class="next"><a href="notices.jsp?next=<%=next+nnpp%>&prev=<%=prev%>&n=<%=n+1%>">Next</a></li>
  <%}%>
</ul>
       
                
  <%
             }
  else if(n==2)
  {
      rs.absolute(next);
                        for(int x=1;x<=nnpp;x++)
                        {
                        %>
                          <div class="row notice_details">
                              <div class="col-md-7"><%=rs.getString(1)%></div>
                              <div class="col-md-2"><%=rs.getString(4)%></div>
                                
                                <div class="col-md-3">
                                    <a href="./noticeupload/<%=rs.getString(2)%>" target="_blank">Notice</a>
                                </div>
                               
                            </div> 
  
        
            <% 
            if(!rs.next())
                    {
                        flag = 1;
                        break;
                    }
            }
      %>
      <ul class="pager">
  <li class="previous"><a href="notices.jsp?next=<%=next-nnpp%>&prev=<%=prev%>&n=<%=n-1%>">Previous</a></li>
  <%if(flag==1){%>
  <li class="disabled next"><a href="notices.jsp?next=<%=next+nnpp%>&prev=<%=prev+nnpp%>&n=<%=n+1%>">Next</a></li>
  <%}
  else{%>
  <li class="next"><a href="notices.jsp?next=<%=next+nnpp%>&prev=<%=prev+nnpp%>&n=<%=n+1%>">Next</a></li>
  <%}%>
  
</ul>
<% }
  else if(n==tnp)
  {
      rs.absolute(next);
                        for(int x=1;x<=nnpp;x++)
                        {
                        %>
                          <div class="row notice_details">
                              <div class="col-md-7"><%=rs.getString(1)%></div>
                              <div class="col-md-2"><%=rs.getString(4)%></div>
                                
                                <div class="col-md-3">
                                    <a href="./noticeupload/<%=rs.getString(2)%>" target="_blank">Notice</a>
                                </div>
                               
                            </div> 
  
        
            <% 
            if(!rs.next())
                    {
                        flag = 1;
                        break;
                    }
            }
      %>
      <ul class="pager">
  <li class="previous"><a href="notices.jsp?next=<%=next-nnpp%>&prev=<%=prev-nnpp%>&n=<%=n-1%>">Previous</a></li>
  <li class="disabled next"><a href="notices.jsp?">Next</a></li>
</ul>
<% }
else
{
    rs.absolute(next);
                        for(int x=1;x<=nnpp;x++)
                        {
                        %>
                          <div class="row notice_details">
                              <div class="col-md-7"><%=rs.getString(1)%></div>
                              <div class="col-md-2"><%=rs.getString(4)%></div>
                                
                                <div class="col-md-3">
                                    <a href="./noticeupload/<%=rs.getString(2)%>" target="_blank">Notice</a>
                                </div>
                               
                            </div> 
  
        
            <% 
            if(!rs.next())
                    {
                        flag = 1;
                        break;
                    }
            }
  
  %>
   <ul class="pager">
  <li class="previous"><a href="notices.jsp?next=<%=next-nnpp%>&prev=<%=prev-nnpp%>&n=<%=n-1%>">Previous</a></li>
  <%if(flag==1){%>
  <li class="disabled next"><a href="notices.jsp?next=<%=next+nnpp%>&prev=<%=prev+nnpp%>&n=<%=n+1%>">Next</a></li>
  <%}
  else{%>
  <li class="next"><a href="notices.jsp?next=<%=next+nnpp%>&prev=<%=prev+nnpp%>&n=<%=n+1%>">Next</a></li>
  <%}%>
  
</ul>
<% } %>
 </div>
        
    </body>
</html>
