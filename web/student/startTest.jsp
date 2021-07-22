
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.Student"%>
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
        
        
       <script language ="javascript" >
        var tim;
       
        var min = <%= request.getParameter("time")%>;
        var sec = 60;
        var f = new Date();
        function f1() {
            f2();
//            document.getElementById("starttime").innerHTML = "Your started your Exam at " + f.getHours() + ":" + f.getMinutes();
             
          
        }
        function f2() {
            if (parseInt(sec) > 0) {
                sec = parseInt(sec) - 1;
                document.getElementById("showtime").innerHTML = "Your Left Time  is :"+min+" Minutes ," + sec+" Seconds";
                tim = setTimeout("f2()", 1000);
            }
            else {
                if (parseInt(sec) == 0) {
                    min = parseInt(min) - 1;
                    if (parseInt(min) == 0) {
                        clearTimeout(tim);
                        location.href = "../student/checkAnswer.jsp";
                    }
                    else {
                        sec = 60;
                        document.getElementById("showtime").innerHTML = "Your Left Time  is :" + min + " Minutes " + sec + " Seconds";
                        tim = setTimeout("f2()", 1000);
                    }
                }
               
            }
        }
    </script>
    </head>
    <body onload="f1()">
        <jsp:include page="../header.jsp"/>
        <div class="bg-create-startTest">
            <form action="../student/checkAnswer.jsp">
            <div class="teacher-q-container">
                <div class="scroll-box">
                    
                <%
                    System.out.println(request.getParameter("time"));
                    String quizNo = request.getParameter("quizNo");
                    
                    QuizBeen quiz = new QuizBeen();
                    
                    List list = null;
                    int i=1;
                        list = Student.getQuestion(quizNo);
                        Iterator it = list.iterator();

                        while (it.hasNext()) {

                            QuizBeen qb = (QuizBeen) it.next();

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
                            <div class="stu-ans">
                                <div class="stu-answer-label-no">
                                    <label class="">01. </label>
                                </div>
                                <div class="stu-answer-label-c">
                                    <input class="stu-answer-input" type="checkbox" name="C1<%=i%>">
                                </div>
                                <div class="stu-answer-label-q">
                                    <label class="" id="answer1-label1"><%= qb.getAnswer1() %></label>
                                </div>
                            </div>
                            
                            <!--newDiv6-->
                             <div class="stu-ans">
                                <div class="stu-answer-label-no">
                                    <label class="">02. </label>
                                </div>
                                <div class="stu-answer-label-c">
                                    <input class="stu-answer-input" type="checkbox" name="C2<%=i%>">
                                </div>
                                <div class="stu-answer-label-q">
                                    <label class="" id="answer1-label1"><%= qb.getAnswer2() %></label>
                                </div>
                            </div>
                            <!--newDiv7-->
                             <div class="stu-ans">
                                <div class="stu-answer-label-no">
                                    <label class="">03. </label>
                                </div>
                                <div class="stu-answer-label-c">
                                    <input class="stu-answer-input" type="checkbox" name="C3<%=i%>">
                                </div>
                                <div class="stu-answer-label-q">
                                    <label class="" id="answer1-label1"><%= qb.getAnswer3() %></label>
                                </div>
                            </div>

                            <!--newDiv8-->
                            <div class="stu-ans">
                                <div class="stu-answer-label-no">
                                    <label class="">04. </label>
                                </div>
                                <div class="stu-answer-label-c">
                                    <input class="stu-answer-input" type="checkbox" name="C4<%=i%>">
                                </div>
                                <div class="stu-answer-label-q">
                                    <label class="" id="answer1-label1"><%= qb.getAnswer4() %></label>
                                </div>
                            </div>
                            <!--</form>-->
                            
                           
 
            
                            
                            
                        </div>
                    </div>
        <%
                i++;
                }      
        %>

                </div>
                <div class="teach-q-footer">
                    <div class="box-footer">
                        <div class="box-btn">
                            <lable class="q-btn" id="showtime"></lable>
                        </div>
                        <div class="box-btn">
                            <input type="hidden" name="quizNo" value="<%= quizNo %>">
                            <button class="q-btn" type="submit"  >Submit Quiz</button>
                        </div>
                        
                    </div>
                </div>

            </div>
            </form>
        </div>
<jsp:include page="../footer.html"/>
    </body>
</html>
