function show(a){
	a.css("display","block");
}
function close(b){
	b.css("display","none");
}
$(function(){
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
   
	$("#mv_button").click(function(){
		$("#et_mv").css("display","inline");
		$("#mv_button").css("display","none");
	})
	
	$("#date_mv").click(function() {
		$('.container').addClass('modal-open1');
		$("body").css("overflow-y","hidden");
	})
	$("#date_more_view").click(function() {
		$('.container').addClass('modal-open1');
		$("body").css("overflow-y","hidden");
	})
	$("#back_page > div").click(function() {
		$("body").css("overflow-y","scroll");
		$('.container').removeClass('modal-open1');
	})
	
	// 사진 5개 모두 보기
	$("#iav_box").click(function() {
		$('.container').addClass('modal-open2');
		$("body").css("overflow-y","hidden");
	})
	$("#close").click(function() {
		$('.container').removeClass('modal-open2');
		$("body").css("overflow-y","scroll");
	})
	let imgNum = 1;
	$("#img_next").click(function() {
		imgNum++;
		if(imgNum >= 5) imgNum = 5;
		$(".img_num").text(imgNum);
	})
	$("#img_prev").click(function() {
		imgNum--;
		if(imgNum <= 1) imgNum = 1;
		$(".img_num").text(imgNum);
	})

	$(".select > .select_detail:nth-child(1)").click(function() {
		$("#select_res_date").css("display","block");
	})
	$("#select_res_date > .select > div:nth-child(4)").click(function() {
		$("#select_res_date").css("display","none");
	})
	
	//달력(플러그인)
	var currentDate = new Date();
    var nextMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 1);
                
     $(".datepicker").datepicker({
			minDate: 0,
	
    	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	    dayNamesMin: ['일','월','화','수','목','금','토'],
    	    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
    // 달력날짜 상단바에 표시	 
	onSelect:function( d ){
			var arr = d.split("/");
			$("#year").text(arr[0].trim());
			$("#month").text(arr[1].trim());
			$("#day").text(arr[2].trim());
			$(".select_detail:nth-child(1) > .detail_content").text(d);
		}
	
	
    });
    $(".datepicker2").datepicker({
	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		defaultDate: nextMonth, //다음달부터 시작
		
		//주말선택못하게하기
		/*beforeShowDay: function(date) {
                    var day = date.getDay();
                    // 주말 (토요일: 6, 일요일: 0)인 경우에는 선택할 수 없도록 설정
                    return [day !== 6 && day !== 0];
         },*/
		
		// 달력날짜 상단바에 표시// 달력날짜 상단바에 표시
		onSelect:function( d ){
			var arr = d.split("/");
			$("#year").text(arr[0].trim());
			$("#month").text(arr[1].trim());
			$("#day").text(arr[2].trim());
			$(".select_detail:nth-child(1) > .detail_content").text(d);
		}
		
	});
	
	$(".select > .select_detail:nth-child(2)").click(function() {
		$("#select_guest").css("display","block");
	})
	$("#select_guest > .select > div:nth-child(4)").click(function() {
		$("#select_guest").css("display","none");
	})
	
	// 인원수 +버튼
	$(".gc_plus").parent().click(function(){
		let current_member = Number($(".gc_count:nth-child(1) input").val())
							+ Number($(".gc_count:nth-child(2) input").val())
							+ Number($(".gc_count:nth-child(3) input").val());
		if(current_member == max_member) return;
		
		$(this).parent().find(".gc_num").val(Number($(this).parent().find(".gc_num").val()) + 1);
		$(this).parent().find(".gc_button:nth-child(1)").css("border","1px solid rgb(176, 176, 176)");
		$(this).parent().find(".gc_minus").css("color"," rgb(113, 113, 113)");
		
		if( Number($(this).parent().find(".gc_num").val())>=16 ){
			$(this).parent().find(".gc_num").val(16);
			$(this).parent().find(".gc_button:nth-child(3)").css("border","1px solid rgb(235, 235, 235)");
			$(this).parent().find(".gc_plus").css("color"," rgb(235, 235, 235)");
		}
		// 인원수대로 텍스트 변경
		let guestCnt = '게스트 ' + current_member +'명';
		$(".select_detail:nth-child(2) > .detail_content").text(guestCnt);
	});
	
	// 인원수 -버튼
	$(".gc_minus").parent().click(function(){
		let adultVal = Number($(".gc_count:nth-child(1) input").val());
		let kidVal = Number($(".gc_count:nth-child(2) input").val());
		let babyVal = Number($(".gc_count:nth-child(3) input").val());
		let current_member = adultVal + kidVal + babyVal;
		
		if(adultVal == 0) adultVal = 0;
		if(kidVal == 0) kidVal = 0;
		if(babyVal == 0) babyVal = 0;
		
		$(this).parent().find(".gc_num").val(Number($(this).parent().find(".gc_num").val()) - 1);
		if(adultVal > 0) {
			$(this).parent().find(".gc_button:nth-child(3)").css("border","1px solid rgb(176, 176, 176)");
			$(this).parent().find(".gc_plus").css("color","rgb(113, 113, 113)");
		} else {
			$(this).parent().find(".gc_button:nth-child(3)").css("border","1px solid rgb(221, 221, 221)");
			$(this).parent().find(".gc_plus").css("color","rgb(221, 221, 221)");
		}
		
		if( Number($(this).parent().find(".gc_num").val())>=16 ){
			$(this).parent().find(".gc_num").val(16);
			$(this).parent().find(".gc_button:nth-child(3)").css("border","1px solid rgb(235, 235, 235)");
			$(this).parent().find(".gc_plus").css("color"," rgb(235, 235, 235)");
		}
		// 인원수대로 텍스트 변경
		let guestCnt = '게스트 ' + current_member +'명';
		$(".select_detail:nth-child(2) > .detail_content").text(guestCnt);
	});
	
	$("#report").click(function() {
		$("#report_body").css("display","flex");
		$("body").css("overflow-y","hidden");
	})
	$("#report_top > div:nth-child(1)").click(function() {
		$("#report_body").css("display","none");
		$("body").css("overflow-y","scroll");
	})
	
	/*$(".res_button1").click(function() {
		$(location).attr("href","Payment.html");
	})
	$(".rs_button").click(function() {
		$(location).attr("href","Payment.html");
	})
	
	$(".sbt_top > div:nth-child(2)").click(function(){
		$(location).attr("href","Payment.html");
	})*/
	
	$(".rc_content > div:nth-child(2)").click(function() {
		if($(this).find('div').css('display') == "none") {
			$(this).find('div').css("display", "block")
		}else{
			$(this).find('div').css("display","none")
		}
	})
	
	$(".rv_more_view").click(function() {
		$(this).parent().find(".review_txt").css("display","block");
	})
	$('a.rv_mv').click(function(e) {
  		e.preventDefault(); 
  		$(this).parent().hide();  
	});
	
	$("#mv_button").click(function() {
		$(this).parent().find("span").css("display","block");
	})
	$('#mv_button > b').click(function(e) {
  		e.preventDefault(); 
  		$(this).parent().hide();  
	});
	
	// 공유하기
	$("#exp_etc > div:nth-child(4), .share").click(function(){
		$("#share_outer").css("display","block");
		$("#share").css("display","block");
		$("body").css("overflow-y","hidden");
	});
	$(".share_header>button").click(function(){
		$("#share_outer").css("display","none");
		$("#share").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	$("#share_outer").click(function(){
		$("#share_outer").css("display","none");
		$("#share").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	$(".side_date_popbtn>div:nth-child(1)").click(function(){
		$(".side_date_popbtn>div:nth-child(1)").css("border","2.5px solid black");
		$(".side_date_popbtn>div:nth-child(2)").css("border","0.7px solid rgb(113, 113, 113)");
	});
	$(".side_date_popbtn>div:nth-child(2)").click(function(){
		$(".side_date_popbtn>div:nth-child(2)").css("border","2.5px solid black");
		$(".side_date_popbtn>div:nth-child(1)").css("border","0.7px solid rgb(113, 113, 113)");
	});
	// 닫기버튼
	$(".side_date_pop3-1>div").click(function(){
		$(".side_date_pop").css("display","none");
	});
	
   $(".heart").click(function() {
	   if($(this).find("svg").css("fill") != "rgb(255, 56, 92)") {
		   let idx = $(".heart").index($(this));
		   /*alert("idx : " + idx);*/
		   $("#heart_val").val(idx);
		   $("#wish_outer").css("display","block");
		   $("#wish").css("display","block");
		   $("body").css("overflow-y","hidden");
	   } else if($(this).find("svg").css("fill") == "rgb(255, 56, 92)") {
		   if($("#heart_val").val() == "0") {
			   $(this).find("svg").css("fill","none");
		   } else{
			   $(this).find("svg").css("fill","rgba(0, 0, 0, 0.5)");
		   }
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
	   $(".heart").eq(idx).find("svg").css("fill", "#FF385C");
   })
   
   // 위시 카테고리 만들기
   $(".wish_content2").click(function(){
	  $("#wish_outer").css("display","none");
      $("#wish").css("display","none");

	  $("#make_wish_back").css("display","block");
      $("#make_wish").css("display","block");
      $("body").css("overflow-y","hidden");
	});
	$(".make_wish_header").click(function() {
		$("#make_wish_back").css("display","none");
      $("#make_wish").css("display","none");
      $("body").css("overflow-y","scroll");
	})
  
  /*모든리뷰버튼 클릭*/
    $("#rv_all_view").click(function(){
      $("#bg_popup").css("display", "block");
      $("#pop_review").css("display", "block");
      $("body").css("overflow-y","hidden");
   
   });
   // 후기x버튼 눌렀을때 닫기
   $(".pop_header>button").click(function(){
      $("#bg_popup").css("display", "none");
      $("#pop_review").css("display", "none");
      $("body").css("overflow-y","scroll");
      //최신순 버튼초기화
      $(".pop_section2-1-1").css("border","1px solid rgb(221, 221, 221)");
      $(".pop_section_sort").css("display","none");
   });
   // 후기 팝업 바깥여백눌렀을때 창닫기
   $("#bg_popup").click(function(){
      $("#bg_popup").css("display", "none");
      $("#pop_review").css("display", "none");
      $("body").css("overflow-y","scroll");
      // 최신순버튼초기화
      $(".pop_section2-1-1").css("border","1px solid rgb(221, 221, 221)");
      $(".pop_section_sort").css("display","none");
   });
   //최신순버튼눌렀을때
   $(".pop_section2-1-1").click(function(e){//
      if($(".pop_section_sort").css("display") == "none"){
         $(this).css("border", "2px solid black");
         $(".pop_section_sort").css("display" , "block");
      }else if($(".pop_section_sort").css("display") == "block"){
         $(".pop_section_sort").css("display" , "none");
         $(this).css("border","1px solid grey");
      }
   });
   
   // !리뷰창눌렀을때 최신순버튼숨기기
   $("pop_section2-1-1").on("click",function(event){
      event.preventDefault();
      event.stopPropagation();
      return false;
   });
   $("#pop_review").click(function(){
      if($(".pop_section_sort").css("display") == "block"){
         $(".pop_section_sort").css("display" , "none");
         $(".pop_section2-1-1").css("border","1px solid grey");
      }
   });
   
   
   // 후기제목 밑 후기버튼 클릭
    $(".sp2").click(function(){
      $("#bg_popup").css("display", "block");
      $("#pop_review").css("display", "block");
      $("body").css("overflow-y","hidden");
   });
   // 후기글 '더보기'눌렀을때 버튼클릭
    $(".ri2-3>span").click(function(){
      $("#bg_popup").css("display", "block");
      $("#pop_review").css("display", "block");
      $("body").css("overflow-y","hidden");
   });
});        	