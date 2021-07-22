
<%@page import="java.util.Iterator"%>
<%@page import="modal.Student"%>
<%@page import="java.util.List"%>
<%@page import="been.QuizBeen"%>
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
        <body onload="f1()">
            <jsp:include page="../header.jsp"/>
        <div class="bg-create-startTest">
            <form action="../student/checkAnswer.jsp">
            <div class="teacher-q-container">
                <div class="scroll-box">

        <%

            String quizNo = request.getParameter("quizNo");
            String sRegNo = (String) session.getAttribute("regNo");
            QuizBeen quiz = new QuizBeen();

            List list = null;
            int i = 1;
            int marks = 0;
            list = Student.getAnswer(quizNo);
            Iterator it = list.iterator();

            while (it.hasNext()) {

                boolean c1 = true;
                boolean c2 = true;
                boolean c3 = true;
                boolean c4 = true;
                String check1 = "checked";
                String check2 = "checked";
                String check3 = "checked";
                String check4 = "checked";
                String ans1 = "";
                String ans2 = "";
                String ans3 = "";
                String ans4 = "";
                try {

                    QuizBeen qb = (QuizBeen) it.next();

                    if (request.getParameter("C1" + i) == null) {c1 = false; check1 = "unchecked";}
                    if (request.getParameter("C2" + i) == null) {c2 = false;check2 = "unchecked";}
                    if (request.getParameter("C3" + i) == null) {c3 = false;check3 = "unchecked";}
                    if (request.getParameter("C4" + i) == null) { c4 = false;check4 = "unchecked";}
            
                    if ((c1 == qb.isCheck1())
                            && (c2 == qb.isCheck2())
                            && (c3 == qb.isCheck3())
                            && (c4 == qb.isCheck4())) {
                            
                        
                        marks++;
                        System.out.println(".....................................");
                    }
                    
                    if(qb.isCheck1()){ans1 = "stu-ans-currect";}
                    if(qb.isCheck2()){ans2 = "stu-ans-currect";}
                    if(qb.isCheck3()){ans3 = "stu-ans-currect";}
                    if(qb.isCheck4()){ans4 = "stu-ans-currect";}
                    
                    if(qb.isCheck1()== true && c1==false){ans1 = "stu-ans-wrong";}
                    if(qb.isCheck2()== true && c2==false){ans2 = "stu-ans-wrong";}
                    if(qb.isCheck3()== true && c3==false){ans3 = "stu-ans-wrong";}
                    if(qb.isCheck4()== true && c4==false){ans4 = "stu-ans-wrong";}
                
                %>
<div id = container >
                        <!--newDiv-->
                        <div class="test-header-teach-q" id="qus-no-div1">
                            <h1 class="test-header-h1" id="qus-no-h11" >Question <%= i %></h1>
                            
                        </div>
                        <!--newDiv2-->
                        <div class="teach-q-body" id="teacher-question-body">
                            <!--newDiv3-->
                            <div class="student-q" id="question-write-lable">
                                <label ><%= qb.getQuestion() %></label>
                            </div>
                          
                            <!--newDiv5-->
                            <div class="stu-ans <%= ans1%>">
                                <div class="stu-answer-label-no">
                                    <label class="">01. </label>
                                </div>
                                <div class="stu-answer-label-c">
                                    <input class="stu-answer-input" type="checkbox" <%= check1%>>
                                </div>
                                <div class="stu-answer-label-q">
                                    <label class="" id="answer1-label1"><%= qb.getAnswer1() %></label>
                                </div>
                            </div>
                            
                            <!--newDiv6-->
                             <div class="stu-ans <%= ans2%>">
                                <div class="stu-answer-label-no">
                                    <label class="">02. </label>
                                </div>
                                <div class="stu-answer-label-c">
                                    <input class="stu-answer-input" type="checkbox" <%= check2%>>
                                </div>
                                <div class="stu-answer-label-q">
                                    <label class="" id="answer1-label1"><%= qb.getAnswer2() %></label>
                                </div>
                            </div>
                            <!--newDiv7-->
                             <div class="stu-ans <%= ans3%>">
                                <div class="stu-answer-label-no">
                                    <label class="">03. </label>
                                </div>
                                <div class="stu-answer-label-c">
                                    <input class="stu-answer-input" type="checkbox" <%= check3%>>
                                </div>
                                <div class="stu-answer-label-q">
                                    <label class="" id="answer1-label1"><%= qb.getAnswer3() %></label>
                                </div>
                            </div>

                            <!--newDiv8-->
                            <div class="stu-ans <%= ans4%>">
                                <div class="stu-answer-label-no">
                                    <label class="">04. </label>
                                </div>
                                <div class="stu-answer-label-c">
                                    <input class="stu-answer-input" type="checkbox" <%= check4%>>
                                </div>
                                <div class="stu-answer-label-q">
                                    <label class="" id="answer1-label1"><%= qb.getAnswer4() %></label>
                                </div>
                            </div>
                            <!--</form>-->

                        </div>
                    </div>
         <%      
             } catch (Exception e) {
                }
                i++;
                
            }

            Student.saveMarks(quizNo, sRegNo, marks);
System.out.println(marks);
        %>
        </div>
                <div class="teach-q-footer">
                    <div class="box-footer">
                        <div class="box-btn">
                            <lable class="q-btn"> Your result is: <%= marks%>/<%= i-1%></lable>
                        </div>
                        <div class="box-btn">
                            <a class="q-btn" type="button" href="../student/student.jsp" >Exit</a>
                        </div>
                        
                    </div>
                </div>

            </div>
        </div>
                        <jsp:include page="../footer.html"/>
    </body>
</html>
