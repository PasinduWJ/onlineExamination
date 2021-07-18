
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
        <link rel="stylesheet" href="css/style.css">
        <title>Exam</title>
    </head>
    <body>
        <div class="bg-modal-SignUp-tea">
            <div class="modal-content-signup">
                <div class="close-signup-tea">+</div>
                <i class="fas fa-user-circle"></i>
                <form action="signup/SignUpVal.jsp" class="form-pop">
                    <input type="text" required placeholder="Reg No:" name="regNo">
                    <input type="text" required placeholder="First Name: " name="firstname">
                    <input type="text" placeholder="Last Name:" name="lastname">
                    <input type="text" required placeholder="Department:" name="subject">
                    <input type="text" required placeholder="Password:" name="password">
                    <input type="text" required placeholder="Confirm Password:" name="confirm_password">
                    <div class="sub-button">
                        <button class="sub-btn" type="submit" name="signer" value="teacher">Sign Up</button>
                    </div>

                </form>
            </div>
        </div>
        <script src="js/script.js"></script>
    </body>
</html>
