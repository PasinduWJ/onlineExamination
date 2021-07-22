
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.Quiz"%>
<%@page import="been.QuizMainBeen"%>
<%@page import="modal.Student"%>
<%@page import="been.StudentBeen"%>
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
            try {
                    String sRegNo = (String) session.getAttribute("regNo");
                    if(sRegNo.equals(null)){}
                
            
                String regNo = (String) session.getAttribute("regNo");
                StudentBeen stu = new StudentBeen();
                stu = Student.getStudentDetails(regNo);
                
                String firstName = stu.getFirstName();
                String lastName = stu.getLastName();
                String department = stu.getDepartment();
                int leval = stu.getLeval();
           
        %>
    </head>
    <body>
      <!-- *********************** Start Header Section ************************** -->
      <jsp:include page="../header.jsp"/>
    <!-- *********************** End Header Section ************************** -->
        
     <!-- *********************** Start Test Section ************************** -->

    <div class="test-section">
        <h1 class="test-h1">Welcome to Leval <%= leval%> Online Exam Page.</h1>
        <h2 class="test-h2">Hello <%= firstName%> <%= lastName%></h2>
        
<div class="test-section-quiz">
            <%
                
                Quiz quiz = new Quiz();
                
                List list = null;
                int i=1;
                    list = Student.getAllQuiz(leval);
                    Iterator it = list.iterator();

                    while (it.hasNext()) {
                        
                        QuizMainBeen qmb = (QuizMainBeen) it.next();
                        
                        String teaName = Student.getTeacher(qmb.getTeaRegNo());
                        int time = (Integer.parseInt(qmb.getTimeMin()) - 1);
                        
                        int qnumber = qmb.getQuizNo();

                        String marks = Student.getQuizmark(sRegNo, qnumber);
                        

                        if (marks==null) {
                            marks = "PENDING...";
                            
                        }
            %>
            
            <div class="test-container">
                <div class="test-col">
                    <div class="box-quiz">
                        <form action="../student/startTest.jsp">
                        <div class="test-header">
                            <h1 class="test-header-h1">Quiz <%= i%></h1>
                            <h3 class="test-header-h3"><%= qmb.getSubject()%> <%= qmb.getTimeMin()%> min Test</h3>
                            <h3 class="test-header-h3">Teacher:   <%=  teaName%></h3>
                        </div>
                        
                        <div class="box-body">
                            <button >Good Luck.</button>
                            <button >Your Marks is: <%= marks%></button>
                            <input type="hidden" name="quizNo" value="<%= qmb.getQuizNo()%>">
                            <input type="hidden" name="time" value="<%= time%>">
                        </div>
                        
                        <div class="box-footer">
                            <div class="box-btn">
                                <button type="submit">Start Test</button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            
            <%
                i++;
                }
} catch (Exception e) {
                        response.sendRedirect("../Index.jsp");
                }
            %>
            
          </div>
       
    </div>
    <!-- *********************** End box Section ************************** -->
  <!-- *********************** Start Footer Section ************************** -->
            <jsp:include page="../footer.html"/>
            <!-- *********************** End Footer Section ************************** -->

    </body>
</html>
