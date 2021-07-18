
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <div>
        <h2>
            <span>QNo.</span>
            <span>Question</span>

        </h2>
    </div>
    <hr>
    <div>
        <form action="#">
            <input type="checkbox" id="Answer01" name="Answer01" value="Checked1">
            <label for="vehicle1">Answer 01</label><br><br>
            <input type="checkbox" id="Answer02" name="Answer02" value="Checked2">
            <label for="vehicle2">Answer 02</label><br><br>
            <input type="checkbox" id="Answer03" name="Answer03" value="Checked3">
            <label for="Answer03">Answer03</label><br><br>
            <input type="checkbox" id="Answer04" name="Answer04" value="Checked4">
            <label for="Answer04">Answer04</label><br><br>
            <input type="submit" id="SubmitAnswer" value="Submit">
        </form>
    </div>
    <hr>
    <div>
        <button id="nextAndBack" type="button"> << Back</button>
        <button id="nextAndBack" type="button">Next >></button>
    </div>

</body>
</html>