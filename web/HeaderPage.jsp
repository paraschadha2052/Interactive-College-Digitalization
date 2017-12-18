<%-- 
    Document   : HeaderPage
    Created on : Nov 17, 2017, 7:01:42 PM
    Author     : Jitesh Mahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        <link rel="stylesheet" href="css/Logincss.css">
        <style>
            #container {
                width: 100%;
            }
            #container img {
                width: 100%;
            }
            </style>
        
    </head>
    <body>      
            
        <div>
        <div id="container">
            <a HREF="Generic_login_home.jsp"><img src="images/HEADER2.jpg" alt="Chandigarh College of Engineering and Technology" /></a>
        </div>

        <script type="text/javascript">
        (function() {

        var img = document.getElementById('container').firstChild;
        img.onload = function() 
        {
        if(img.height > img.width) {
            img.height = '100%';
            img.width = 'auto';}
        };

        }());
</script>
</div>
      
    </body>
</html>
