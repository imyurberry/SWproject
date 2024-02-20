/*
$(document).ready(function(){
	$(".exp").each(function(index, obj){
		console.log(obj)
		console.log(index)
	})
	$(".exp").click(function() {
		const expattr = $(".exp").attr("exp_idx")
		window.open("http://localhost:9090/Airbnb/ExpInfo?exp_idx="+expattr);
	})
})
*/
function show(a){
	a.css("display","block");
}
function close(b){
	b.css("display","none");
}
$(function() {
	$("#profile").click(function() {
		if($(this).parent().find(".profile_list").css("display") == "none"){
			show($(this).parent().find(".profile_list"));
		}
		else if($(this).parent().find(".profile_list").css("display") == "block"){
			close($(this).parent().find(".profile_list"));
		}
	});/*프로필 div 닫는 function*/
	$("#globe").click(function(){
		if($("#currency_language_").css("display") == "none"){
			show($("#currency_language_"));
			show($(".currency_language_background"));
			$("#body").css("overflow-y","hidden");
		}
	});/*통화, 화폐창 여는 function*/
	$(".close_div").click(function(){
		if($("#currency_language_").css("display") == "block"){
			close($("#currency_language_"));
			close($(".currency_language_background"));
			$("#body").css("overflow-y","scroll");
		}
	});/*통화, 화폐창을 닫는 function*/
	$(".currency_language_background").click(function(){
		close($("#currency_language_"));
		close($(".currency_language_background"));
		$("#body").css("overflow-y","scroll");
	});/*통화창을 열었을 때 회색 배경을 눌렀을 때 창이 닫히도록*/
	$(".currency_language_background").on('scroll mousewheel',function(event) {
		  event.preventDefault();
		  event.stopPropagation();
		  return false;
	});/*화면이 열렸을 때 스크롤 멈추기*/
	   // 회원가입팝업
   $(".profile_list_diff > div").click(function(){
      $("#joinmember_outer").css("display","block");
      $("#joinmember").css("display","block");
      $("body").css("overflow-y","hidden");
   });
   $(".jm_header > button").click(function(){
      $("#joinmember_outer").css("display","none");
      $("#joinmember").css("display","none");
      $("body").css("overflow-y","scroll");
   });	
   $(".join_user").click(function(){
	  show($("#join_user"));
   });
   $("#join_user > button").click(function(){
	  close($("#join_user")); 
   });
   $(".Logout").click(function(){
	    var result = confirm("정말 로그아웃 하시겠습니까?");
        if(!result){return false;}
        else{ location.href = "LswController?command=logout"}
   });
   
	$(".col_img").click(function() {
		$(location).attr("href","Collection.html");
	})
	
	$(".filter_icon_r").click(function() {
		$(location).attr("href","Filter.html");
	})
	
	$('.heart_empty').click(function(e) {
  		e.preventDefault(); 
  		e.stopPropagation();
	});
	
	$(".heart_empty").click(function() {
	   if($(this).css("fill") != "rgb(255, 56, 92)") {
		   let idx = $(".heart_empty").index($(this));
		   /*alert("idx : " + idx);*/
		   $("#heart_val").val(idx);
		   $("#wish_outer").css("display","block");
		   $("#wish").css("display","block");
		   $("body").css("overflow-y","hidden");
	   } else if($(this).css("fill") == "rgb(255, 56, 92)") {
		   $(this).css("fill","rgba(0, 0, 0, 0.5)");
   	   }
   	 })
   	$(".wish_header > button").click(function(){
		$("#wish_outer").css("display","none");
		$("#wish").css("display","none");
		$("body").css("overflow-y","scroll");
   	});
   	$("#wish_outer").click(function(){
	   	$("#wish_outer").css("display","none");
	   	$("#wish").css("display","none");
	   	$("body").css("overflow-y","scroll");
   	});
   
   	$(".wish_content1").click(function() {
	  	let idx = $("#heart_val").val();
	   	$("#wish_outer").css("display","none");
	  	$("#wish").css("display","none");
	   	$("body").css("overflow-y","scroll");
	   	$(".heart_empty").eq(idx).css("fill", "#FF385C");
	})
	
	$("#mv").click(function() {
		$("#more_experience").css("display","block");
		$("#more_view").css("display","none");
		
		$("#cate5_expz").slick({
			slidesToShow: 6,
			slidesToScroll: 6,
			infinite: false,
			prevArrow: $("#cate5_point > #cate5_left"),
			nextArrow: $("#cate5_point > #cate5_right"),
		});
		
		$("#cate6_expz").slick({
			slidesToShow: 6,
			slidesToScroll: 6,
			infinite: false,
			prevArrow: $("#cate6_point > #cate6_left"),
			nextArrow: $("#cate6_point > #cate6_right"),
		});
	})
})