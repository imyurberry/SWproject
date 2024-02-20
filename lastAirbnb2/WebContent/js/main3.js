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
        else{ location.href = "lmyController?command=logout&url=Main3"}
   });
	/*모든리뷰버튼 클릭*/
	 $(".review_inner3 > button").click(function(){
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
			$(".pop_section_sort").css("display" , "block");
			$(this).css("border","1px solid grey");
		}else {
			$(".pop_section_sort").css("display" , "none");
			$(this).css("border","1px solid rgb(221, 221, 221)");
		}
	});
/*	
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
	*/
	
	// 높은 평점순 클릭
	$(".pop_section_sort3").click(function(){
		$("#input_orderby").val('높은평점순');
		$(".pop_section2-1-1 > span:nth-child(1)").css("display","none");
		$(".pop_section2-1-1 > span:nth-child(2)").css("display","block");
		$(".pop_section_sort").css("display","none");
		test1();
	});
	// 다시 최신순 클릭
	$(".pop_section_sort2").click(function(){
		$("#input_orderby").val('최신순');
		$(".pop_section2-1-1 > span:nth-child(1)").css("display","block");
		$(".pop_section2-1-1 > span:nth-child(2)").css("display","none");
		$(".pop_section_sort").css("display","none");
		test1();
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
	//게스트선호 상자 눌렀을때 후기
	$(".info_inner2").click(function(){
		$("#bg_popup").css("display", "block");
		$("#pop_review").css("display", "block");
		$("body").css("overflow-y","hidden");
	});
	// 로고누르면 메인페이지이동
	$("#logo > img ").click(function(){
		location.href="main2.html";
	});
	
	// 미니 숙소세부창
	$(".side1-7>span:nth-child(1)").click(function(){
		if ($(".mini_side_pop").css("display")=="none"){
			$(".mini_side_pop").css("display","block");
		}else{
			$(".mini_side_pop").css("display","none");
		}
	});
	// 미니세부창닫기
	$(".mini_side_pop1>button").click(function(){
		$(".mini_side_pop").css("display","none");
	});
	
	//반려동물 세부창
	$(".side11_sp3").click(function(){
		$("#animal_outer").css("display","block");
		$("#animal").css("display","block");
		$("body").css("overflow-y","hidden");
	});
	$("#animal_outer").click(function(){
		$("#animal_outer").css("display","none");
		$("#animal").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	$(".animal_header>button").click(function(){
		$("#animal_outer").css("display","none");
		$("#animal").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	
	//위시버튼 눌렀을때 빨간하트
	$(".wish_content1").click(function(){
		
	});
	
	// 인원수+버튼
	$(".side11_btn2").click(function(e){
		e.stopPropagation();
		let current_member = Number($(".side1-12>div:nth-child(1) input").val())
							+ Number($(".side1-12>div:nth-child(2) input").val())
							+ Number($(".side1-12>div:nth-child(3) input").val());
		if(current_member == max_member) {
			return;
		}
		
		$(this).parent().find(".side11_input").val(Number($(this).parent().find(".side11_input").val()) + 1);
		$(this).parent().find(".side11_btn1").css("border","1px solid rgb(176, 176, 176)");
		$(this).parent().find(".side11_btn1>svg").css("color"," rgb(113, 113, 113)");

		current_member = Number($(".side1-12>div:nth-child(1) input").val())
							+ Number($(".side1-12>div:nth-child(2) input").val())
							+ Number($(".side1-12>div:nth-child(3) input").val());
		if(current_member == max_member) {
			$(".side11_btn2").css("border","1px solid rgb(235, 235, 235)");
			$(".side11_btn2>svg").css("color"," rgb(235, 235, 235)");
		}
		
		if( Number($(this).parent().find(".side11_input").val())>=16 ){
			$(this).parent().find(".side11_input").val(16);
			$(this).parent().find(".side11_btn2").css("border","1px solid rgb(235, 235, 235)");
			$(this).parent().find(".side11_btn2>svg").css("color"," rgb(235, 235, 235)");
		}
		// 인원수대로 텍스트 변경
		let adultVAL = $(".side1-12>div:nth-child(1) input").val();
		let kidVAL = $(".side1-12>div:nth-child(2) input").val();
		let babyVAL = $(".side1-12>div:nth-child(3) input").val();
		let petVAL = $(".side1-12>div:nth-child(4) input").val();
		let adult = '성인' + adultVAL +'명';
		let kid = ',어린이' + kidVAL +'명';
		let baby =',유아' + babyVAL +'명';
		let pet = ',반려동물' + petVAL +'마리';
		if(adultVAL == 0) audlt = "";
		if(kidVAL == 0 ) kid = "";
		if(petVAL == 0 ) pet = "";
		if(babyVAL == 0 ) baby = "";
		if(adult == "" && kid == "" && pet == "" && baby == "") 	
			$(".side1-4sp").text("게스트 추가");
		else{
			$(".side1-4sp").text(adult + kid + baby + pet);
		}
	});
	
	// 인원수-버튼
	$(".side11_btn1").click(function(e){
		e.stopPropagation();
	 	$(this).parent().find(".side11_input").val(Number($(this).parent().find(".side11_input").val()) - 1);
	
		if( Number($(this).parent().find(".side11_input").val())<16 ){
			$(this).parent().find(".side11_btn2").css("border","1px solid rgb(176, 176, 176)");
			$(this).parent().find(".side11_btn2>svg").css("color"," rgb(113, 113, 113)");
		}
		if( Number($(this).parent().find(".side11_input").val())<=0 ){
			$(this).parent().find(".side11_input").val(0);
			$(this).parent().find(".side11_btn1").css("border","1px solid rgb(235, 235, 235)");
			$(this).parent().find(".side11_btn1>svg").css("color"," rgb(235, 235, 235)");
		}
		let adultVAL = $(".side1-12>div:nth-child(1) input").val();
		let kidVAL = $(".side1-12>div:nth-child(2) input").val();
		let babyVAL = $(".side1-12>div:nth-child(3) input").val();
		let petVAL = $(".side1-12>div:nth-child(4) input").val();
		let adult = '성인' + adultVAL +'명';
		let kid = ',어린이' + kidVAL +'명';
		let baby =',유아' + babyVAL +'명';
		let pet = ',반려동물' + petVAL +'마리';
		if(adultVAL == 0) audlt = "";
		if(kidVAL == 0 ) kid = "";
		if(petVAL == 0 ) pet = "";
		if(babyVAL == 0 ) baby = "";
		if(adult == "" && kid == "" && pet == "" && baby == "") 	
			$(".side1-4sp").text("게스트 추가");
		else{
			$(".side1-4sp").text(adult + kid + baby + pet);
		}
	});
});



//숙소설명버튼
$(function(){
	$(".info_inner6-1").click(function(){
		$("#explain").css("display","block");
		$("#explain_inner").css("display","block");
		$("body").css("overflow-y","hidden");
	});
	$(".explain_header>button").click(function(){
		$("#explain").css("display","none");
		$("#explain_inner").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	$("#explain").click(function(){
		$("#explain").css("display","none");
		$("#explain_inner").css("display","none");
		$("body").css("overflow-y","scroll");
	});
});

//위시버튼
$(function(){
	$(".title3>button:nth-child(2)").click(function(){
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
	
	
	// 위시 숙소눌렀을때 하트바뀌기
	$(".wish_content_outer").click(function(){
		$(".title3>button:nth-child(2)").css("display","none");
		$("#wish_outer").css("display","none");
		$("#wish").css("display","none");
		$(".title3>button:nth-child(3)").css("display","flex");
	});
	//한번더누르면 다시 빈하트
	$(".title3>button:nth-child(3)").click(function(){
		$(".title3>button:nth-child(2)").css("display","flex");
		$(".title3>button:nth-child(3)").css("display","none");
	});
});

//공유하기 버튼
$(function(){
	$(".title3>button:nth-child(1)").click(function(){
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
});
$(function(){

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

	
	
});
// 인원선택 
$(function(){
	$(".side1-11").click(function(e) {
		e.stopPropagation();
	});
	$(".side1-4").click(function(e){
		e.stopPropagation();
		if ($(".side1-11").css("display")=="none"){
			$(".side1-11").css("display","block");
			$(".side1-4").css({"border":"2px solid black","border-radius":"8px"});
			$(".side1-3>button").css("border-bottom","none");
		}
		else {
			$(".side1-4").css({"border":"none"});
			$(".side1-11").css("display","none");
			$(".side1-3>button").css("border-bottom","1px solid black");
		}
	});
	// 닫기버튼
	$(".side1-14>span").click(function(){
		$(".side1-11").css("display","none");
		$(".side1-4").css({"border":"none"});
		$(".side1-3>button").css("border-bottom","1px solid black");
	});
	
});

// 신고하기 팝업
$(function(){
	$(".side3-1>span").click(function(){
		$("#report_outer").css("display","block");
		$("#report").css("display","block");
		$("body").css("overflow-y","hidden");
		$(".report_btn").prop("checked", false);
		$(".report_content2").css({"background-color":"rgb(221, 221, 221)","cursor":"no-drop"});
	});
	$(".report_inner1>button").click(function(){
		$("#report_outer").css("display","none");
		$("#report").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	$("#report_outer").click(function(){
		$("#report_outer").css("display","none");
		$("#report").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	
	// 신고이유선택
	$(".report_btn").click(function(){
		$(".report_content2").css({"background-color":"black","cursor":"pointer"});
	});
	
	
	$('#report_content2').click(function() {
		$('.report_btn').each(function(idx,obj){
			if($(obj).prop("checked") ){
				if((idx==4)){
					$("#report2_outer").css("display","block");
					$("#report2").css("display","block");
					$("body").css("overflow-y","hidden");
				}else{
					alert("접수되었습니다");
				}
			}
		});

	// 신고기타이유버튼 닫기
	$(".report2_section>button").click(function(){
		$("#report2_outer").css("display","none");
		$("#report2").css("display","none");
	});
	$(".report2_footer>button").click(function(){
		$("#report2_outer").css("display","none");
		$("#report2").css("display","none");
	});
	
	$(".report2_btn").click(function(){
		$("#report_outer").css("display","none");
		$("#report").css("display","none");
		$("body").css("overflow-y","scroll");
		$("#report2_outer").css("display","none");
		$("#report2").css("display","none");
		alert("접수되었습니다");
	});
});

// 편의시설팝업
$(function(){
	$(".content_all>button").click(function(){
		$("#cate_outer").css("display","block");
		$("#cate").css("display","block");
		$("body").css("overflow-y","hidden");
	});
	$(".cate_header>button").click(function(){
		$("#cate_outer").css("display","none");
		$("#cate").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	$("#cate_outer").click(function(){
		$("#cate_outer").css("display","none");
		$("#cate").css("display","none");
		$("body").css("overflow-y","scroll");
	});
	$("body").click(function(){
		$(".side1-11").css("display","none");
	});
	
	//datepicker
	var currentDate = new Date();
    var nextMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 1);
                

	// side datepicker
	   $(".datepicker3").datepicker({
		minDate: 0,
    	monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	dayNamesMin: ['일','월','화','수','목','금','토'],
    	dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
    	beforeShowDay: disableAllTheseDays,
		// 선택한 달력날짜 상단바에 표시	 
		onSelect:function( d ){
			var arr = d.split("/");
			$("#year").text(arr[0].trim());
			$("#month").text(arr[1].trim());
			$("#day").text(arr[2].trim());
			$(".dateInfo_inner").text(d);
			$(".dateInfo").text(d );
			$("#checkinDate").text(d);
			$(".dateSelect").text(d + "~") ;
		}

	});
	  $(".datepicker4").datepicker({
		monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		defaultDate: "+1m", //다음달부터 시작
		beforeShowDay: disableAllTheseDays,
		// 선택한 달력날짜 표시	 
		onSelect:function( d ){
			var arr = d.split("/");
			$("#year").text(arr[0].trim());
			$("#month").text(arr[1].trim());
			$("#day").text(arr[2].trim());
			$(".dateInfo_inner2").text(d);
			$(".dateInfo2").text(d);
			$("#checkoutDate").text(d);
			$(".dateSelect2").text(d);
			calc();
		}
       });

		// 날짜 초기화 버튼
	 $("#resetBtn").click(function() {
		$(".datepicker").datepicker("setDate", null);
   		$(".datepicker2").datepicker("setDate", "+1m");
		$(".datepicker3").datepicker("setDate", null);
  		$(".datepicker4").datepicker("setDate", "+1m");
		});

	
	$(".side1-3 > button").click(function(e) {
		var offset = $("#info_inner9").offset(); //해당 위치 반환
		$("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
	})
	
	// 댓글 엔터키 검색
	$("#searchText").keyup(function(e){if(e.keyCode === 13) test1();})

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
   });
}); 
});

//  후기 ajax
function test1(){
	const reviewcontainer = $("#review-container");
    let formData = $("#test1").serialize();
	//alert("formData : " + formData);
	$.ajax({
		type:'get',
		url:'lmyController',
		data : formData,
		success : function(obj){
			reviewcontainer.empty();
			for(let i =0; i<obj.length; i++){
				let stars = "";
				for(let j=1; j<=obj[i].score; j++) {
					stars += '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>';
				}
				let str = 
				"<div class='pop_section2-3'>"+
						"<div>" +
							"<img src= \"" + obj[i].user_image + "\"/>" +
							"<div>" + 
								"<span class='re-sp1'>" + obj[i].user_id + "<br></span>"; 
								/*user_regidence가 null일때*/
				if( obj[i].user_regidence != null){ 
					str += "<span class='re-sp2'>" + obj[i].user_regidence + "</span>";
				}
				str +=			"</div>" +
						"</div>" +
						
						"<div>" +
							"<div>" +
								stars +
							"</div>"+
							obj[i].written_date +
						"</div>" +
					
						
						"<div>" +
							obj[i].review +	
						"</div>" +	
					"</div>"
					reviewcontainer.append(str);
			}
		},
		error: function(r, s, e){
					console.log("[에러] code:" + r.status
							+ "message:" + r.responseText
							+ "error:" + e );
		}
	});
}

// 두 날짜 차이 계산하는 함수
function calc(){	
	let depart =  $(".dateInfo_inner").text();
	let arrive = $(".dateInfo_inner2").text();
	let dateCalc = $(".dateCalc");
	let datePrice = $(".side1-2>span:nth-child(2)").text();

	
    let ar1 = depart.split('/');
    let ar2 = arrive.split('/');
    let da1 = new Date(ar1[2], ar1[0], ar1[1]);
    let da2 = new Date(ar2[2], ar2[0], ar2[1]);
    let dif = da2 - da1;
    let cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨

    let date = parseInt(dif/cDay); 
	
 	/*console.log(date);
 	console.log(da1);
 	console.log(da2);*/
	
	dateCalc.text(date + "박");
	
	//숙소가격계산
	let price = $(".noneSalePrice");
	let totalPrice = $(".totalPrice");
	let roomPrice = $(".priceCalc").text().replace(",","").replace("₩","").replace("x","");
	let roomPriceCalc = (roomPrice*date); // 오른가격
	price.text("₩"+roomPriceCalc.toLocaleString());
	totalPrice.text("₩"+(roomPriceCalc-145910+113329).toLocaleString());
}
	
/*$(document).ready(function(){
	calc();
});*/