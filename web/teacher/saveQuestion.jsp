
<%@page import="been.QuizMainBeen"%>
<%@page import="been.QuizBeen"%>
<%@page import="modal.Quiz"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/7eefacbee9.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Yesteryear&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Rochester&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../css/style.css">
        <title>Exam</title>
    </head>
    <body>
        <%
            String subject = request.getParameter("Subject");
            String leval = request.getParameter("leval");
            String timeMin = request.getParameter("timeMin");
            
            QuizMainBeen qMain = new QuizMainBeen();
            qMain.setTeaRegNo((String) session.getAttribute("regNo"));
            qMain.setSubject(subject);
            qMain.setLeval(Integer.parseInt(leval));
            qMain.setTimeMin(timeMin);

            int i = 1;
            ArrayList question = new ArrayList();
            
            while (request.getParameter("Q" + i) != null) {
                QuizBeen qb = new QuizBeen();
                qb.setQuestion(request.getParameter("Q" + i));
                qb.setAnswer1(request.getParameter("A1" + i));
                qb.setAnswer2(request.getParameter("A2" + i));
                qb.setAnswer3(request.getParameter("A3" + i));
                qb.setAnswer4(request.getParameter("A4" + i));
                qb.setCheck1((request.getParameter("C1" + i)) != null);
                qb.setCheck2((request.getParameter("C2" + i)) != null);
                qb.setCheck3((request.getParameter("C3" + i)) != null);
                qb.setCheck4((request.getParameter("C4" + i)) != null);

                question.add(qb);
                i++;
            }

            boolean isSaveQuestions = false;

            isSaveQuestions = Quiz.saveQuestion(qMain, question);
            System.out.println(isSaveQuestions);
            if (isSaveQuestions) {
        %>
        <script>
            alert("Quiz Saved... ");
            window.location.href = "../teacher/teacher.jsp";
        </script> 
        <%
        } else {
        %>
        <script>
            alert("Somthing Wrong!... ");
            window.location.href = "../teacher/teacher.jsp";
        </script> 
        <%
            }
        %>
    </body>
</html>
