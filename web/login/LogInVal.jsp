
<%@page import="been.TeacherBeen"%>
<%@page import="modal.LogIn"%>
<%@page import="been.StudentBeen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam</title>
    </head>
    <body>
        <%
            String logger = request.getParameter("logger");
            boolean IsValid = false;

            if (logger.equals("student")) {

                StudentBeen stu = new StudentBeen();

                String regNo = request.getParameter("regNo");
                String password = request.getParameter("password");
                stu.setRegNo(regNo);
                stu.setPassword(password);

                if (!(regNo == "" || regNo == null) && !(password == "" || password == null)) {
//                    
                    IsValid = LogIn.logStudent(stu);
                    System.out.println(".............");
//                        LogIn.check();
                }
                if (IsValid) {
                    session.setAttribute("regNo", stu.getRegNo());
                    session.setAttribute("password", stu.getPassword());
//                    session.setAttribute("status", true);
//                    session.setAttribute("home", false);

//                    response.sendRedirect("../student/student.jsp");
             %>
                <script>
                    alert("You Are successfuly LogIn.. ");
                    window.location.href = "../student/student.jsp";
                </script> 
             <%   } else {
        %>
        <script>
            alert("Invalid Student inputs ");
            window.location.href = "../Index.jsp";
        </script> 
        <%
            }
        } else if (logger.equals("teacher")) {

            TeacherBeen tea = new TeacherBeen();
            String regNo = request.getParameter("regNo");
            String password = request.getParameter("password");
            tea.setRegNo(regNo);
            tea.setPassword(password);

            if (!(regNo == "" || regNo == null) && !(password == "" || password == null)) {
                IsValid = LogIn.logTeacher(tea);
            }
            if (IsValid) {
                session.setAttribute("regNo", tea.getRegNo());
                session.setAttribute("password", tea.getPassword());
//                session.setAttribute("status", true);
//                session.setAttribute("home", false);

//                response.sendRedirect("../teacher/teacher.jsp");
        %>
        <script>
            alert("You Are successfuly LogIn... ");
            window.location.href = "../teacher/teacher.jsp";
        </script> 
        <%
            } else {
        %>
        <script>
            alert("Invalid Teacher inputs");
            window.location.href = "../Index.jsp";
        </script> 
        <%
            }
        } else {
        %>
        <script>
            alert("Invalid inputs");
            window.location.href = "../Index.jsp";
        </script> 
        <%
            }
        %>
    </body>
</html>
