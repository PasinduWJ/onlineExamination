document.getElementById('button-stu-log').addEventListener('click',
function(){
    document.querySelector('.bg-modal-stu').style.display = 'flex';
});

document.getElementById('button-tea-log').addEventListener('click',
function(){
    document.querySelector('.bg-modal-tea').style.display = 'flex';
});

document.querySelector('.close-stu').addEventListener('click',
function(){
    document.querySelector('.bg-modal-stu').style.display = 'none';
});

document.querySelector('.close-tea').addEventListener('click',
function(){
    document.querySelector('.bg-modal-tea').style.display = 'none';
});



document.getElementById('button-stu-sign').addEventListener('click',
function(){
    document.querySelector('.bg-modal-SignUp-stu').style.display = 'flex';
});

document.getElementById('button-tea-sign').addEventListener('click',
function(){
    document.querySelector('.bg-modal-SignUp-tea').style.display = 'flex';
});

document.querySelector('.close-signup-stu').addEventListener('click',
function(){
    document.querySelector('.bg-modal-SignUp-stu').style.display = 'none';
});

document.querySelector('.close-signup-tea').addEventListener('click',
function(){
    document.querySelector('.bg-modal-SignUp-tea').style.display = 'none';
});

//
//function createQuiz(){
//    document.querySelector('.bg-create-qestion').style.display = 'flex';
//};
//
//document.querySelector('.close-create-q').addEventListener('click',
//function(){
//    document.querySelector('.bg-create-qestion').style.display = 'none';
//});