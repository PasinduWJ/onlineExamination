
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.Quiz"%>
<%@page import="been.QuizMainBeen"%>
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
        <%
            String teaRegNo = (String) session.getAttribute("regNo");
            try {
                if (teaRegNo.equals(null)) {
                }
            } catch (Exception e) {
                response.sendRedirect("../Index.jsp");
            }
        %>
    </head>
    <body>
        <jsp:include page="../header.jsp"/>

        <form action="../teacher/saveQuestion.jsp">
        <div class="quiz">
            <div class="quiz-col">
                <div class="quiz-h2">
                    <h2>Create New Quiz</h2>
                </div>
                
                <div class="quiz-sub">
                    <label >Choose a subject</label>
                    <select id="sub" name="Subject">
                        <option name="subject" selected>English</option>
                        <option name="subject" >Math</option>
                        <option name="subject">Science</option>
                        <option name="subject">Bio</option>
                    </select> 
                </div>
                <div class="quiz-sub">
                    <label >Choose a Leval</label>
                    <select id="leval" name="leval">
                        <option name="leval" selected>1</option>
                        <option name="leval">2</option>
                        <option name="leval">3</option>
                        <option name="leval" >4</option>
                    </select>
                </div>
                <div class="quiz-sub">
                    <label >Set Time(min): </label>
                    <input name="timeMin">
                </div>
                <div class="quiz-button">
                    <button type="button" onclick="createQuiz()" >Create Quiz</button>
                </div>
                    
            </div>
        </div>
            <jsp:include page="../teacher/creteQuestion.jsp"/>
                </form>

        <div class="test-section">
            <h3 class="teacher-head">All Quiz</h3>
<div class="test-section-quiz">
            <%
                Quiz quiz = new Quiz();
                
                List list = null;
                int i=1;
                    list = quiz.getAllQuiz(teaRegNo);
                    Iterator it = list.iterator();

                    while (it.hasNext()) {
                        
                        QuizMainBeen qmb = (QuizMainBeen) it.next();
                
            %>
            
            <div class="test-container">
                <div class="test-col">
                    <div class="box-quiz">
                        <div class="test-header">
                            <h1 class="test-header-h1">Quiz <%= i%></h1>
                            <h3 class="test-header-h3"><%= qmb.getSubject()%> <%= qmb.getTimeMin()%> min Test</h3>
                            <h3 class="test-header-h3">Leval <%= qmb.getLeval()%> Students</h3>
                        </div>
                        <form action="../teacher/changes.jsp">
                        <div class="box-body">
                            <button >Ragister for a class</button>
                            <button >Create a test</button>
                            <input type="hidden" name="quizNo" value="<%= qmb.getQuizNo()%>">
                            <button type="submit" name="clickBtn" value="results">View Student Proformence</button>
                            <button type="submit" name="clickBtn" value="remove">Remove This Quiz</button>
                        </div>
                        </form>
                        <div class="box-footer">
                            <div class="box-btn">
                                <a href="../teacher/teacher.jsp">View Results</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <%
                i++;
                }
            %>
            
          </div>
        </div>
        <jsp:include page="../footer.html"/>

        <script >
            function createQuiz() {
                document.querySelector('.bg-create-qestion').style.display = 'flex';
            };
            document.querySelector('.close-create-q').addEventListener('click',
                    function () {
                        document.querySelector('.bg-create-qestion').style.display = 'none';
                    });
     

            document.getElementById("newQuestion").onclick = function () {

                var container = document.getElementById("container");
                var section = document.createElement("section");

                try {
                    for (var i=1; document.getElementById(i).hasChildNodes(); i++) {}
                } catch (e) {}
                
                section.setAttribute("id", i);
                
//div class="test-header-teach-q" id="newDiv"
                var newDiv = document.createElement("div");
                newDiv.setAttribute("id","qus-no-div"+ i);
                newDiv.setAttribute("class","test-header-teach-q");
                
//h1 class="test-header-h1" id="questionNo" >Question 01
                var newh1 = document.createElement("h1");
                newh1.setAttribute("id","qus-no-h1"+ i);
                newh1.setAttribute("class","test-header-h1");
//create close button
                var newclose = document.createElement("button");
                newclose.setAttribute("id","qus-no-close"+ i);
                newclose.setAttribute("onclick","closeQuestionCreate("+ i +")");
                newclose.setAttribute("class","close-ques-head");
//add Element to newDiv                 
                newDiv.appendChild(newh1.cloneNode(true));
                newDiv.appendChild(newclose.cloneNode(true));
                
//create div class="teach-q-body" id="teacher-question-body"               
                var newDiv2 = document.createElement("div");
                newDiv2.setAttribute("class","teach-q-body"); 
//get Write Your Question. lavle div
                var newDiv3 = document.getElementById("question-write-lable");
                
//create write question area
                var newDiv4 = document.createElement("div");
                newDiv4.setAttribute("class", "teach-question");
                
                var questionW = document.createElement("textarea");
                questionW.setAttribute("name", "Q"+ i);
                questionW.setAttribute("rows","4");
                questionW.setAttribute("cols","68");
                newDiv4.appendChild(questionW.cloneNode(true));
//create answer 1
                var newDiv5 = document.createElement("div");
                newDiv5.setAttribute("class", "teach-ans");
                
                var labelA1 = document.createElement("label");
                labelA1.setAttribute("id", "answer1-label"+i);
                newDiv5.appendChild(labelA1.cloneNode(true));
                
                var textAnswe1 = document.createElement("textarea");
                textAnswe1.setAttribute("name","A1"+ i);
                textAnswe1.setAttribute("rows","2");
                textAnswe1.setAttribute("cols","60");
                newDiv5.appendChild(textAnswe1.cloneNode(true));
                
                var checkAnswe1 = document.createElement("input");
                checkAnswe1.setAttribute("type","checkbox");
                checkAnswe1.setAttribute("name","C1"+i);
                newDiv5.appendChild(checkAnswe1.cloneNode(true));
                
       
//create answer 2
                var newDiv6 = document.createElement("div");
                newDiv6.setAttribute("class", "teach-ans");
                
                var labelA2 = document.createElement("label");
                labelA2.setAttribute("id", "answer2-label"+i);
                newDiv6.appendChild(labelA2.cloneNode(true));
                
                
                var textAnswe2 = document.createElement("textarea");
                textAnswe2.setAttribute("name","A2"+ i);
                textAnswe2.setAttribute("rows","2");
                textAnswe2.setAttribute("cols","60");
                newDiv6.appendChild(textAnswe2.cloneNode(true));
                
                var checkAnswe2 = document.createElement("input");
                checkAnswe2.setAttribute("type","checkbox");
                checkAnswe2.setAttribute("name","C2"+i);
                newDiv6.appendChild(checkAnswe2.cloneNode(true));

//create answer 3
                var newDiv7 = document.createElement("div");
                newDiv7.setAttribute("class", "teach-ans");
                
                var labelA3 = document.createElement("label");
                labelA3.setAttribute("id", "answer3-label"+i);
                newDiv7.appendChild(labelA3.cloneNode(true));
                
                
                var textAnswe3 = document.createElement("textarea");
                textAnswe3.setAttribute("name","A3"+ i);
                textAnswe3.setAttribute("rows","2");
                textAnswe3.setAttribute("cols","60");
                newDiv7.appendChild(textAnswe3.cloneNode(true));
                
                var checkAnswe3 = document.createElement("input");
                checkAnswe3.setAttribute("type","checkbox");
                checkAnswe3.setAttribute("name","C3"+i);
                newDiv7.appendChild(checkAnswe3.cloneNode(true));
                
//create answer 4
                var newDiv8 = document.createElement("div");
                newDiv8.setAttribute("class", "teach-ans");
                
                var labelA4 = document.createElement("label");
                labelA4.setAttribute("id", "answer4-label"+i);
                newDiv8.appendChild(labelA4.cloneNode(true));
                
                
                var textAnswe4 = document.createElement("textarea");
                textAnswe4.setAttribute("name","A4"+ i);
                textAnswe4.setAttribute("rows","2");
                textAnswe4.setAttribute("cols","60");
                newDiv8.appendChild(textAnswe4.cloneNode(true));
                
                var checkAnswe4 = document.createElement("input");
                checkAnswe4.setAttribute("type","checkbox");
                checkAnswe4.setAttribute("name","C4"+i);
                newDiv8.appendChild(checkAnswe4.cloneNode(true));
                
                
                
                newDiv2.appendChild(newDiv3.cloneNode(true));
                newDiv2.appendChild(newDiv4.cloneNode(true));
                newDiv2.appendChild(newDiv5.cloneNode(true));
                newDiv2.appendChild(newDiv6.cloneNode(true));
                newDiv2.appendChild(newDiv7.cloneNode(true));
                newDiv2.appendChild(newDiv8.cloneNode(true));
                
                section.appendChild(newDiv.cloneNode(true));
                section.appendChild(newDiv2.cloneNode(true));
                container.appendChild(section.cloneNode(true));
                
//add Question No to hedder and close mark          
                document.getElementById("qus-no-h1"+ i).innerHTML = "Question " + i;
                document.getElementById("qus-no-close"+ i).innerHTML = "+";
                document.getElementById("answer1-label"+i).innerHTML = "Answer 1";
                document.getElementById("answer2-label"+i).innerHTML = "Answer 2";
                document.getElementById("answer3-label"+i).innerHTML = "Answer 3";
                document.getElementById("answer4-label"+i).innerHTML = "Answer 4";
            };

            function closeQuestionCreate(no) {
                var section = document.getElementById(no);
                section.remove();
            };


        </script>
    </body>
</html>
