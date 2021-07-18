
<%@page import="modal.Quiz"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            System.out.println(request.getParameter("quizNo"));
            System.out.println(request.getParameter("clickBtn"));

            if((request.getParameter("clickBtn").equals("remove"))){
                System.out.println(request.getParameter("quizNo"));
            System.out.println(request.getParameter("clickBtn"));
                boolean rmv = Quiz.removeQuiz(Integer.parseInt(request.getParameter("quizNo")));
                    if (rmv) {
        %>
                <script>
                    alert("Succesfully removerd... ");
                    window.location.href = "../teacher/teacher.jsp";
                </script> 
        <%
                } else {
        %>
                <script>
                    alert("Somthing Wrong! pleasse try Again... ");
                    window.location.href = "../teacher/teacher.jsp";
                </script> 
        <%
                }
            }else if((request.getParameter("clickBtn").equals("results"))){

            System.out.println(request.getParameter("quizNo"));
            System.out.println(request.getParameter("clickBtn"));

             session.setAttribute("quizNo", request.getParameter("quizNo"));
             %>
                 <script>
                    window.location.href = "../teacher/teacherResultView.jsp";
                </script> 
        <%
            }
        %>

            
         
    </body>
</html>
