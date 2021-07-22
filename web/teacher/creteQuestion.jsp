
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="bg-create-qestion">
            <div class="teacher-q-container">
                <div class="close-create-q">+</div>
                <br>
                <div class="scroll-box">
                    
                    <div id = container >
                    <section id="1" >
                        <!--newDiv-->
                        <div class="test-header-teach-q" id="qus-no-div1">
                            <h1 class="test-header-h1" id="qus-no-h11" >Question 1</h1>
                            
                        </div>
                        <!--newDiv2-->
                        <div class="teach-q-body" id="teacher-question-body">
                            <!--newDiv3-->
                            <div class="teach-q-w" id="question-write-lable">
                                <label >Write Your Question.</label>
                            </div>
                            <!--newDiv4-->
                            <div class="teach-question">
                                <textarea  name="Q1" rows="4" cols="68"></textarea>
                            </div>
                            <!--newDiv5-->
                            <div class="teach-ans">
                                <label id="answer1-label1">Answer 1</label>
                                <textarea  name="A11" rows="2" cols="60"></textarea>
                                <input type="checkbox" name="C11">
                            </div>
                            <!--newDiv6-->
                            <div class="teach-ans">
                                <label id="answer2-label1">Answer 2</label>
                                <textarea  name="A21" rows="2" cols="60"></textarea>
                                <input type="checkbox" name="C21">
                            </div>
                            <!--newDiv7-->
                            <div class="teach-ans">
                                <label id="answer3-label1">Answer 3</label>
                                <textarea  name="A31" rows="2" cols="60"></textarea>
                                <input type="checkbox" name="C31">
                            </div>
                            <!--newDiv8-->
                            <div class="teach-ans">
                                <label id="answer4-label1">Answer 4</label>
                                <textarea  name="A41" rows="2" cols="60"> </textarea>
                                <input type="checkbox" name="C41">
                            </div>
                            <!--</form>-->
                        </div>
                    </section>
                    </div>
                    <div id="demo"></div>


                </div>
                <div class="teach-q-footer">
                    <div class="box-footer">
                        <div class="box-btn">
                            <button class="q-btn" type="button" id="newQuestion" >Create New Question</button>
                        </div>
                        <div class="box-btn">
                            <button class="q-btn" type="submit" id="remov" >Save Quiz</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </body>
</html>
