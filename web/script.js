/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 $(document).ready(function(){
 $(window).scroll(function(){
 var scroll = $(window).scrollTop();
 if (scroll > 50) {
 $(".first").css("background" , "#202020");
 }
 
 else{
 $(".first").css("background" , "none");  	
 }
 });
 });
 
 $(function() {
 $(window).scroll(function () {
 var myNav = document.getElementById('navbar');
 window.onscroll = function () {
 if (document.body.scrollTop >= 200) {
 myNav.classList.add("nav-colored");
 myNav.classList.remove("nav-transparent");
 } else {
 myNav.classList.add("nav-transparent");
 myNav.classList.remove("nav-colored");
 }
 };
 });
 });
 
 
 */


$(function() {
$(window).scroll(function () {
var myNav = document.getElementById('navbar');
        window.onscroll = function () {
        if (document.body.scrollTop >= 50) {
        myNav.classList.add("nav-colored");
                myNav.classList.remove("nav-transparent");
        } else {
        myNav.classList.add("nav-transparent");
                myNav.classList.remove("nav-colored");
        }
        });
});
}




