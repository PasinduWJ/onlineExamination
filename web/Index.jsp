
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/7eefacbee9.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Yesteryear&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Rochester&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <title>Exam</title>
    </head>
    <body>
        <!-- *********************** Start Header Section ************************** -->
        <header>
            <nav>
                <h2 class="logo">Online exam</h2>
                <ul class="nav-menu">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><i class="fas fa-search search"></i></li>
                </ul>
            </nav>
            <h2 class="header-title-1">Success Your Life</h2>
            <h1 class="header-title-2">Learnning System</h1>
        </header>
        <!-- *********************** End Header Section ************************** -->

        <!-- *********************** Start box Section ************************** -->
        <div class="box-section">
            <div class="box">
                <div class="box-header-stu"></div>
                <div class="box-body">
                    <h1 class="box-body-h1">For Student</h1>
                    <a href="#">Ragister for a class</a>
                    <a href="#">Start a test</a>
                    <a href="#">View results</a>
                </div>
                <div class="box-footer">
                    <div class="box-btn">
                        <a href="#" id="button-stu-sign">SignUp</a>
                    </div>
                    <div class="box-btn">
                        <a href="#" id="button-stu-log">LogIn</a>
                    </div>
                </div>
            </div>
            <div class="box">
                <div class="box-header-tea"></div>
                <div class="box-body">
                    <h1 class="box-body-h1">For Teacher</h1>
                    <a href="#">Ragister for a class</a>
                    <a href="#">Create a test</a>
                    <a href="#">Evaluate test</a>
                    <a href="#">View Student Proformence</a>
                </div>
                <div class="box-footer">
                    <div class="box-btn">
                        <a href="#" id="button-tea-sign">SignUp</a>
                    </div>
                    <div class="box-btn">
                        <a href="#" id="button-tea-log">LogIn</a>
                    </div>
                </div>
            </div>

        </div>
        <!-- *********************** End box Section ************************** -->



        <!-- *********************** Start Footer Section ************************** -->
        <jsp:include page="footer.html"/>
      
        <!-- *********************** End Footer Section ************************** -->
        <jsp:include page="login/LogInPopStudent.jsp"/>
        <jsp:include page="login/LogInPopTeacher.jsp"/>
        <jsp:include page="signup/SignUpPopStudent.jsp"/>
        <jsp:include page="signup/SignUpPopTeacher.jsp"/>
        <script src="js/script.js"></script>
        
    </body>

</html>