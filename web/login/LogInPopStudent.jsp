
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
        <div class="bg-modal-stu">
            <div class="modal-content">
                <div class="close-stu">+</div>
                <i class="fas fa-user-circle"></i>
                <form action="login/LogInVal.jsp" class="form-pop" method="post">
                    <input type="text" name="regNo" required maxlength="10" placeholder="Reg No:">
                    <input type="password" name="password" required maxlength="10" placeholder="Password">
                    <div class="sub-button">
                        <button class="sub-btn" name="logger" value="student" type="submit">LogIn</button>
                    </div>

                </form>
            </div>
        </div>

        <script type="text/javascript" src="../js/script.js"></script>
    </body>
</html>
