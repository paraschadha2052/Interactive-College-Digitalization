<%-- 
    Document   : admin_update_subject
    Created on : Dec 17, 2017, 11:36:29 PM
    Author     : DV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
    </head>
    <body>
        <%@include file="admin header.jsp" %>
        <%@include file="ConnectPage.jsp" %>
        
        <%
             String sub_code;
             int batch;
            if(request.getParameter("i")!=null && request.getParameter("j")!=null)
            {
               sub_code=request.getParameter("i");
               batch=Integer.parseInt(request.getParameter("j"));
            
               if(request.getParameter("btnSubmit")!=null) 
           {
               
              String sub_name, branch,F_id;
               int semester, sub_credits;
               sub_name=request.getParameter("sub_name");
               sub_credits=Integer.parseInt(request.getParameter("credits"));
               branch=request.getParameter("branchSelect");
               semester=Integer.parseInt(request.getParameter("semesterSelect"));
               F_id=request.getParameter("faculty");
               
                         
                 String qry1 ="update subject set sub_name='"+sub_name+"', branch='"+branch+"', F_id='"+F_id+"',semester="+semester+", sub_credits="+sub_credits+"  where sub_code='"+sub_code+"' and batch='"+batch+"'";
                   int x=smt.executeUpdate(qry1);
                   if(x>0)
                   {
                       %>
                       <div class="container-fluid" >       <h3>
                           Information Updated!
                                    </h3>
                       </div>
                       <%
                       
                       
                   }
                   
                   else
                   {
                           out.println("<p>Failed</p>");
                   }
                
           }
               if(request.getParameter("btnSubmit1")!=null) 
           {   
                   String qry2 ="delete from subject where sub_code='"+sub_code+"' and batch='"+batch+"'";
                   int x=smt.executeUpdate(qry2);
                   if(x>0)
                   {         
                         response.sendRedirect("admin_subject.jsp");                            
                   }
                   
                   else
                   {
                           out.println("<p>Failed</p>");
                   }
                 
           
           }
           
               
                   String qry ="select * from subject where sub_code='"+sub_code+"'and batch='"+batch+"' ";
                   ResultSet rs=smt.executeQuery(qry);    //resulset is set of records
                   rs.next();
                   %>
     
        <form method="post">
                   <table align="center" >
                
                
    <div class="form-group">
      <label for="sub_code" class="col-lg-2 control-label">Subject Code</label>
      <div class="col-lg-10">
          <input type="text" name="sub_code" class="form-control" id="sub_code" value="<%= rs.getString(1)%>" readonly>
      </div>
    </div>
    
                  
    <div class="form-group">
      <label for="sub_name" class="col-lg-2 control-label">Subject Name</label>
      <div class="col-lg-10">
          <input type="text" name="sub_name" class="form-control" id="sub_namee" value="<%= rs.getString(2)%>" >
      </div>
    </div>
                
    <div class="form-group">
      <label for="sub_code" class="col-lg-2 control-label">Subject Credits</label>
      <div class="col-lg-10">
          <input type="text" name="sub_code" class="form-control" id="sub_code" value="<%= rs.getString(3)%>" >
      </div>
    </div>
                
    <div class="form-group">
      <label for="branch" class="col-lg-2 control-label">Branch</label>
      <div class="col-lg-10">
          <input type="text" name="branch" class="form-control" id="branch" value="<%= rs.getString(4)%>" readonly>
      </div>
    </div>
                
      <div class="form-group">
      <label for="semesterSelect" class="col-lg-2 control-label">Semester: </label>
      <div class="col-lg-10">
          <select name="semesterSelect" class="form-control" id="semesterSelect">
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
          <option>6</option>
          <option>7</option>
          <option>8</option>
        </select>
      </div>
    </div>
    
                
 <div class="form-group">
      <label for="faculty" class="col-lg-2 control-label">Faculty: </label>
      <div class="col-lg-10">
          <select name="faculty" class="form-control" id="faculty">
          <%@include file="ConnectPage.jsp" %>
          <%
          
            Statement smtt=null;
              smtt=con.createStatement();
           String qry3 = "select * from faculty " ;
            ResultSet rs3 = smtt.executeQuery(qry3);
            while(rs3.next())
            {
            %>
              <option value="<%=rs3.getString(1) %>"><%=rs3.getString(2) %></option>
            
              <% } %>
        </select>
      </div>
    </div>
    
                   
    <div class="form-group">
      <label for="batch" class="col-lg-2 control-label">Batch</label>
      <div class="col-lg-10">
          <input type="text" name="batch" class="form-control" id="batch" value="<%= rs.getString(7)%>" readonly>
      </div>
    </div>
           
            
            <tr>
               <td align="center"><input type="submit" name="btnSubmit" value="UPDATE"></td>
               <td align="center"><input type="submit" name="btnSubmit1" value="DELETE"></td>
            </tr>
            </table>
            
             <%
            
               
           }
            else
            {
            %>
            OOOOOOOOOOOOOOOOOOOOOOOOPPPPPPPPPPPPPPPPPPPssssssssss!
            
            <%
            }
            %>
            </form>
            
    </body>
</html>