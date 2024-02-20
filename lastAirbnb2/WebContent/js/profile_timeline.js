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
	$("section > div:nth-child(3) > button:nth-child(2)").click(function(){
		$("section > div:nth-child(3) > button:nth-child(2)").css("display","none");
		$("section > div:nth-child(3) > button:nth-child(1)").css("display","block");
	});
	$("section > div:nth-child(3) > button:nth-child(1)").click(function(){
		$("section > div:nth-child(3) > button:nth-child(2)").css("display","block");
		$("section > div:nth-child(3) > button:nth-child(1)").css("display","none");
	});
	$(".like_").click(function(){
		countLike = $(this).parent().parent().find("div:nth-child(1)").find("span").text();
		countLike = countLike.replaceAll("[^0-9]", "");
		if($(this).find("div").find(".like_svg_filled").css("display") == "none"){
			show($(this).find("div").find(".like_svg_filled"));
		}
		else if($(this).find("div").find(".like_svg_filled").css("display") == "block"){
			close($(this).find("div").find(".like_svg_filled"));
		}
		
	});/*좋아요 누르기*/
	$("#timeline_top > div:nth-child(3) > div:nth-child(1)").click(function(){
		if($(".new_post").css("display") == "none"){
			show($(".new_post"));
			show($(".new_post_background"));
			$("#body").css("overflow-y","hidden");
		}
	});/*게시글 작성하기*/
	$(".close_div1").click(function(){
		close($(".new_post"));
		close($(".new_post_background"));
		$("#body").css("overflow-y","scroll");
	});
	$(".new_post_background").click(function(){
		close($(".new_post"));
		close($(".new_post_background"));
		$("#body").css("overflow-y", "scroll");	
	});
	$("#timeline_top > div:nth-child(1) > div").click(function(){
		show($(".new_post"));
		show($(".new_post_background"));
		$("#body").css("overflow-y","hidden");
	});
	/*$(".following_button_ > button:nth-child(1)").click(function(){
		show($(this).parent().find("button:nth-child(2)"));
		close($(this).parent().find("button:nth-child(1)"));
	});
	$(".following_button_ > button:nth-child(2)").click(function(){
		close($(this).parent().find("button:nth-child(2)"));
		show($(this).parent().find("button:nth-child(1)"));
	});*/
	$("section > div:nth-child(3) > button:nth-child(3)").click(function(){
		location.href = 'SesController?command=message';
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
    $(".comment_").click(function(){
	  $(this).parent().parent().find(".see_more_div").css("display","block");
   });
   $(".hide_comment_div").click(function(){
	  $(this).parent().css("display","none"); 
   });
   $(".see_more_but").click(function(){
	  $(this).parent().parent().find(".see_more_div").css("display","block"); 
   });
   $("#follower_").click(function(){
	  show($(".follower_list")); 
	  close($(".hide_date"));
   });
   $("#close_follower_list").click(function(){
	  close($(".follower_list")); 
   	  $(".hide_date").css("display","inline-block");
   });
   $("#following_").click(function(){
	  show($(".following_list")); 
   	  close($(".hide_date"));
   });
   $("#close_following_list").click(function(){
	  close($(".following_list")); 
  	  $(".hide_date").css("display","inline-block");
   });
});





