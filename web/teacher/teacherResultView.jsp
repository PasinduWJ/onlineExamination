
<%@page import="java.util.ArrayList"%>
<%@page import="been.AnswerBeen"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.Quiz"%>
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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <title>Exam</title>
    </head>
    <body>
        <jsp:include page="../header.jsp"/>
        <div class="bg-create-result">
            <div class="teacher-a-container">
                <div class="result-container">
                    <div class="scroll-box-a">
                        <div class="test-header-teach-aa">
                            <h1 class="test-header-h1a">Quiz <%= session.getAttribute("quizNo")%></h1>
                            <input type="hidden" name="quizNo" value="1">
                        </div>
                        <div id="myChart" style="width:100%; max-width:600px; height:500px;"></div>
                    </div>

                </div>    
            </div>
        </div>
       <jsp:include page="../footer.html"/>
        <script>
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Name', 'Marks'],
            <%
                String quizNo = (String) session.getAttribute("quizNo");
                  System.out.println("dfg");
                  System.out.println(quizNo);
                  Quiz quiz = new Quiz();
                  List list = null;
//                  ArrayList name = new ArrayList();
//                  ArrayList marks = new ArrayList();

                  int i = 1;
                  list = quiz.getMarks(quizNo);
                  Iterator it = list.iterator();
                  
                  if(list.isEmpty()){
                      System.out.println("mmmmmmmmmmmmmmmmmmm");
                      response.sendRedirect("../teacher/teacher.jsp");
                  }
                  while (it.hasNext()) {
                      
                      AnswerBeen qmb = (AnswerBeen) it.next();
                      String name = Quiz.getStuName(qmb.getStuRegNo());

             
            %>     
                    ['<%= name%>', <%= qmb.getMarks()%>],
         
            <%
               i++;
                    } 
                    
                   
            %>
                ]);

                var options = {
                    title: 'Students Results for Quiz'
                };

                var chart = new google.visualization.BarChart(document.getElementById('myChart'));
                chart.draw(data, options);
            }
            
             
        </script>

    </body>
</html>










<%

//                  System.out.println(request.getParameter("quizNo"));
//
//                  Quiz quiz = new Quiz();
//
//                  List list = null;
//                  ArrayList name = new ArrayList();
//                  ArrayList marks = new ArrayList();
//
//                  int i = 1;
//                  list = quiz.getMarks(request.getParameter("quizNo"));
//                  Iterator it = list.iterator();
//
//                  while (it.hasNext()) {
//
//                      AnswerBeen qmb = (AnswerBeen) it.next();
//                      String nameF = Quiz.getStuName(qmb.getStuRegNo());
//                      int mark = qmb.getMarks();
//                      name.add(nameF);
//
//                      marks.add(qmb.getMarks());
//                i++;
//                }
%>