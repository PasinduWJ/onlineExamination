
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        
        <%
            session.invalidate();
        %>
        <script>
            alert("You Are successfuly Log Out... ");
            window.location.href = "Index.jsp";
        </script> 
    </body>
</html>
