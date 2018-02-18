
// Tabs
function openCity(evt, cityName) {
var i;
var x = document.getElementsByClassName("city");
for (i = 0; i < x.length; i++) {
   x[i].style.display = "none";
}
var activebtn = document.getElementsByClassName("testbtn");
for (i = 0; i < x.length; i++) {
    activebtn[i].className = activebtn[i].className.replace(" w3-theme-dark", "");
}
document.getElementById(cityName).style.display = "block";
evt.currentTarget.className += " w3-theme-dark";
}

var mybtn = document.getElementsByClassName("testbtn")[0];
mybtn.click();


// Slideshows
var slideIndex = 1;

function plusDivs(n) {
slideIndex = slideIndex + n;
showDivs(slideIndex);
}

function showDivs(n) {
var x = document.getElementsByClassName("mySlides");
if (n > x.length) {slideIndex = 1}    
if (n < 1) {slideIndex = x.length} ;
for (i = 0; i < x.length; i++) {
   x[i].style.display = "none";  
}
x[slideIndex-1].style.display = "block";  
}

showDivs(1);

