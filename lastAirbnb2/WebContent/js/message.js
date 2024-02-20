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
	});
	$("#mess_svg").click(function(){
		if($("#message_filter").css("display") == "none"){
			show($("#message_filter"));
			$("#mess_svg").css("border","2px solid black");
		} else if($("#message_filter").css("display") == "block"){
			close($("#message_filter"));
			$("#mess_svg").css("border","none");		
		}
	});
	$(".emoji_").click(function(){
		if($("#emoji_list").css("display") == "none"){
			show($("#emoji_list"));
		} else if($("#emoji_list").css("display") == "block"){
			close($("#emoji_list"));
		}
	});
	$(".see_more").click(function(){
		if($(this).parent().parent().find(".see_more_content").css("display") == "none"){
			show($(this).parent().parent().find(".see_more_content"));
		}else if($(this).parent().parent().find(".see_more_content").css("display") == "block"){
			close($(this).parent().parent().find(".see_more_content"));
		}
	});
	$(".delete_chat_button").click(function(){
		$(this).parent().parent().parent().css("display","none");
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
        else{ location.href = "Controller?command=logout?url=profile_timeline.jsp"}
   });
});







