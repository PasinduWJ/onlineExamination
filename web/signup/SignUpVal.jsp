<%@page import="been.TeacherBeen"%>
<%@page import="modal.SignUp"%>
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
            boolean IsValid = false;
            boolean regVal;

            String action = request.getParameter("signer");

            if (action.equals("student")) {

                String regNo = request.getParameter("regNo");
                String fname = request.getParameter("firstname");
                String lname = request.getParameter("lastname");
                String dpt = request.getParameter("department");
                String level = request.getParameter("level");
                String password = request.getParameter("password");
                String con_password = request.getParameter("confirm_password");

                if (password.equals(con_password)) {
                    StudentBeen stu = new StudentBeen();

                    stu.setRegNo(regNo);
                    stu.setFirstName(fname);
                    stu.setLastName(lname);
                    stu.setDepartment(dpt);
                    stu.setLevel(level);
                    stu.setPassword(password);

                    regVal = SignUp.signUpValidateStudent(stu);

                    if (!regVal) {
                        IsValid = SignUp.signUpStudent(stu);

                        if (IsValid) {%>
        <script>
            alert("Student has been successfully registered");
            window.location.href = "../Index.jsp";
        </script>

        <%} else {%>
        <script>
            alert("Operation failed, please try again");
            window.location.href = "../Index.jsp";
        </script>
        <%}
        } else {%>
        <script>
            alert("Already Sign up");
            window.location.href = "../Index.jsp";
        </script>

        <%}
        } else {%>
        <script>
            alert("Password Error");
            window.location.href = "../Index.jsp";
        </script>

        <%}
            }
        else if (action.equals("teacher")) {

                String regNo = request.getParameter("regNo");
                String fname = request.getParameter("firstname");
                String lname = request.getParameter("lastname");
                String sbjct = request.getParameter("subject");
                String password = request.getParameter("password");
                String con_password = request.getParameter("confirm_password");

                if (password.equals(con_password)) {
                    TeacherBeen tea = new TeacherBeen();

                    tea.setRegNo(regNo);
                    tea.setFirstName(fname);
                    tea.setLastName(lname);
                    tea.setSubject(sbjct);
                    tea.setPassword(password);

                    regVal = SignUp.signUpValidateTeacher(tea);

                    if (!regVal) {
                        IsValid = SignUp.signUpTeacher(tea);

                        if (IsValid) {
        %>
        <script>
            alert("Student has been successfully registered");
            window.location.href = "../Index.jsp";
        </script>

        <%} else {%>
        <script>
            alert("Operation failed, please try again");
            window.location.href = "../Index.jsp";
        </script>
        <%}
        } else {%>
        <script>
            alert("Already Sign up");
            window.location.href = "../Index.jsp";
        </script>

        <%}
        } else {%>
        <script>
            alert("Password Error");
            window.location.href = "../Index.jsp";
        </script>

        <% }
            }%>

    </body> 
</html>
