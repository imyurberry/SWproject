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
	$(".cancel_button1").click(function(){
			close($(this).parent().parent().find("form"));
			close($(this).parent().parent().find(".section1-3"));
			show($(".edit_button1"));
			close($(".cancel_button1"));
	});
	$(".edit_button1").click(function(){
			show($(this).parent().parent().find("form"));
			show($(this).parent().parent().find(".section1-3"));
			close($(".edit_button1"));
			show($(".cancel_button1"));
	});
	$(".cancel_button2").click(function(){
			close($(this).parent().parent().find("form"));
			close($(this).parent().parent().find(".section1-3"));
			show($(".edit_button2"));
			close($(".cancel_button2"));
	});
	$(".edit_button2").click(function(){
			show($(this).parent().parent().find("form"));
			show($(this).parent().parent().find(".section1-3"));
			close($(".edit_button2"));
			show($(".cancel_button2"));
	});
	$(".cancel_button3").click(function(){
			close($(this).parent().parent().find(".section_content1-3"));
			close($(this).parent().parent().find(".section_content1-4"));
			show($(".edit_button3"));
			close($(".cancel_button3"));
			close($(".edit_phone_num"));
	});
	$(".edit_button3").click(function(){
			show($(this).parent().parent().find(".section_content1-3"));
			show($(this).parent().parent().find(".section_content1-4"));
			close($(".edit_button3"));
			show($(".cancel_button3"));
	});
	$(".cancel_button4").click(function(){
			close($(this).parent().parent().find(".section_content1-5"));
			close($(this).parent().parent().find(".section1-3"));
			show($(".edit_button4"));
			close($(".cancel_button4"));
	});
	$(".edit_button4").click(function(){
			show($(this).parent().parent().find(".section_content1-5"));
			show($(this).parent().parent().find(".section1-3"));
			close($(".edit_button4"));
			show($(".cancel_button4"));
	});
	$(".cancel_button5").click(function(){
			close($(this).parent().parent().find("#form3"));
			close($(this).parent().parent().find(".section1-3"));
			show($(".edit_button5"));
			close($(".cancel_button5"));
	});
	$(".edit_button5").click(function(){
			show($(this).parent().parent().find("#form3"));
			show($(this).parent().parent().find(".section1-3"));
			close($(".edit_button5"));
			show($(".cancel_button5"));
	});
	$(".section_content1-3 > button").click(function(){
			show($(".edit_phone_num"));
			close($(".section_content1-3"));
	});
	$(".submit").click(function(){
			alert("수정되었습니다.");
			close($(".edit_phone_num"));
			show($(".section_content1-3"));
	});
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
        else{ location.href = "Controller?command=logout&url=privacy.jsp"}
   });
});