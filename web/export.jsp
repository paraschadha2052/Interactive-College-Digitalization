<%-- 
    Document   : export
    Created on : 20 Dec, 2017, 2:24:48 AM
    Author     : paras
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Export Data to CSV</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesheet.css">
    </head>
    <body>
        <%@include file="hod_header.jsp" %>
         <%@include file="ConnectPage.jsp" %>
         <%@include file="SesssionCheck.jsp" %> 
         
         <div class="container">
        <%
            if(request.getParameter("exportSubmit")!=null){
                int len = Integer.parseInt(request.getParameter("dataLength")), i, j;
                String file_name = request.getParameter("file_name");
                String csv_string = "", temp;
                
                i = 1;
                String head = request.getParameter("head_"+Integer.toString(i));
                temp = "";
                while(head != null){
                    if(request.getParameter("include_"+Integer.toString(i))!=null){
                        temp += ","+head;
                    }
                    i += 1;
                    head = request.getParameter("head_"+Integer.toString(i));
                }
                csv_string += temp.substring(1)+"\n";
                
                for(j=1;j<len;j++){
                    i = 1;
                    head = request.getParameter("head_"+Integer.toString(i));
                    temp = "";
                    while(head != null){
                        if(request.getParameter("include_"+Integer.toString(i))!=null){
                            temp += ","+request.getParameter("data_"+Integer.toString(j)+":"+Integer.toString(i));
                        }
                        i += 1;
                        head = request.getParameter("head_"+Integer.toString(i));
                    }
                    csv_string += temp.substring(1)+"\n";
                }
                
                if(file_name.length() == 0) file_name = "data.csv";
		
		response.setContentType("application/csv");
		response.setHeader("content-disposition","filename="+file_name); // Filename
		
		PrintWriter outx = response.getWriter();
		outx.println(csv_string);
		outx.flush();
		outx.close();
            }
        %>
        <form method="post">
            <h3>Select Columns to include:</h3>
        <%
            int i=1;
            String head = request.getParameter("head_"+Integer.toString(i));
            while(head != null){
        %>
                <input type="checkbox" name="include_<%=Integer.toString(i)%>" value="<%=head%>">  <%=head%><br>
        <%
                i += 1;
                head = request.getParameter("head_"+Integer.toString(i));
            }
            Enumeration in = request.getParameterNames();
            while(in.hasMoreElements()) {
                String paramName = in.nextElement().toString();
        %>
            <input type="hidden" name="<%=paramName%>" value="<%=request.getParameter(paramName)%>">
        <%
            }
        %>
        <br />
        <h3>Filename:</h3> <input type="text" name="file_name" value="data.csv"/><br /><br />
        <button type="submit" name="exportSubmit" class="btn btn-primary">Export</button>
        </form>
        </div>
    </body>
</html>
