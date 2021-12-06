// JavaScript Document

$(document).ready(function(){
  
   $(".category").mouseover(function(){
	$('#category-box').addClass("active");
	$('#category-box').removeClass("not_active");
   });
	$('.menu').mouseout(function(){
	$('#category-box').addClass("not_active");
	$('#category-box').removeClass("active");
   });
});