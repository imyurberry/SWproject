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
        else{ location.href = "lmyController?command=logout&url=Main2"}
   });
	// 필터버튼클릭
	$("#menu_btn > button").click(function(){
		$("#filter_outer").css("display","block");
		$("#filter").css("display","block");
		$("body").css("overflow-y","hidden");
	});
	// x눌렀을때 닫기
	$(".filter_header>button").click(function(){
		$("#filter_outer").css("display","none");
		$("#filter").css("display","none");
		$("body").css("overflow-y","scroll");
		//모든버튼초기화
		$(".filter_content4-1").css({"background-color":"none","border":"1px solid rgb(221, 221, 221)"});
		$(".filter_content5-1").css({"background-color":"none","border":"1px solid rgb(221, 221, 221)"});
	});
	// 필터 편의시설더보기
	$(".filter_content6-2>span").click(function(){
		$(".fil_pop").css("display","block");
		$(".filter_content6-3").css("display","block");
		$(".filter_content6-2").css("display","none");
	});
	// 편의시설접기
	$(".filter_content6-2>span").click(function(){
		$(".fil_pop").css("display","block");
		$(".filter_content6-3").css("display","block");
		$(".filter_content6-2").css("display","none");
	});
	$(".filter_content6-3>span").click(function(){
		$(".fil_pop").css("display","none");
		$(".filter_content6-3").css("display","none");
		$(".filter_content6-2").css("display","block");
	});
	$(".filter_content6-3>span").click(function(){
		$(".fil_pop").css("display","none");
		$(".filter_content6-3").css("display","none");
		$(".filter_content6-2").css("display","block");
	});
	//반려동물 세부창
	$(".hop_content6-3").click(function(){
		$("#animal_outer").css("display","block");
		$("#animal").css("display","block");
		$("body").css("overflow-y","hidden");
	});
/*	$("#animal_outer").click(function(){
		$("#animal_outer").css("display","none");
		$("#animal").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	$(".animal_header>button").click(function(){
		$("#animal_outer").css("display","none");
		$("#animal").css("display","none");
		$("body").css("overflow-y","scroll");
	});*/

	// 편의시설 선택(체크표시)
	$(".fil_label").click(function(){
		if ($(this).find('svg').css("display")=="none"){
			$(this).find('.fil_check').css("background-color","black");
			$(this).find('svg').css("display","block");
		}else{
			$(this).find('.fil_check').css("background-color","white");
			$(this).find('svg').css("display","none");
		}
	});
	
	// 카테고리 클릭하면 바뀌기
	$(".w hover").click(function(){
		$(this).css("opacity", "1");
	});
	//게스트 배경색변경
	$(".filter_content4-1").click(function(){
		if ($(this).css("border")=="1px solid rgb(221, 221, 221)"){
			$(this).css({"background-color":"rgb(250, 250, 250)","border":"2px solid black"});
		}else{
			$(this).css({"background-color":"none","border":"1px solid rgb(221, 221, 221)"});
		}
	});
	//집유형 선택 배경색변경
	$(".filter_content5-1").click(function(){
		if ($(this).css("border")=="1px solid rgb(221, 221, 221)"){
			$(this).css({"background-color":"rgb(250, 250, 250)","border":"2px solid black"});
		}else{
			$(this).css({"background-color":"none","border":"1px solid rgb(221, 221, 221)"});
		}
	});
	// 언어 더보기
	$(".filter_content6-4>span").click(function(){
		$(".fil_pop2").css("display","block");
		$(".filter_content6-5").css("display","block");
		$(".filter_content6-4").css("display","none");
	});
	// 언어시설접기
	$(".filter_content6-5>span").click(function(){
		$(".fil_pop2").css("display","none");
		$(".filter_content6-5").css("display","none");
		$(".filter_content6-4").css("display","block");
	});
	// 침실과 침대갯수
	$(".fil3_btns>button").click(function(){
		$(this).parent().find("button").css({"background-color":"white","color":"black","border":"1px solid rgb(221, 221, 221)"});
		$(this).css({"background-color":"black","color":"white"});
	});
	$(".fil3_btns2>button").click(function(){
		$(this).parent().find("button").css({"background-color":"white","color":"black","border":"1px solid rgb(221, 221, 221)"});
		$(this).css({"background-color":"black","color":"white"});
	});
	$(".fil3_btns3>button").click(function(){
		$(this).parent().find("button").css({"background-color":"white","color":"black","border":"1px solid rgb(221, 221, 221)"});
		$(this).css({"background-color":"black","color":"white"});
	});
	// 숙소유형선택
	$(".fil_btns>button").click(function(){
		$(this).parent().find("button").css({"background-color":"white","color":"black"});
		$(this).css({"background-color":"black","color":"white"});
	});
	// 상단바 버튼누르면 열리기
	$(".btns").click(function(){
		$("#center").css("display","none");
		$("#center2").css("display","flex");
		$("#header").css("border-bottom","none");
		$("#header2").css("display","block");
		$("#section").css("height" , "98px");
		//$("#section").css("margin-left" , "-100px");
		//$("#section").css("margin")
		$("#menu_btn > button ").css("margin-left","62px");
		
	});
	// header2 hover했을때 테두리둥글게,선없애기
	$(".head_content1").hover(function(){
		$(this).css({"background":"#DDDDDD","border-radius":"32px","border-right": "none"});
	},function(){
		$(this).css({"background":"transparent","border-right": "1px solid rgb(221, 221, 221)","border-radius":"0"});
	});
	$(".head_content2").hover(function(){
		$(".head_content1").css("border-right","none");
		$(this).css({"background":"#DDDDDD","border-radius":"32px","border-right": "none"});
	},function(){
		$(".head_content1").css("border-right","1px solid rgb(221, 221, 221)");
		$(this).css({"background":"transparent","border-right": "1px solid rgb(221, 221, 221)","border-radius":"0"});
	});
	$(".head_content3").hover(function(){
		$(".head_content2").css("border-right","none");
		$(this).css({"background":"#DDDDDD","border-radius":"32px","border-right": "none"});
	},function(){
		$(".head_content2").css("border-right","1px solid rgb(221, 221, 221)");
		$(this).css({"background":"transparent","border-right": "1px solid rgb(221, 221, 221)","border-radius":"0"});
	});
	$(".head_content4").hover(function(){
		$(".head_content3").css("border-right","none");
		$(this).css({"background":"#DDDDDD","border-radius":"32px"});
	},function(){
		$(".head_content3").css("border-right","1px solid rgb(221, 221, 221)");
		$(this).css({"background":"transparent"});
	});
	// 
	//  header2 클릭했을때 세부창
	$(".head_content1").click(function(){
		$("#head_pop1").css("display","flex");
	});
	$(".head_content2").click(function(){
		$("#head_pop2").css("display","block");
		
	});
	$(".head_content3").click(function(){
		$("#head_pop2").css("display","block");
	});
	$(".head_content4").click(function(){
		$("#head_pop4").css("display","block");
	});
	
	//날짜찌정 버튼
	$(".hpop_content1-1>div").click(function(){
		$(this).parent().find("div").css({"background-color":"white","color":"black","border":"1px solid rgb(221, 221, 221)"});
		$(this).css("border","1px solid black");
	});
	// +-1일 2일 등등
	$(".hpop_content3-2").click(function(){
		$(this).parent().find("div").css({"background-color":"white","color":"black","border":"1px solid rgb(221, 221, 221)"});
		$(this).css("border","1px solid black");
	});
	
	// 인원수+버튼
	$(".hop4_btn2").click(function(){
		$(this).parent().find(".hop4_input").val(Number($(this).parent().find(".hop4_input").val()) + 1);
		$(this).parent().find(".hop4_btn1").css("border","1px solid rgb(176, 176, 176)");
		$(this).parent().find(".hop4_btn1>svg").css("color"," rgb(113, 113, 113)");
		
		if( Number($(this).parent().find(".hop4_input").val())>=16 ){
			$(this).parent().find(".hop4_input").val(16);
			$(this).parent().find(".hop4_btn2").css("border","1px solid rgb(235, 235, 235)");
			$(this).parent().find(".hop4_btn2>svg").css("color"," rgb(235, 235, 235)");
		}
		// 인원수대로 텍스트 변경
		let adultVAL = $("#head_pop4>div:nth-child(1)>div:nth-child(2)>input").val();
		let kidVAL = $("#head_pop4>div:nth-child(2)>div:nth-child(2)>input").val();
		let babyVAL = $("#head_pop4>div:nth-child(3)>div:nth-child(2)>input").val();
		let petVAL = $("#head_pop4>div:nth-child(4)>div:nth-child(2)>input").val();
		let adult = '성인' + adultVAL +'명';
		//$(".head_content4>span:nth-child(2)").text(text + $(this).parent().find(".hop4_input").val() + '명');
		let kid = ',어린이' + kidVAL +'명';
		let baby =',유아' + babyVAL +'명';
		let pet = ',반려동물' + petVAL +'마리';
		if(adultVAL == 0) audlt = "";
		if(kidVAL == 0 ) kid = "";
		if(petVAL == 0 ) pet = "";
		if(babyVAL == 0 ) baby = "";
		if(adult == "" && kid == "" && pet == "" && baby == "") 	
			$(".head_content4 > span:nth-child(2)").html("게스트 추가");
		else{
			$(".head_content4 > span:nth-child(2)").html(adult + kid + baby + pet);
		}	
	});
	
	// 인원수-버튼
		$(".hop4_btn1").click(function(){
		 $(this).parent().find(".hop4_input").val(Number($(this).parent().find(".hop4_input").val()) - 1);
	
		if( Number($(this).parent().find(".hop4_input").val())<16 ){
			$(this).parent().find(".hop4_btn2").css("border","1px solid rgb(176, 176, 176)");
			$(this).parent().find(".hop4_btn2>svg").css("color"," rgb(113, 113, 113)");
		}
		if( Number($(this).parent().find(".hop4_input").val())<=0 ){
			$(this).parent().find(".hop4_input").val(0);
			$(this).parent().find(".hop4_btn1").css("border","1px solid rgb(235, 235, 235)");
			$(this).parent().find(".hop4_btn1>svg").css("color"," rgb(235, 235, 235)");
		}
		let adultVAL = $("#head_pop4>div:nth-child(1)>div:nth-child(2)>input").val();
		let kidVAL = $("#head_pop4>div:nth-child(2)>div:nth-child(2)>input").val();
		let babyVAL = $("#head_pop4>div:nth-child(3)>div:nth-child(2)>input").val();
		let petVAL = $("#head_pop4>div:nth-child(4)>div:nth-child(2)>input").val();
		let adult = '성인' + adultVAL +'명';
		//$(".head_content4>span:nth-child(2)").text(text + $(this).parent().find(".hop4_input").val() + '명');
		let kid = ',어린이' + kidVAL +'명';
		let baby =',유아' + babyVAL +'명';
		let pet = ',반려동물' + petVAL +'마리';
		if(adultVAL == 0) audlt = "";
		if(kidVAL == 0 ) kid = "";
		if(petVAL == 0 ) pet = "";
		if(babyVAL == 0 ) baby = "";
		if(adult == "" && kid == "" && pet == "" && baby == "") 	
			$(".head_content4 > span:nth-child(2)").html("게스트 추가");
		else{
			$(".head_content4 > span:nth-child(2)").html(adult + kid + baby + pet);
		}
	});
	// 필터 침실,침대,욕실 개수
	$(function() {
		$(".fil3_btns > button").click(function() {
			let txt = $(this).text();
			if(txt!="상관없음") 
				$("input[name='fil3_btns']").val(txt);
			else 
				$("input[name='fil3_btns']").val("0");
		});
		$(".fil3_btns2 > button").click(function() {
			let txt = $(this).text();
			if(txt!="상관없음") 
				$("input[name='fil3_btns2']").val(txt);
			else 
				$("input[name='fil3_btns2']").val("0");
		});
		$(".fil3_btns3 > button").click(function() {
			let txt = $(this).text();
			if(txt!="상관없음") {
				$("input[name='fil3_btns3']").val(txt);
			}else 
				$("input[name='fil3_btns3']").val("0");
		});
	});
	
	// 하트
	$(".heart_empty").click(function(e) {
		e.preventDefault(); 
  		e.stopPropagation();
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
   	 });
	// 위시선택하면 하트 채우기
	$(".wish_content1").click(function() {
	  	let idx = $("#heart_val").val();
	   	$("#wish_outer").css("display","none");
	  	$("#wish").css("display","none");
	   	$("body").css("overflow-y","scroll");
	   	$(".heart_empty").eq(idx).css("fill", "#FF385C");
	})
	//숙소 채험 등선택
	$("#center2>div").click(function(){
		$(this).parent().find("div").css("border-bottom","none");
		$(this).css("border-bottom","2px solid black");
	})
	// 위시버튼
	$("#content>a>div>button").click(function(){
		$("#wish_outer").css("display","block");
		$("#wish").css("display","block");
		$("body").css("overflow-y","hidden");
	});
	$(".wish_header>button").click(function(){
		$("#wish_outer").css("display","none");
		$("#wish").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	$("#wish_outer").click(function(){
		$("#wish_outer").css("display","none");
		$("#wish").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	// 위시만들기
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
   });
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
			//alert(dateval);s
			$(".head_content2>span:nth-child(2)").text(d);
		}
	
	
    });
    $(".datepicker2").datepicker({
	    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		defaultDate: nextMonth, //다음달부터 시작
		
		//주말선택못하게하기
	/*	beforeShowDay: function(date) {
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
			$(".head_content3>span:nth-child(2)").text(d);
		}
		
	});
	$(".btn5").click(function(){
		location.href = 'ExpMain.jsp';
	});
	$(".btn6").click(function(){
		location.href = 'ExpMain.jsp';
	});
});