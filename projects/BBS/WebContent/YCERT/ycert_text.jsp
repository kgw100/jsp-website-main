<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../css/hp_text_ani.css" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

    <title>
      YCERT에 가입하신 것을 축하드립니다.
    </title>
  </head>
  <body onLoad="setTimeout('next()',2200)">
    <!--2초후 이동 -->
    <div class="text">
  <p class="you">You're &nbsp;</p>
  <p>
  <span class="word stranger">STRANGER</span><span></span>
    <span class="word ycert">YCERT</span>
  </p>
</div>
<script type="text/javascript">

function next()
{
  location="y_main.jsp";
}
var words = document.getElementsByClassName('word');
var wordArray = [];
var currentWord = 0;

words[currentWord].style.opacity = 1;
for (var i = 0; i < words.length; i++) {
splitLetters(words[i]);
}

function changeWord() {
var cw = wordArray[currentWord];
var nw = currentWord == words.length-1 ? wordArray[0] : wordArray[currentWord+1];
for (var i = 0; i < cw.length; i++) {
  animateLetterOut(cw, i);
}

for (var i = 0; i < nw.length; i++) {
  nw[i].className = 'letter behind';
  nw[0].parentElement.style.opacity = 1;
  animateLetterIn(nw, i);
}

currentWord = (currentWord == wordArray.length-1) ? 0 : currentWord+1;
}

function animateLetterOut(cw, i) {
setTimeout(function() {
  cw[i].className = 'letter out';
}, i*80);
}

function animateLetterIn(nw, i) {
setTimeout(function() {
  nw[i].className = 'letter in';
}, 340+(i*80));
}

function splitLetters(word) {
var content = word.innerHTML;
word.innerHTML = '';
var letters = [];
for (var i = 0; i < content.length; i++) {
  var letter = document.createElement('span');
  letter.className = 'letter';
  letter.innerHTML = content.charAt(i);
  word.appendChild(letter);
  letters.push(letter);
}

wordArray.push(letters);
}
setTimeout(function() {
  // setInterval(changeWord, 4500); //반복
   changeWord();
}, 1200);


</script>

  </body>
</html>
