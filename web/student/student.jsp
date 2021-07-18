
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
                } catch (Exception e) {
                        response.sendRedirect("../Index.jsp");
                }
        %>
    </head>
    <body>
      <!-- *********************** Start Header Section ************************** -->
      <jsp:include page="../header.jsp"/>
    <!-- *********************** End Header Section ************************** -->
        
     <!-- *********************** Start Test Section ************************** -->

    <div class="test-section">
        <h1 class="test-h1">ABC Class</h1>
        <h2 class="test-h2">Science</h2>

        <div class="test-container">
            <div class="test-col">
                <div class="box">
                    <div class="test-header">
                        <h1 class="test-header-h1">Test 01</h1>
                        <h3 class="test-header-h3">Graded</h3>
                    </div>
                    <div class="box-body">
                        <a href="#">Ragister for a class</a>
                        <a href="#">Create a test</a>
                        <a href="#">Evaluate test</a>
                        <a href="#">View Student Proformence</a>
                    </div>
                    <div class="box-footer">
                        <div class="box-btn">
                            <a href="#">Start Test</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="test-col">
                <div class="box">
                    <div class="test-header">
                        <h1 class="test-header-h1">Test 01</h1>
                        <h3 class="test-header-h3">Graded</h3>
                    </div>
                    <div class="box-body">
                        <a href="#">Ragister for a class</a>
                        <a href="#">Create a test</a>
                        <a href="#">Evaluate test</a>
                        <a href="#">View Student Proformence</a>
                    </div>
                    <div class="box-footer">
                        <div class="box-btn">
                            <a href="#">Start Test</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="test-col">
                <div class="box">
                    <div class="test-header">
                        <h1 class="test-header-h1">Test 01</h1>
                        <h3 class="test-header-h3">Graded</h3>
                    </div>
                    <div class="box-body">
                        <a href="#">Ragister for a class</a>
                        <a href="#">Create a test</a>
                        <a href="#">Evaluate test</a>
                        <a href="#">View Student Proformence</a>
                    </div>
                    <div class="box-footer">
                        <div class="box-btn">
                            <a href="#">Start Test</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="test-col">
                <div class="box">
                    <div class="test-header">
                        <h1 class="test-header-h1">Test 01</h1>
                        <h3 class="test-header-h3">Graded</h3>
                    </div>
                    <div class="box-body">
                        <a href="#">Ragister for a class</a>
                        <a href="#">Create a test</a>
                        <a href="#">Evaluate test</a>
                        <a href="#">View Student Proformence</a>
                    </div>
                    <div class="box-footer">
                        <div class="box-btn">
                            <a href="#">Start Test</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="test-col">
                <div class="box">
                    <div class="test-header">
                        <h1 class="test-header-h1">Test 01</h1>
                        <h3 class="test-header-h3">Graded</h3>
                    </div>
                    <div class="box-body">
                        <a href="#">Ragister for a class</a>
                        <a href="#">Create a test</a>
                        <a href="#">Evaluate test</a>
                        <a href="#">View Student Proformence</a>
                    </div>
                    <div class="box-footer">
                        <div class="box-btn">
                            <a href="#">Start Test</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="test-col">
                <div class="box">
                    <div class="test-header">
                        <h1 class="test-header-h1">Test 01</h1>
                        <h3 class="test-header-h3">Graded</h3>
                    </div>
                    <div class="box-body">
                        <a href="#">Ragister for a class</a>
                        <a href="#">Create a test</a>
                        <a href="#">Evaluate test</a>
                        <a href="#">View Student Proformence</a>
                    </div>
                    <div class="box-footer">
                        <div class="box-btn">
                            <a href="#">Start Test</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="test-col">
                <div class="box">
                    <div class="test-header">
                        <h1 class="test-header-h1">Test 01</h1>
                        <h3 class="test-header-h3">Graded</h3>
                    </div>
                    <div class="box-body">
                        <a href="#">Ragister for a class</a>
                        <a href="#">Create a test</a>
                        <a href="#">Evaluate test</a>
                        <a href="#">View Student Proformence</a>
                    </div>
                    <div class="box-footer">
                        <div class="box-btn">
                            <a href="#">Start Test</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- *********************** End box Section ************************** -->


    
            <!-- *********************** Start Footer Section ************************** -->

            <jsp:include page="../footer.html"/>
            <!-- *********************** End Footer Section ************************** -->

    </body>
</html>
