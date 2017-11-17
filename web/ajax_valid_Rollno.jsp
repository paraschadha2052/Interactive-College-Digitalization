<%-- 
    Document   : ajax_registration
    Created on : Nov 11, 2017, 12:59:11 PM
    Author     : DV
--%>

        <%
            String rollno = request.getParameter("rollno");
            
            int l=rollno.length();
            if(l>0)
            {
               %>
               <%@include file="ConnectPage.jsp" %>
               <%
           if(l>0)
            {       
              
                   String qry ="SELECT * FROM student WHERE roll_no='"+rollno+"'";
                   ResultSet rs=smt.executeQuery(qry);   
                   while(rs.next())
                   {
                       %>
                       ALREADY IN USE: <%= rs.getString(1)%>
                       <%
                   }
                                              
                   con.close();
               }
           
            }
        
       %>
