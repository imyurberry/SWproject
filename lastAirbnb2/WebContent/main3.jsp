<%@page import="esVo.LanguageVo"%>
<%@page import="esDao.LanguageDao"%>
<%@page import="esDao.LoginDao"%>
<%@page import="esVo.UserInfoVo"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="myDao.Main3Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myVo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
	RoomImageVo imagevo = (RoomImageVo)request.getAttribute("imagevo");
	UserInfoVo uservo = (UserInfoVo)request.getAttribute("uservo");
	RoomVo roomvo = (RoomVo)request.getAttribute("roomvo");
	RoomExplainVo explainvo = (RoomExplainVo)request.getAttribute("explainvo");
	int countriveiw =(Integer)request.getAttribute("countReview");
	ArrayList<RoomInfoVo> roominfovo = (ArrayList<RoomInfoVo>)request.getAttribute("roominfovo");
	ArrayList<ReviewVo> reviewvo = (ArrayList<ReviewVo>)request.getAttribute("reviewvo");
	ArrayList<ConvenientVo> convenientvo = (ArrayList<ConvenientVo>)request.getAttribute("convenientvo");
	ArrayList<StayVo> stayvo = (ArrayList<StayVo>)request.getAttribute("stayvo");
	Main3Dao dao3 = new Main3Dao();
	DecimalFormat decimalFormat = new DecimalFormat("###,###");
	ArrayList<ReviewVo> reviewList = (ArrayList<ReviewVo>)request.getAttribute("reviewList");
	LoginDao LoginDao = new LoginDao();
	LanguageDao langDao = new LanguageDao();
	ArrayList<LanguageVo> listLanguageVo = langDao.getLanguage();
	int userIdx = 0;
	UserInfoVo userList = null;
	int howManyAlarm = 0;
	if(request.getSession().getAttribute("userIdx") != null) {
		try{
			userIdx = (Integer)request.getSession().getAttribute("userIdx"); //--> 로그인창 만들면 이걸로 적용하기	
			userList = LoginDao.getUserInfoBy(userIdx);
			howManyAlarm = (Integer)LoginDao.getCountAlarm(userIdx);
		} catch (NullPointerException e){
			e.printStackTrace();
		}
	}
	
	ArrayList<String> listDatesUnavailable = dao3.getListDate8chUnavailable(roomIdx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/reset.css">
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/main3.css"/>
	<script src = "js/jquery-3.7.1.min.js"></script>
	<script src = "js/main3.js"></script>
	<!-- 날짜 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  	<script>
  		let max_member =  <%=roomvo.getMax_member() %>;
  		let petAllowed = <%=roomvo.getPet()%>;
  		// 특정날짜들 배열
  		// datepicker안되는날짜 막기
  		//var disabledDays = ["2024-2-14", "2024-2-15"];//["2013-7-9","2013-7-24","2013-7-26"];
  		let disabledDays = [
<% for(int i=0; i<=listDatesUnavailable.size()-1; i++) { %>
		"<%=listDatesUnavailable.get(i)%>"
			<% if(i<listDatesUnavailable.size()-1) { %>
				,
			<% } %>
<% } %>
  		];
  		// 특정일 선택막기
  		function disableAllTheseDays(date) {
  		    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
  		    for (i = 0; i < disabledDays.length; i++) {
  		        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
  		            return [false];
  		        }
  		    }
  		    return [true];
  		}
  	   <%--  // 숙소 가격 계산
  	    function CalcRoomPrice(){
  	    	let roomPrice = <%=roomvo.getRoom_price()%>;
  	    	let calcDate = 
  	    	let Price = $(".priceCalc").replaceAll(",");
  	    } --%>
  	  // 숙소idx 파라미터 넘기기
  	  let roomIdx = <%=roomvo.getRoom_idx()%>;
  	  $(function() {
    	$(".side1-1>button").click(function(){
    	  	let guest = $(".side1-4sp").text();
    	  	let date = $(".dateSelect").text();
    	  	let date2 = $(".dateSelect2").text();
    	  	let dates = date + date2;
    		location.href="lmyController?command=roomPayment&roomIdx=" + roomIdx + "&guest=" + guest +"&dates="+dates;
    	 });
    	
  	  });
  	</script>
</head>
<body>
<div class="currency_language_background"></div>
				<div id="currency_language_">
					<button class="close_div"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
					<div id="currency_">
						<div id="currency_top">
							<button class="currency_button fl">언어와 지역</button>
							<button class="language_button fl">통화</button>
						</div><!--currency_top-->
						<div id="currency_center">
							<div>
								<h2>추천 언어 및 지역</h2>
								<ul>
									<li class="fl">
										<div>English</div>
										<div>United States</div>
									</li>
									<li class="fl">
										<div>English</div>
										<div>United States</div>
									</li>
								</ul>
							</div>
							<div>
								<h3 style="font-size: 22px; font-weight: 600;">언어와 지역을 선택하세요</h3>
						<%
                        		for( int i = 0; i <= 90; i++ ){
  									if(i % 5 == 0)
  										out.println("<ul>");
                        %>
                         	  <li class="fl">
                            	  <div><%=listLanguageVo.get(i).getLanguage() %></div>
                              	<div><%=listLanguageVo.get(i).getLocation() %></div>
                         	  </li>
                        <%
                        		if(i % 5 == 4)
                        			out.println("</ul>");
                        		}
                        %>
							</div>
						</div><!--currency_center-->
					</div><!--currency_-->
					<div id="language_"></div><!--language_-->
				</div><!--currency_language_-->
		<div id="header">
			<div id="header_left" class="fl">
				<a href="Main2"><img src="images/logo.png" class="fr"/></a>
			</div><!--header_left-- <!--airbnbë¡ê³ -->
			<div id="header_center" class="fl">
			</div><!--header_center--> 
			<div id="header_right" class="fl">
				<div id="areaair" class="fl">
					<a href="doairbnb.jsp"><strong>당신의 공간을 에어비앤비하세요</strong></a>
				</div>
				<div id="globe" class="fl">
					<img src="images/globe.png"/>
				</div><!--globe-->
				<div id="profile" class="fl">
					<img src="images/list.png" style="margin: 21px 0 0 0px;"/>
					<% 		if(userIdx == 0) { %>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 30px; width: 40px; fill: currentcolor; margin: -30px 0 0 41px;"><path d="M16 .7C7.56.7.7 7.56.7 16S7.56 31.3 16 31.3 31.3 24.44 31.3 16 24.44.7 16 .7zm0 28c-4.02 0-7.6-1.88-9.93-4.81a12.43 12.43 0 0 1 6.45-4.4A6.5 6.5 0 0 1 9.5 14a6.5 6.5 0 0 1 13 0 6.51 6.51 0 0 1-3.02 5.5 12.42 12.42 0 0 1 6.45 4.4A12.67 12.67 0 0 1 16 28.7z"></path></svg>
						<%  } else { %>
								<% if(userList.getUser_image() != null) { %>
								<img src="<%=userList.getUser_image() %>"/>
								<% } else { %>
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 30px; width: 40px; fill: currentcolor; margin: -30px 0 0 41px;"><path d="M16 .7C7.56.7.7 7.56.7 16S7.56 31.3 16 31.3 31.3 24.44 31.3 16 24.44.7 16 .7zm0 28c-4.02 0-7.6-1.88-9.93-4.81a12.43 12.43 0 0 1 6.45-4.4A6.5 6.5 0 0 1 9.5 14a6.5 6.5 0 0 1 13 0 6.51 6.51 0 0 1-3.02 5.5 12.42 12.42 0 0 1 6.45 4.4A12.67 12.67 0 0 1 16 28.7z"></path></svg>
								<% } %>
								<div id="notice"><%=howManyAlarm %></div>
						<%    } %>
				</div><!--profile-->
				<div style ="clear : both;"></div>
				<div class="profile_list">
					<% if(userIdx > 0) { %> 
					<div class="profile_list_top">
						<form action="SesController" method="post">
							<input type="submit" value="메시지"/>
							<input type="hidden" name="thisUserIdx" value="0"/>
							<input type="hidden" name="command" value="message"/>
						</form>
						<form action="notification.jsp" method="post">
							<input type="submit" value="알림"/>
						</form>
						<form action="trip.jsp" method="post">
							<input type="submit" value="여행"/>
						</form>
						<form action="wishlist.jsp" method="post">
							<input type="submit" value="위시리스트"/>
						</form>
					</div><!--profile_list_top-->
					<div class="profile_list_center">
						<form action="doairbnb.jsp" method="post">
							<input type="submit" value="당신의 공간을 에어비앤비하세요"/>
						</form>
						<form action="account.jsp" method="post">
							<input type="submit" value="계정"/>
						</form>
					</div><!--profile_list_center-->
					<div class="profile_list_bottom">
						<form action="timeline.jsp" method="post">
							<input type="submit" value="타임라인"/>
						</form>
						<div class="Logout">로그아웃</div>
					</div><!--profile_list_bottom-->
				 	<% } else{ %>
					<div class="profile_list_diff">
						<div>로그인</div>
						<div>회원가입</div>
					</div>
					<% } %>
				</div><!--profile_list-->
			</div><!--header_right-->
			<div style ="clear : both;"></div>
		</div>
		<!-- 회원가입창 -->
   <div id="joinmember_outer"></div>
      <div id="joinmember">
      
         <div class="jm_header">
            <button>
               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                  aria-hidden="true" role="presentation" focusable="false"
                  style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible; margin: 0 auto;">
                  <path d="m6 6 20 20M26 6 6 26"></path></svg>
            </button>
            <h2>로그인 또는 회원 가입</h2>
            
         </div>
         
         <div class="jm_section">
            <h2>에어비엔비에 오신것을 환영합니다</h2>
         
            <form id="jm_form" action="lmyController" method="post">
               <div>
                  <label for="jm_form" id="code"></label> 
                  <select name="jm_code" class="jm_seclect_box">
                     <option value="korean">선호하는 언어</option>
                     <% for(int i = 0; i <= 90; i++) { %>
                  	 		<option><%=listLanguageVo.get(i).getLocation() %></option>
                  	 <% } %>
                  </select>
	               </div>
	               
	               <input type="text" class="jm_phnum" placeholder="전화번호" name="phone_num" required/>
	           	   <input type="password" class="password" placeholder="비밀번호" name="pw" required/>
	               <span>전화나 문자로 전화번호를 확인하겠습니다. 일반 문자 메시지 요금 및 데이터 요금이 부과됩니다.</span>
	         	   <input type="hidden" name="url" value="Main3"/>
	         	   <input type="hidden" name="command" value="login"/>
	               <input type="submit" class="jm_submit" value="로그인"><br/>
               <div class="join_user" style="padding-top: 16px;">회원 가입</div>
            </form>
         </div>
      </div>
      <div id="join_user">
      		<button>
               <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32"
                  aria-hidden="true" role="presentation" focusable="false"
                  style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible; margin: 0 auto;">
                  <path d="m6 6 20 20M26 6 6 26"></path></svg>
            </button>
      		<form method="post" class="join_user_form" action="lmyController">
      			이름 : <input type="text" placeholder="Ex) 김철수" name="user_id" required/> <br/><br/><br/>
      			비밀번호 : <input type="password" name="pw" required/> <br/><br/><br/>
      			비밀번호 확인 : <input type="password" class="check_pw" required/> <br/><br/><br/>
      			휴대폰 번호 : <input type="number" name="phone_num" placeholder="010xxxx1234" required/> <br/><br/><br/>
      			거주지 : <input type="text" name="user_regidence" required/> <br/><br/><br/>
      			생년월일 : <input type="text" name="birthday" placeholder="2000/12/12"required/> <br/><br/><br/>
      			이메일 : <input type="email" name="email" placeholder="asd123@naver.com" required/> <br/><br/><br/><br/>
      			<input type="hidden" name="command" value="join"/>
      			<input type="submit" style="width: 500px; background-color: rgb(255,56,92); border-radius: 10px; color: white; border: none;}"/>
      		</form>
      </div>
<!--회원가입창 끝  -->

<!-- 제목------------------------- -->
<div class="title_outer">
	<div class="title">
	
		<div class="title1">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-label="자동 번역된 이름: 토스카나 | 수영장과 레스토랑이 있는 농장 체험 숙박" role="img" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor;"><path d="M9 0a1 1 0 0 1 1 .88V6h5a1 1 0 0 1 1 .88V15a1 1 0 0 1-.88 1H7a1 1 0 0 1-1-.88V10H1a1 1 0 0 1-1-.88V1a1 1 0 0 1 .88-1H9zm1.73 7-1.4.5.24.21.13.13c.12.13.23.25.3.36l.08.1.05.07.04.08H7.31v1.3h1.2l.17.53.1.26.1.3A6.3 6.3 0 0 0 10 12.61c-.5.32-1.12.61-1.87.87l-.33.11-.35.11-.44.14.72 1.15.4-.13.4-.12c1-.35 1.83-.76 2.48-1.22.57.4 1.28.77 2.12 1.08l.37.14.38.12.41.13.72-1.15-.45-.14-.26-.08-.34-.11a9.23 9.23 0 0 1-1.94-.9 6.3 6.3 0 0 0 1.07-1.7l.13-.31.11-.33.17-.52h1.2V8.45h-3.05l-.1-.23A3.7 3.7 0 0 0 11 7.3l-.12-.15-.14-.15zm1.35 2.76-.04.13-.08.22-.1.27a4.99 4.99 0 0 1-.86 1.38 4.95 4.95 0 0 1-.74-1.13l-.12-.25-.1-.27-.08-.22-.04-.13h2.16zM9 1H1v8h5V7l.01-.17H3.83L3.43 8H2l2.26-6h1.48l1.5 4H9V1zM5 3.41 4.25 5.6h1.5L5 3.41z"></path></svg>
			<h2><%=roomvo.getRoom_name() %></h2>
		</div>
		
		<div class="title23">
			<div class="title2">
				<%if(countriveiw != 0){ %>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 14px; width: 14px; fill: currentcolor;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
					<span class="sp1"><%=roomvo.getRoom_score() %> </span>
					 ·
					<span class="sp2">후기 <%=countriveiw %>개  </span>
					&nbsp;.
				<%} %>
				<%if(uservo.getSuper_host().contains("1")) { %>
					<img src="images/medal.png"> 
					<span class="sp3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;슈퍼호스트  </span>
				<%}else{ %>
					<div style="display:none;"></div>
				<% } %>
				&nbsp;.
				<span class="sp4"><%=roomvo.getRoom_location() %></span>
			</div>	
				
			<div class="title3">
				<button>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible; "><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
					<span>공유하기</span>
				</button>
				<button>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible; "><path d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16 8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z"></path></svg>
					<span>저장</span>
				</button>
				<button  style="display:none;">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: rgb(255, 56, 92); height: 16px; width: 16px; stroke: rgb(255, 56, 92); stroke-width: 2; overflow: visible;"><path d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16 8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z"></path></svg>
					<span>저장 목록</span>
				</button> 
				
			</div>
		
		</div>
		
		
	</div>
</div>
<!--숙소사진 ---------------------->
<div id="photo_outer">
	<div id="photo">
		<div><img src="<%=imagevo.getImg1()%>"/></div>
		<div><img src="<%=imagevo.getImg2()%>"/></div>
		<div><img src="<%=imagevo.getImg3()%>"/></div>
		<div><img src="<%=imagevo.getImg4()%>"/></div>
		<div><img src="<%=imagevo.getImg5()%>"/></div>
<!-- 		<button>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: currentcolor;"><path fill-rule="evenodd" d="M3 11.5a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm5 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm5 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm-10-5a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm5 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm5 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm-10-5a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm5 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm5 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3z"></path></svg>
			<div>사진 모두 보기</div> 
		</button> -->
	</div> 
</div>

<!-- 설명,후기 -->
<div id="info_outer">
	<div id="info">
		<div>
			<div class="info_inner1">
				<h1><%=uservo.getUser_id()%>의 <%=roomvo.getRoom_type()%></h1>
				<div class="info_inner1-2">
					<%  if(roomvo.getMax_member() != 0){%>
						<span>최대 인원 <%=roomvo.getMax_member() %>명 ·</span>
					<%} %>
					<%  if(roomvo.getBedroom() != 0){%>
					<span class="sp"> 침실<%=roomvo.getBedroom() %>개 ·</span>
					<%} %>
					<%  if(roomvo.getBed_total() != 0){%>
					<span class="sp"> 침대<%=roomvo.getBed_total() %>개 ·</span> 
					<%} %>
					<%  if(roomvo.getBathroom() != 0){%>
					<span class="sp"> 욕실<%=roomvo.getBathroom() %>개</span> 
					<%} %>
				</div>
			</div>
			
			<div class="info_inner2">
				<svg viewBox="0 0 20 32" fill="none" xmlns="http://www.w3.org/2000/svg" height="36"><g clip-path="url(#clip0_5880_37773)"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.4895 25.417L14.8276 24.4547L16.5303 23.6492L17.1923 24.6116L16.3409 25.0143L17.1923 24.6116C18.6638 26.751 17.9509 29.3868 15.5999 30.4989C14.8548 30.8513 14.0005 31.0196 13.1221 30.987L12.8044 30.9752L12.7297 29.2305L13.0474 29.2423C13.5744 29.2618 14.0871 29.1608 14.5341 28.9494C15.9447 28.2821 16.3725 26.7007 15.4895 25.417Z" fill="#222222"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M8.32441 10.235C10.0819 8.96204 10.9247 7.4878 10.853 5.81232C10.7813 4.13685 9.80929 2.59524 7.93708 1.18749C6.17964 2.46049 5.33678 3.93473 5.40851 5.6102C5.48024 7.28568 6.45221 8.82729 8.32441 10.235Z" fill="#F7F7F7"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M7.19425 0.489275C7.55718 0.226387 8.10753 0.246818 8.49416 0.537533C10.5385 2.07473 11.7071 3.84975 11.7923 5.84026C11.8775 7.83076 10.8574 9.52453 8.93841 10.9146C8.57548 11.1775 8.02513 11.157 7.6385 10.8663C5.59415 9.32914 4.4256 7.55411 4.34039 5.56361C4.25517 3.57311 5.27521 1.87933 7.19425 0.489275ZM7.92362 2.3684C6.77985 3.38355 6.29788 4.47199 6.3478 5.63813C6.39772 6.80428 6.97457 7.93203 8.20904 9.03547C9.35281 8.02032 9.83478 6.93187 9.78486 5.76573C9.73493 4.59959 9.15809 3.47184 7.92362 2.3684Z" fill="#222222"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M15.6806 24.0529C14.1314 22.353 12.4326 21.4688 10.5842 21.4001C8.73575 21.3315 7.10737 22.0923 5.69905 23.6824C7.24822 25.3823 8.94702 26.2666 10.7955 26.3352C12.6439 26.4038 14.2723 25.6431 15.6806 24.0529Z" fill="#F7F7F7"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M4.90529 24.1787C4.60807 23.8526 4.58911 23.4097 4.8593 23.1046C6.38985 21.3765 8.27538 20.4331 10.521 20.5164C12.7666 20.5998 14.7391 21.6864 16.4227 23.5339C16.7199 23.86 16.7389 24.303 16.4687 24.608C14.9381 26.3361 13.0526 27.2795 10.807 27.1962C8.56134 27.1128 6.5889 26.0262 4.90529 24.1787ZM6.98781 23.7198C8.22307 24.8808 9.46778 25.4045 10.7323 25.4515C11.9968 25.4984 13.2005 25.0656 14.3402 23.9928C13.1049 22.8318 11.8602 22.3081 10.5957 22.2611C9.3312 22.2142 8.12744 22.6471 6.98781 23.7198Z" fill="#222222"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M10.6766 20.7043C10.2137 18.5957 9.16392 17.0928 7.52727 16.1956C5.89062 15.2984 3.99442 15.1864 1.83867 15.8596C2.30157 17.9683 3.35135 19.4712 4.988 20.3684C6.62465 21.2656 8.52085 21.3775 10.6766 20.7043Z" fill="#F7F7F7"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M0.791956 15.9443C0.703053 15.5393 0.94431 15.1569 1.37329 15.023C3.7337 14.2859 5.9714 14.3695 7.95247 15.4554C9.92449 16.5364 11.1013 18.3139 11.6022 20.5956C11.6911 21.0006 11.4499 21.3829 11.0209 21.5169C8.66048 22.254 6.42277 22.1704 4.4417 21.0844C2.46969 20.0034 1.29285 18.226 0.791956 15.9443ZM2.95349 16.4656C3.43375 17.9951 4.27991 19.007 5.41321 19.6282C6.5306 20.2407 7.84423 20.4286 9.44069 20.0743C8.96043 18.5448 8.11427 17.5329 6.98097 16.9116C5.86358 16.2991 4.54995 16.1113 2.95349 16.4656Z" fill="#222222"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M7.90911 15.6267C8.65652 13.6743 8.53705 11.9555 7.55072 10.4702C6.56438 8.98484 4.90844 8.03014 2.58291 7.60605C1.8355 9.55846 1.95497 11.2773 2.9413 12.7626C3.92764 14.2479 5.58357 15.2026 7.90911 15.6267Z" fill="#F7F7F7"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M1.66037 7.28295C1.80927 6.89397 2.26578 6.67525 2.74598 6.76282C5.29848 7.22831 7.26368 8.31371 8.44396 10.0911C9.61955 11.8614 9.70866 13.854 8.89805 15.9715C8.74915 16.3605 8.29264 16.5792 7.81244 16.4916C5.25994 16.0261 3.29474 14.9407 2.11446 13.1634C0.938866 11.393 0.849755 9.40048 1.66037 7.28295ZM3.3385 8.6613C2.94038 10.1267 3.14588 11.3465 3.83454 12.3835C4.51397 13.4067 5.60091 14.1584 7.21992 14.5931C7.61804 13.1278 7.41254 11.9079 6.72388 10.8709C6.04445 9.84774 4.95751 9.09607 3.3385 8.6613Z" fill="#222222"></path></g><defs><clipPath id="clip0_5880_37773"><rect width="18.8235" height="32" fill="white" transform="translate(0.453125 0.000488281)"></rect></clipPath></defs></svg>
				<span>게스트선호</span>
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 32" fill="none" height="36"><g clip-path="url(#clip0_5880_37786)"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.06516 25.417L4.72713 24.4547L3.02437 23.6492L2.3624 24.6116L3.21378 25.0143L2.3624 24.6116C0.890857 26.751 1.60381 29.3868 3.95483 30.4989C4.69986 30.8513 5.55423 31.0196 6.43257 30.987L6.75025 30.9752L6.82494 29.2305L6.50726 29.2423C5.98026 29.2618 5.46764 29.1608 5.02062 28.9494C3.61001 28.2821 3.18223 26.7007 4.06516 25.417Z" fill="#222222"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.2303 10.235C9.47283 8.96204 8.62998 7.4878 8.70171 5.81232C8.77344 4.13685 9.7454 2.59524 11.6176 1.18749C13.375 2.46049 14.2179 3.93473 14.1462 5.6102C14.0744 7.28568 13.1025 8.82729 11.2303 10.235Z" fill="#F7F7F7"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M12.3604 0.489275C11.9975 0.226387 11.4472 0.246818 11.0605 0.537533C9.01618 2.07473 7.84763 3.84975 7.76242 5.84026C7.6772 7.83076 8.69724 9.52453 10.6163 10.9146C10.9792 11.1775 11.5296 11.157 11.9162 10.8663C13.9605 9.32914 15.1291 7.55411 15.2143 5.56361C15.2995 3.57311 14.2795 1.87933 12.3604 0.489275ZM11.6311 2.3684C12.7748 3.38355 13.2568 4.47199 13.2069 5.63813C13.157 6.80428 12.5801 7.93203 11.3456 9.03547C10.2019 8.02032 9.71991 6.93187 9.76983 5.76573C9.81975 4.59959 10.3966 3.47184 11.6311 2.3684Z" fill="#222222"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M3.87411 24.0529C5.42328 22.353 7.12208 21.4688 8.97051 21.4001C10.8189 21.3315 12.4473 22.0923 13.8556 23.6824C12.3065 25.3823 10.6077 26.2666 8.75924 26.3352C6.9108 26.4038 5.28243 25.6431 3.87411 24.0529Z" fill="#F7F7F7"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M14.6494 24.1787C14.9466 23.8526 14.9656 23.4097 14.6954 23.1046C13.1648 21.3765 11.2793 20.4331 9.03368 20.5164C6.78805 20.5998 4.81561 21.6864 3.13199 23.5339C2.83478 23.86 2.81582 24.303 3.08601 24.608C4.61655 26.3361 6.50208 27.2795 8.74771 27.1962C10.9933 27.1128 12.9658 26.0262 14.6494 24.1787ZM12.5669 23.7198C11.3316 24.8808 10.0869 25.4045 8.82241 25.4515C7.55791 25.4984 6.35415 25.0656 5.21452 23.9928C6.44977 22.8318 7.69449 22.3081 8.95899 22.2611C10.2235 22.2142 11.4272 22.6471 12.5669 23.7198Z" fill="#222222"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M8.87809 20.7043C9.34099 18.5957 10.3908 17.0928 12.0274 16.1956C13.6641 15.2984 15.5603 15.1864 17.716 15.8596C17.2531 17.9683 16.2033 19.4712 14.5667 20.3684C12.93 21.2656 11.0338 21.3775 8.87809 20.7043Z" fill="#F7F7F7"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M18.7627 15.9443C18.8516 15.5393 18.6104 15.1569 18.1814 15.023C15.821 14.2859 13.5833 14.3695 11.6022 15.4554C9.6302 16.5364 8.45336 18.3139 7.95247 20.5956C7.86356 21.0006 8.10482 21.3829 8.5338 21.5169C10.8942 22.254 13.1319 22.1704 15.113 21.0844C17.085 20.0034 18.2618 18.226 18.7627 15.9443ZM16.6012 16.4656C16.1209 17.9951 15.2748 19.007 14.1415 19.6282C13.0241 20.2407 11.7105 20.4286 10.114 20.0743C10.5943 18.5448 11.4404 17.5329 12.5737 16.9116C13.6911 16.2991 15.0047 16.1113 16.6012 16.4656Z" fill="#222222"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M11.6456 15.6267C10.8982 13.6743 11.0176 11.9555 12.004 10.4702C12.9903 8.98484 14.6462 8.03014 16.9718 7.60605C17.7192 9.55846 17.5997 11.2773 16.6134 12.7626C15.6271 14.2479 13.9711 15.2026 11.6456 15.6267Z" fill="#F7F7F7"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M17.8943 7.28295C17.7454 6.89397 17.2889 6.67525 16.8087 6.76282C14.2562 7.22831 12.291 8.31371 11.1107 10.0911C9.93513 11.8614 9.84602 13.854 10.6566 15.9715C10.8055 16.3605 11.262 16.5792 11.7422 16.4916C14.2947 16.0261 16.26 14.9407 17.4402 13.1634C18.6158 11.393 18.7049 9.40048 17.8943 7.28295ZM16.2162 8.6613C16.6143 10.1267 16.4088 11.3465 15.7201 12.3835C15.0407 13.4067 13.9538 14.1584 12.3348 14.5931C11.9366 13.1278 12.1421 11.9079 12.8308 10.8709C13.5102 9.84774 14.5972 9.09607 16.2162 8.6613Z" fill="#222222"></path></g><defs><clipPath id="clip0_5880_37786"><rect width="18.8235" height="32" fill="white" transform="matrix(-1 0 0 1 19.1016 0.000488281)"></rect></clipPath></defs></svg>
				<div>에어비앤비 게스트에게 가장 사랑받는 숙소</div>
				<div class="score">
					<div><%=roomvo.getRoom_score() %></div>
					<span>
						<% for(int i=1; i<=roomvo.getRoom_score(); i++) { %>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor; "><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<% } %>
					<%-- 	<%if(roomvo.getRoom_score()== 5 ){ %> --%>
<%--					
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor; "><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor; margin:0 1px;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor; margin:0 1px;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor; margin:0 1px;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
--%>
						<%-- <%else if(roomvo.getRoom_score() >=4){ %>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor; "><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor; margin:0 1px;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor; margin:0 1px;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 10px; width: 10px; fill: currentcolor; margin:0 1px;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<%} %> --%>
					</span>
				</div>
				<div><%=countriveiw %>개<span>후기</span></div>
				<!-- <div><span>5.0</span></div> -->
			</div>
			
			
			<div class="info_inner3">
				<button>
					<img src="<%=uservo.getUser_image()%>"/>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 14" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 20px; width: 20px;"><linearGradient id="a" x1="8.5%" x2="92.18%" y1="17.16%" y2="17.16%"><stop offset="0" stop-color="#e61e4d"></stop><stop offset=".5" stop-color="#e31c5f"></stop><stop offset="1" stop-color="#d70466"></stop></linearGradient><path fill="#fff" d="M9.93 0c.88 0 1.6.67 1.66 1.52l.01.15v2.15c0 .54-.26 1.05-.7 1.36l-.13.08-3.73 2.17a3.4 3.4 0 1 1-2.48 0L.83 5.26A1.67 1.67 0 0 1 0 3.96L0 3.82V1.67C0 .79.67.07 1.52 0L1.67 0z"></path><path fill="url(#a)" d="M5.8 8.2a2.4 2.4 0 0 0-.16 4.8h.32a2.4 2.4 0 0 0-.16-4.8zM9.93 1H1.67a.67.67 0 0 0-.66.57l-.01.1v2.15c0 .2.1.39.25.52l.08.05L5.46 6.8c.1.06.2.09.29.1h.1l.1-.02.1-.03.09-.05 4.13-2.4c.17-.1.3-.29.32-.48l.01-.1V1.67a.67.67 0 0 0-.57-.66z"></path></svg>
				</button>
				
				<div>
					<span>호스트: <%=uservo.getUser_id() %> 님<br></span>
					<span>
					<%if(uservo.getSuper_host().contains("1")) { %>
					슈퍼호스트· 
					<%}else{ %>
					
					<%} %>
					가입일 : <%=uservo.getJoin_date()%>
					</span>
				</div>
			</div>
			
			<div class="info_inner4">
				<div class="info_inner4-1"> 
			                                                                             	
				<% for(RoomInfoVo rinfo : roominfovo){ 
					String category = rinfo.getRoom_info_category();
					category = category.replace("(((user_id)))", uservo.getUser_id());
					String detail = rinfo.getRoom_info_cate_detail();
				%>
					<div class="content1">
						<div class="in4_svg"><%=rinfo.getRoom_info_image() %></div>
						<div class="in4_ex_outer">
							<h3><%=category %></h3>
							<% if(rinfo.getRoom_info_cate_detail() != null){   %>
								<div>
								<%=rinfo.getRoom_info_cate_detail() %>
								</div>
							<%}else{ %>
							<%} %>
							
						</div>
					</div>
				<% } %>
					
				<!-- 	<div class="content1">
						<div class="in4_svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor; margin:0 8.6px;"><path d="M16 17a7 7 0 1 1 0 14 7 7 0 0 1 0-14zm0 2a5 5 0 1 0 0 10 5 5 0 0 0 0-10zM25.67.33a2 2 0 0 1 2 1.85v6.54a2 2 0 0 1-.97 1.7l-.14.08-9.67 4.84a2 2 0 0 1-1.61.07l-.17-.07-9.67-4.84a2 2 0 0 1-1.1-1.62V2.33a2 2 0 0 1 1.84-2h.15zm0 2H6.33v6.39L16 13.55l9.67-4.83z"></path></svg></div>
						<div class="in4_ex_outer">
							<h3>Alessandro님은 슈퍼호스트입니다</h3>
							<div>슈퍼호스트는 풍부한 경험과 높은 평점을 자랑하는 호스트입니다.</div>
						</div>
					</div>
					
					<div class="content2">
						<div class="in4_svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor; margin-left:8px;"><path d="M26 2a1 1 0 0 1 .92.61l.04.12 2 7a1 1 0 0 1-.85 1.26L28 11h-3v5h6v2h-2v13h-2v-2.54a3.98 3.98 0 0 1-1.73.53L25 29H7a3.98 3.98 0 0 1-2-.54V31H3V18H1v-2h5v-4a1 1 0 0 1 .88-1h.36L6.09 8.4l1.82-.8L9.43 11H12a1 1 0 0 1 1 .88V16h10v-5h-3a1 1 0 0 1-.99-1.16l.03-.11 2-7a1 1 0 0 1 .84-.72L22 2h4zm1 16H5v7a2 2 0 0 0 1.7 1.98l.15.01L7 27h18a2 2 0 0 0 2-1.85V18zm-16-5H8v3h3v-3zm14.24-9h-2.49l-1.43 5h5.35l-1.43-5z"></path></svg></div>
							<div class="in4_ex_outer">
								<h3>업무 전용 공간</h3>
								<div>와이파이가 제공되어 업무를 보기에 적합한 방입니다.</div>
						</div>
					</div> -->
				</div>
			</div>
				
			<!--5  -->	
			<div class="info_inner5">
				<div>
					<div class="info_inner5-1">일부 정보는 자동 번역되었습니다. <button>원문 보기</button></div>
				</div>
			</div>
			
			<!-- 6설명 -->
			<div class="info_inner6">
				<div>
 					<%=explainvo.getR_explain() %>
 					<%=explainvo.getRoom_char() %>
 					<%=explainvo.getRoom_place() %>
 					<%=explainvo.getRoom_etc() %>
				</div>
				<div>
					<div class="info_inner6-1">
						<span>더 보기</span>
						<svg viewBox="0 0 18 18" role="presentation" aria-hidden="true" focusable="false" style="height: 12px; width: 12px; display: block; fill: var(--f-k-smk-x); margin-top:2px;"><path d="m4.29 1.71a1 1 0 1 1 1.42-1.41l8 8a1 1 0 0 1 0 1.41l-8 8a1 1 0 1 1 -1.42-1.41l7.29-7.29z" fill-rule="evenodd"></path></svg>
					</div>
				</div>
			</div>

		<!-- 숙박장소(이모티콘버전) 44,47, -->	
<%-- 	<%for(StayVo sv : stayvo){ %>
		<%if(sv.getStay_img()!= null){ %> --%>
		<div class="info_inner7Svg"> 
			<div>숙박 장소</div>
		<%-- <%} %> --%>
				<div  class="stay_container">
				<%for(StayVo sv : stayvo){ %>
					<%if(sv.getStay_img()!= null){ %>
						<%if(sv.getStay_img().contains("</svg>")){ %>
							<div class="info_inner7-2" style="margin-right:16px;">
								<div>
									<%=sv.getStay_img().replace('\\', ' ') %>
								</div>
								<div ><%=sv.getStay_type() %></div>
								<div ><%=sv.getBed_count()%></div>
							</div>
						<!-- 사진일때 -->
						<%}else { %>  
							<div class="info_inner7-1">
								<img src ="<%=sv.getStay_img()%>"/>
								<div><%=sv.getStay_type() %></div>
								<div><%=sv.getBed_count() %></div>
							</div>
						<%} %>
					<%} %> 
				<%} %>
				
			</div> 
		</div>  
			<!-- 8편의 시설 -->	
			<div class="info_inner8">
				<div><h2>숙소 편의시설</h2></div>
				<%for(int i =0; i<10; i++){ %>
					<%if(convenientvo.get(i)==null) break; %>
				<div class="content">
					<div class="content_inner">
						<%= convenientvo.get(i).getConvenientImage()%>
						<div><%=convenientvo.get(i).getConvenientName() %></div>
					</div>
				</div>
				<%} %>
				
				<div class="content_all">
					<button>편의시설 <%=convenientvo.size() %>개 모두 보기</button>
				</div>
				
			</div>
				
			<!-- 9  -->	
			<div class="info_inner9" id="info_inner9">
				<h2>
				<%
				String str = roomvo.getRoom_location();
				String[] str2 = str.split(",");
				%>
				<%=str2[0] %>에서 
				<span class="dateCalc"></span>
				</h2>
				<span class ="dateSelect">일정을 선택하세요</span> 
				<span class="dateSelect2"></span>
				
				<div class="info_inner9-1">
					 <div id="dp3" name="dp3" class="datepicker3"></div>
					 <div id="dp4" name="dp4" class="datepicker4"></div>
				</div>
				
				<div class="info_inner9-2">
					<button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor;"><path d="M29 5a2 2 0 0 1 2 1.85V25a2 2 0 0 1-1.85 2H3a2 2 0 0 1-2-1.85V7a2 2 0 0 1 1.85-2H3zm0 2H3v18h26zm-8 13v2H11v-2zm3-5a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm16-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path></svg></button>
					<button id = resetBtn>날짜 지우기</button>
				</div>
			</div>
		</div>	
			
		<!-- 예약창 -->	
		<div class="info_inner10">
			<div class="side1">
				
				<!-- 사이드 팝업 -->
				<div class="side_date_pop" style="display:none;">
					<div class="side_date_pop1">
					 <span class="dateCalc"></span> <br> 
					 <span class="side_date_pop_sp">
					 <span id="checkinDate"></span>
					  - 
					  <span id="checkoutDate"></span>
					 </div>
					<button class=side_date_popbtn>
						<div>
							<span>체크인</span>
							<div class ="dateInfo_inner"></div>
							<div class="pop_xbtn"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible; margin-top:6px; margin-left:6px;"><path d="m6 6 20 20M26 6 6 26"></path></svg></div>
						</div>
						<div>
							<span>체크아웃</span>
							<div class="dateInfo_inner2"></div>
							<div class="pop_xbtn"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible; margin-top:6px; margin-left:6px;"><path d="m6 6 20 20M26 6 6 26"></path></svg></div>
						</div>
					</button>
						<div class="datepicker_pop">
							 <div id="dp3" name="dp3" class="datepicker3"></div>
							 <div id="dp4" name="dp4" class="datepicker4"></div>
						 </div>
					 <div style="clear:both;"></div>
					 
					 <div class="side_date_pop3">
					 	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor;margin-top:4px;"><path d="M29 5a2 2 0 0 1 2 1.85V25a2 2 0 0 1-1.85 2H3a2 2 0 0 1-2-1.85V7a2 2 0 0 1 1.85-2H3zm0 2H3v18h26zm-8 13v2H11v-2zm3-5a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm16-4a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-4 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path></svg>
					 	<div class="side_date_pop3-1">
					 		<span id="resetBtn">날짜지우기</span>
					 		<div>닫기</div>
					 	</div>
					 </div>
				</div>
				<!--사이드 팝업끝  -->
				
				<!-- 세부사이드 -->
				<div class="mini_side_pop" style="display:none">
					<div class="mini_side_pop1">
						<button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
						기본 요금 상세 내역
					</div>
					
					<div class="mini_side_pop2">
						<div class="mini_side_content">
							<div>2024. 1. 23.</div>
							<div>₩225,059</div>
						</div>
					 	<div class="mini_side_content">
							<div>2024. 1. 23.</div>
							<div>₩225,059</div>
						</div> 
						<div class="mini_side_content">
							<div>2024. 1. 23.</div>
							<div>₩225,059</div>
						</div> 
						<div class="mini_side_content">
							<div>2024. 1. 23.</div>
							<div>₩225,059</div>
						</div> 
						<div class="mini_side_content">
							<div>2024. 1. 23.</div>
							<div>₩225,059</div>
						</div> 
					</div>
					
					<div class="mini_side_pop3">	
						<span>총 기본요금</span>
						<span>₩450,118</span>
					</div>
				</div>
				
				<!--세부사이드 끝  -->
				<div class="side1-1"> <!-- 빨간색 -->
					<div class="side1-2"> 
						<%if(roomvo.getRoom_sale()==1){ %>
							<span>₩<%=decimalFormat.format(roomvo.getRoom_price()+ 80000) %></span>
							<span>₩<%=decimalFormat.format(roomvo.getRoom_price()) %></span>
							<span> /박</span>
						<%}%>
						<%if(roomvo.getRoom_sale()==0){ %>
							<span style="display: none;"></span>
							<span class="noneSalePrice">₩<%=decimalFormat.format(roomvo.getRoom_price())%></span>
							<span> /박</span>
						<%} %> 
						<%if (countriveiw != 0){ %>
						<div>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
							<span><%=roomvo.getRoom_score() %> ·</span> 
							<span>후기  <%=countriveiw %>개</span> 
						</div>
						<%} %>
					</div>
					
					<div class="side1-3">
						<button>
							<div>
								<span>체크인</span>
								<div class="dateInfo">가는날을 선택하세요</div>
							</div>
							<div>
								<span>체크아웃</span>
								<div class="dateInfo2">오는날을 선택하세요</div>
							</div>
						</button>
						<div class="side1-4">
							<span>인원</span>
							<p class="side1-4sp">게스트 추가<p>
							<div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path></svg></div>
						</div>
					</div><!-- 1-3끝  -->
					
					<button>예약하기</button>
				</div>
				
				<div class="side1-5">
					<span>예약 확정 전에는 요금이 청구되지 않습니다.</span>
				</div>
				
				<div class="side1-6">
					
						<div class="side1-7">
							<span class="sp1">
							<span  class="priceCalc">₩<%=new DecimalFormat("###,###").format(roomvo.getRoom_price())%> x </span>
							<span class="dateCalc"></span>
							</span>
							
							<span class="noneSalePrice"></span>
						</div>
						
						<div class="side1-8">
							<span class="sp1">장기 숙박 할인</span>
							<span>-₩145,910</span>
						</div>
						
						<div class="side1-9">
							<span class="sp1">청소비</span>
							<span>₩113,329</span>
						</div>
						
						<div class="side1-10">
							<span>총 합계</span>
							<span class="totalPrice"></span>
						</div>
				</div>
				<!-- 인원세부창 -->
				<div class="side1-11"style="DISPLAY:NONE;">
				
					<div class="side1-12"><!-- 핑크 -->
					
						<div class="side1-13">
							<div>
								<span class="side11_sp1">성인</span>
								<span class="side11_sp2">13세 이상</span>
							</div>
							<div>
								<button class= "side11_btn1"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg></button> 
								<input type="text" class="side11_input" value="0"/>
								<button class="side11_btn2"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg></button>
							</div>
						</div>
						
						<div class="side1-13">
							<div>
								<span class="side11_sp1">어린이</span>
								<span class="side11_sp2">2~12세</span>
							</div>
							<div>
								<button class= "side11_btn1"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg></button> 
								<input type="text" class="side11_input" value="0"/>
								<button class="side11_btn2"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg></button>
							</div>
						</div>
						
						<div class="side1-13">
							<div>
								<span class="side11_sp1">유아</span>
								<span class="side11_sp2">2세 미만</span>
							</div>
							<div>
								<button class= "side11_btn1"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg></button> 
								<input type="text" class="side11_input" value="0"/>
								<button class="side11_btn2"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg></button>
							</div>
						</div>
						
						<div class="side1-13">
							<div>	
								<span class="side11_sp1">반려동물</span>
								<span class="side11_sp3">반려동물을 동반하시나요?</span>
								
								<div id="animal_outer" style="display:none"></div>
								<div id="animal" style="display:none">
									<div class="animal_header">
										<button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
									</div>
									<div class="animal_section">
										<img src="https://a0.muscache.com/pictures/adafb11b-41e9-49d3-908e-049dfd6934b6.jpg"/>
									</div>
									<div class="animal_content">
										<h2>보조동물</h2>
										<span>
										보조동물은 반려동물이 아니므로 여기에 추가할 필요가 없습니다.<br><br>
										정서적 지원 동물과 함께 여행하시나요? 에어비앤비 접근성 정책을 확인해보세요.
										</span>
									</div>
								</div>
								
								
							</div>
							<div>
								<button class= "side11_btn1"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg></button> 
								<input type="text" class="side11_input" value="0"/>
								<button class="side11_btn2"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg></button>
							</div>
						</div>
						
					</div>
				
				
					<div class="side1-14">
						<span>닫기</span>
					</div>
				</div><!-- 인원세부창끝 -->
				
				
			</div>
				
				
			<div class="side2">
				<div class="side2-1">
					<h2>흔치않은 기회입니다</h2>
					<%=uservo.getUser_id() %>님의 숙소는 보통 예약이 가득 차 있습니다.
				</div>
				
				<div class="side2-2">
					<svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: rgb(227, 28, 95); stroke: currentcolor;"><g stroke="none"><path d="m32.62 6 9.526 11.114-18.146 23.921-18.147-23.921 9.526-11.114z" fill-opacity=".2"></path><path d="m34.4599349 2 12.8243129 14.9616983-23.2842478 30.6928721-23.28424779-30.6928721 12.82431289-14.9616983zm-17.9171827 16h-12.52799999l18.25899999 24.069zm27.441 0h-12.528l-5.73 24.069zm-14.583 0h-10.802l5.4012478 22.684zm-15.92-12.86-9.30799999 10.86h11.89399999zm19.253-1.141h-17.468l2.857 12.001h11.754zm1.784 1.141-2.586 10.86h11.894z"></path></g></svg>
				</div>
				<div style="clear:both;"></div>
			</div>
			
			<div class="side3">
				<div class="side3-1">
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: currentcolor;"><path d="M28 6H17V4a2 2 0 0 0-2-2H3v28h2V18h10v2a2 2 0 0 0 2 2h11.12a1 1 0 0 0 .84-1.28L27.04 14l1.92-6.72A1 1 0 0 0 28 6z"></path></svg>
					<span>숙소 신고하기</span>
				</div>
			</div>
			
		</div>
			
		
	</div>
</div>	<!-- info_outer끝 -->
<%if(countriveiw >= 1){%>
<div>
<div id ="review_outer">
	<div class="review_inner">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: currentcolor;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
		<span><%=roomvo.getRoom_score() %> · 후기 <%=countriveiw %>개</span>
	</div>
	
	<div class="review_inner2">
	
	<%if(countriveiw <2){ %>
		<% for(ReviewVo vo : reviewvo){%>
			<div class="ri2-1"> <!-- yellow -->
				<div>
					<img src="<%=vo.getUser_image()%>"/>
					<div>
						<span class="ri2-1sp1"><%=vo.getUser_id() %><br></span>
						<span class="ri2-1sp2"><%=vo.getWritten_date()%></span>
					</div>
				</div> <!-- red끝 -->
				<div class="ri2-2">
					<%=vo.getReview() %>
				</div><!-- olive끝 -->
				<div class="ri2-3">
					<span>더 보기</span>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 5.33333; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
				</div>	
			</div>
		<%} %>
	<% } %>
	
	<%if(countriveiw >2){ %>
 		<% for(int i =0; i<6; i++){ %>
			<div class="ri2-1"> <!-- yellow -->
				<div>
					<img src="<%=reviewvo.get(i).getUser_image()%>"/>
					<div>
						<span class="ri2-1sp1"><%=reviewvo.get(i).getUser_id() %><br></span>
						<span class="ri2-1sp2"><%=reviewvo.get(i).getWritten_date()%></span>
					</div>
				</div> <!-- red끝 -->
				<div class="ri2-2">
					<%=reviewvo.get(i).getReview() %>
				</div><!-- olive끝 -->
				<div class="ri2-3">
					<span>더 보기</span>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 5.33333; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
				</div>	
			</div>
		<%} %>
	<%} %> 
	
	
  <%if(countriveiw>6){ %>
  </div><!--pink끝  -->
	<div class="review_inner3">
		<button>후기 <%=countriveiw %>개 모두 보기</button>
	</div>
  <%}else{ %>
  <%} %>
	
	
</div><!--하늘색끝  -->	
</div>
<%} %>


<div id = "location">
	<h2>호스팅 지역</h2>
	<span><%=roomvo.getRoom_location() %></span>
	<img src="images/location.png"/>
</div>

<!-- host프로필 -->
<div id ="host">

	<div class="host_inner1">
		<button>
			<img src="<%=uservo.getUser_image()%>"/>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 14" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 23px; width: 25px;"><linearGradient id="a" x1="8.5%" x2="92.18%" y1="17.16%" y2="17.16%"><stop offset="0" stop-color="#e61e4d"></stop><stop offset=".5" stop-color="#e31c5f"></stop><stop offset="1" stop-color="#d70466"></stop></linearGradient><path fill="#fff" d="M9.93 0c.88 0 1.6.67 1.66 1.52l.01.15v2.15c0 .54-.26 1.05-.7 1.36l-.13.08-3.73 2.17a3.4 3.4 0 1 1-2.48 0L.83 5.26A1.67 1.67 0 0 1 0 3.96L0 3.82V1.67C0 .79.67.07 1.52 0L1.67 0z"></path><path fill="url(#a)" d="M5.8 8.2a2.4 2.4 0 0 0-.16 4.8h.32a2.4 2.4 0 0 0-.16-4.8zM9.93 1H1.67a.67.67 0 0 0-.66.57l-.01.1v2.15c0 .2.1.39.25.52l.08.05L5.46 6.8c.1.06.2.09.29.1h.1l.1-.02.1-.03.09-.05 4.13-2.4c.17-.1.3-.29.32-.48l.01-.1V1.67a.67.67 0 0 0-.57-.66z"></path></svg>
		</button>
				
		<div>
			<span>호스트: <%=uservo.getUser_id() %> 님<br></span>
			<span>회원 가입일: <%=uservo.getJoin_date() %></span>
		</div>
	</div>
	
	<div id="host_inner_all">
		<div class="host_inner2">
		
			<div class="hi2-1">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: currentcolor; float:left; margin-right:9px;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
					<span>후기 <%=countriveiw %>개</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: currentcolor;float:left; margin-right:9px;"><path d="m16 .8.56.37C20.4 3.73 24.2 5 28 5h1v12.5C29 25.57 23.21 31 16 31S3 25.57 3 17.5V5h1c3.8 0 7.6-1.27 11.45-3.83L16 .8zm7 9.08-9.5 9.5-4.5-4.5L6.88 17l6.62 6.62L25.12 12 23 9.88z"></path></svg>
					<span>본인 인증 완료</span>
				</div>
				<%
				String hostCheck = uservo.getSuper_host();
				if(hostCheck.contains("1")) { %>
				<div>
					<img src="images/medal.png"> 
					<span>슈퍼호스트</span>
				</div>
				<%} else{ %>
				<div style="display:none;"></div>
				<%} %>
			</div>
			
			<div class="hi2-2">
				<% if(uservo.getIntroduce() != null){%>
					<%=uservo.getIntroduce() %>
				<%} %>
			</div>
			
			
			
			<div class="hi2-5">
				<%=uservo.getUser_id() %>님은 슈퍼호스트입니다.
			</div>
			
			<div class="hi2-6">
				슈퍼호스트는 풍부한 경험과 높은 평점을 자랑하며 게스트가 숙소에서 편안히 머무를 수 있도록 최선을 다하는 호스트입니다.
			</div>
			
		</div><!-- 오렌지끝 -->
		
		<div  class="host_inner3">
			<div class="host_inner3-1">
				응답률: 100%
			</div>
			<div class="host_inner3-2">
				응답 시간: 1시간 이내
			</div>
			<div class="host_inner3-3">
				<button>호스트에게 연락하기</button>
			</div>
			<div class="host_inner3-4">
				<svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 24px; width: 24px; fill: rgb(227, 28, 95); stroke: currentcolor;"><g><g stroke="none"><path d="m25 5 .5846837.00517475c4.2905015.07574932 8.8374917.98334075 13.644943 2.73687823l.7703733.28794702v27.3705076l-.0084766.1301365c-.0392237.2994207-.2122236.5656263-.4699074.7230756l-.1154775.0605995-11.4234694 5.0774159c.0623636-.7458456-.0433445-1.4943022-.3209346-2.2783707-.2495178-.7044496-.7667703-1.7805075-1.0418654-2.3950548-1.9094732-4.1561789-3.9589781-8.3688465-6.0912876-12.5211487l-.3317555-.6369277c-.4686141-.9115826-.8248653-1.6297768-1.3147672-2.2052384-.743401-.8737317-1.7668654-1.3549948-2.8821508-1.3549948-1.1154695 0-2.1391179.4816323-2.8828868 1.3557332-.6050254.7114646-1.0306408 1.6819288-1.6457867 2.8412431-.4956822.9653459-.9868615 1.9338929-1.47282629 2.9041739l.00159179-19.0721502.769087-.28647781c4.798406-1.75037189 9.3373349-2.65799308 13.6207364-2.73688762z" fill-opacity=".2"></path><path d="m25 1c5.5985197 0 11.5175072 1.27473768 17.7548231 3.81642897.7027419.28641855 1.1783863.94329535 1.2386823 1.69066764l.0064946.16143432v28.73197667c0 1.8999458-1.0758761 3.6285379-2.7638433 4.4721215l-.2054644.0969363-15.0427818 6.6856808c-.4614217.2050763-1.8621146.3276624-2.7955525.3430957l-.192358.0016581.0009065-1.0005013c.6483674-.0069073 1.2843321-.1330366 1.8784107-.3747752.8327784-.3388673 1.5457548-.8939986 2.0790671-1.5885618l13.2600311-5.8942194c1.023196-.4547538 1.7028179-1.4383245 1.7751735-2.5449525l.0064111-.1964822v-28.73197667l-.6916987-.27704554c-5.7517231-2.26330416-11.1871718-3.39148539-16.3083013-3.39148539-5.1211255 0-10.5565697 1.12817946-16.3082877 3.39148006l-.6917123.27707479-.00030284 24.49382405c-.68067737 1.4079172-1.34834149 2.8151846-2.00083161 4.2173468l.00113445-28.71117085c0-.81311953.4922453-1.5453083 1.24525131-1.85215622 6.23725069-2.54166294 12.15623339-3.81639863 17.75474869-3.81639863z"></path></g><path d="m15.999908 41.6930234.6867258-.8851772c1.5957359-2.0328613 2.5919668-3.8873951 2.9612752-5.511912.2804314-1.2318637.2318527-2.5167089-.4804505-3.5591688-.6801015-.9952012-1.8642067-1.5894421-3.1673665-1.5894421-1.3033438 0-2.487633.5940563-3.1675505 1.5890729-.7099111 1.039137-.761802 2.3201055-.4810025 3.5580612.3689403 1.6247015 1.3653552 3.4796045 2.9616432 5.5133888l.6867258.8851772.6447715.7192179c1.1495113 1.2599236 2.1735278 2.122579 3.2227536 2.7149739.8151649.4602182 1.6400823.7413704 2.4521191.8358878.8812245.1033783 1.7585848-.0123685 2.559765-.3383795 1.6422905-.6682672 2.8186673-2.1775911 3.0700251-3.9387151.1205267-.8438258.0264975-1.6854363-.2876078-2.572644-.2495178-.7044496-.7667703-1.7805075-1.0418654-2.3950548-1.9094732-4.1561789-3.9589781-8.3688465-6.0912876-12.5211487-.6486357-1.2222643-1.0477537-2.1388241-1.6465227-2.8421661-.743401-.8737317-1.7668654-1.3549948-2.8821508-1.3549948-1.1154695 0-2.1391179.4816323-2.8828868 1.3557332-.6050254.7114646-1.0306408 1.6819288-1.6457867 2.8412431-2.1326775 4.1534098-4.1819984 8.3660775-6.09128759 12.5211487-.28227155.6306079-.79308369 1.6933742-1.04168139 2.3948702-.3141053.8872077-.40813448 1.7288182-.28760784 2.5731978.25117384 1.7609394 1.42736664 3.2700787 3.06965711 3.9385305.81939715.3333951 1.69418134.4397272 2.55958102.3385641.81295679-.0948866 1.63805829-.3760388 2.45248709-.8360724 1.0492258-.5922103 2.0732422-1.4550503 3.2227536-2.7149739z" fill="none" stroke-width="2"></path></g></svg>
				<span>안전한 결제를 위해 에어비앤비 웹사이트나 앱<br>외부에서 송금하거나 대화를 나누지 마세요.</span>
			</div>
		</div>
	</div>
</div><!-- host프로필끝 -->
<div id="essential" >
	<div class="essential2">
		알아두어야 할 사항
	</div>
	
	<div class="essential3">
		<span style="font-weight: 600; margin-bottom:12px;">숙소 이용규칙</span>
		<span>체크인 가능 시간: 오후 3:00 이후</span>
		<span>체크아웃 시간: 오전 11:00 전까지</span>
		<span>게스트 정원 6명</span>
		<div class="essential_svg">
			<span>더 보기</span>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 5.33333; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
		</div>	
	</div>
	<div class="essential4">
		<span style="font-weight: 600; margin-bottom:12px;">안전 및 숙소</span>
		<span>일산화탄소 경보기</span>
		<span>화재경보기</span>
		<span>계단을 올라가야 함</span>
		<div class="essential_svg">
			<span>더 보기</span>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 5.33333; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
		</div>	
	</div>
	<div class="essential5">
		<span style="font-weight: 600; margin-bottom:10px;">환불 정책</span>
		<span >부분 환불: 취소 후 나머지 숙박일에 대한 요금 중<br>
		 50%를 환불받으실 수 있습니다. 현지 시각 기준으로<br>
		 오후 12:00 후에 취소하면, 해당 날짜에 대한<br>
		 숙박료는 환불되지 않습니다. 이미 숙박한 날짜에<br>
		 대한 요금과 서비스 수수료는 환불되지 않습니다.</span>
		 <div class="essential_svg">
			<span>더 보기</span>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 5.33333; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
		</div>	
	</div>
</div>


<!--footer  -->
<div id="footer">
			<div id="footer_inner">
				<div id="footer_list">
					<section class="fl">
						<h3>에어비앤비 지원</h3>
						<ul>
							<a href="OutOfService.jsp"><li>도움말 센터</li></a>
							<a href="OutOfService.jsp"><li>안전 문제 관련 도움받기</li></a>
							<a href="OutOfService.jsp"><li>에어커버</li></a>
							<a href="OutOfService.jsp"><li>차별 반대</li></a>
							<a href="OutOfService.jsp"><li>장애인 지원</li></a>
							<a href="OutOfService.jsp"><li>예약 취소 옵션</li></a>
							<a href="OutOfService.jsp"><li>이웃 민원 신고</li></a>
						</ul>
					</section>
					<section class="fl">
						<h3>호스팅</h3>
						<ul>
							<a href="OutOfService.jsp"><li>당신의 공간을 에어비앤비하세요</li></a>
							<a href="OutOfService.jsp"><li>호스트를 위한 에어커버</li></a>
							<a href="OutOfService.jsp"><li>호스팅 자료</li></a>
							<a href="OutOfService.jsp"><li>커뮤니티 포럼</li></a>
							<a href="OutOfService.jsp"><li>책임감 있는 호스팅</li></a>
						</ul>
					</section>
					<section class="fl">
						<h3>에어비앤비</h3>
						<ul>
							<a href="OutOfService.jsp"><li>뉴스룸</li></a>
							<a href="OutOfService.jsp"><li>새로운 기능</li></a>
							<a href="OutOfService.jsp"><li>채용정보</li></a>
							<a href="OutOfService.jsp"><li>투자자 정보</li></a>
							<a href="OutOfService.jsp"><li>Airbnb 긴급 숙소</li></a>
						</ul>
					</section>
				</div><!--footer_list-->
				<div id="footer_under">
					<div id="footer_under_top">
						<div id="fut_left">
							<div class="fl">© 2023 Airbnb, Inc.</div>
							<span class="fl">·</span>
							<a class="fl">개인정보 처리방침</a>
							<span class="fl">·</span>
							<a class="fl" href="OutOfService.jsp">이용약관</a>
							<span class="fl">·</span>
							<a class="fl" href="OutOfService.jsp">사이트맵</a>
							<span class="fl">·</span>
							<a class="fl" href="OutOfService.jsp">한국의 변경된 환불 정책</a>
							<span class="fl">·</span>
							<a class="fl" href="OutOfService.jsp">회사 세부정보</a>
						</div><!--fut_left-->
						<div id="fut_right" class="fr">
							<div class="fl">
								<button class="fl">
									<svg class="fl" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: currentcolor;"><path d="M8 .25a7.77 7.77 0 0 1 7.75 7.78 7.75 7.75 0 0 1-7.52 7.72h-.25A7.75 7.75 0 0 1 .25 8.24v-.25A7.75 7.75 0 0 1 8 .25zm1.95 8.5h-3.9c.15 2.9 1.17 5.34 1.88 5.5H8c.68 0 1.72-2.37 1.93-5.23zm4.26 0h-2.76c-.09 1.96-.53 3.78-1.18 5.08A6.26 6.26 0 0 0 14.17 9zm-9.67 0H1.8a6.26 6.26 0 0 0 3.94 5.08 12.59 12.59 0 0 1-1.16-4.7l-.03-.38zm1.2-6.58-.12.05a6.26 6.26 0 0 0-3.83 5.03h2.75c.09-1.83.48-3.54 1.06-4.81zm2.25-.42c-.7 0-1.78 2.51-1.94 5.5h3.9c-.15-2.9-1.18-5.34-1.89-5.5h-.07zm2.28.43.03.05a12.95 12.95 0 0 1 1.15 5.02h2.75a6.28 6.28 0 0 0-3.93-5.07z"></path></svg>
									<a class="fl" href="OutOfService.jsp">한국어<strong>(KR)</strong></a>
								</button>
								<span class="fl">
									<span class="fl" style="--footer-icon-spacing:5px; font-weight: 600;"  class="i2is942 dir dir-ltr">₩</span>
									<a href="OutOfService.jsp">KRW</a>
								</span>
							</div>
							<ul class="fr">
								<li class="fl"><a href="OutOfService.jsp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;height:18px;width:18px;fill:currentColor" aria-label="íì´ì¤ë¶ì¼ë¡ ì´ëíê¸°" role="img" focusable="false"><path d="M30 0a2 2 0 0 1 2 2v28a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"></path><path fill="#fff" d="M22.94 16H18.5v-3c0-1.27.62-2.5 2.6-2.5h2.02V6.56s-1.83-.31-3.58-.31c-3.65 0-6.04 2.21-6.04 6.22V16H9.44v4.62h4.06V32h5V20.62h3.73z"></path></svg></a></li>
								<li class="fl"><a href="OutOfService.jsp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;height:18px;width:18px;fill:currentColor" aria-label="í¸ìí°ë¡ ì´ëíê¸°" role="img" focusable="false"><path d="M32 4v24a4 4 0 0 1-4 4H4a4 4 0 0 1-4-4V4a4 4 0 0 1 4-4h24a4 4 0 0 1 4 4z"></path><path fill="#fff" d="M18.66 7.99a4.5 4.5 0 0 0-2.28 4.88A12.31 12.31 0 0 1 7.3 8.25a4.25 4.25 0 0 0 1.38 5.88c-.69 0-1.38-.13-2-.44a4.54 4.54 0 0 0 3.5 4.31 4.3 4.3 0 0 1-2 .06 4.64 4.64 0 0 0 4.19 3.13A8.33 8.33 0 0 1 5.8 23a12.44 12.44 0 0 0 19.32-11.19A7.72 7.72 0 0 0 27.3 9.5a8.3 8.3 0 0 1-2.5.75 4.7 4.7 0 0 0 2-2.5c-.87.5-1.81.87-2.81 1.06a4.5 4.5 0 0 0-5.34-.83z"></path></svg></a></li>
								<li class="fl"><a href="OutOfService.jsp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;height:18px;width:18px;fill:currentColor" aria-label="ì¸ì¤íê·¸ë¨ì¼ë¡ ì´ëíê¸°" role="img" focusable="false"><path d="M30 0H2a2 2 0 0 0-2 2v28c0 1.1.9 2 2 2h28a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"></path><path fill="#fff" d="M15.71 4h1.25c2.4 0 2.85.02 3.99.07 1.28.06 2.15.26 2.91.56.79.3 1.46.72 2.13 1.38.6.6 1.08 1.33 1.38 2.13l.02.06c.28.74.48 1.58.54 2.8l.01.4c.05 1.02.06 1.63.06 4.4v.92c0 2.6-.02 3.05-.07 4.23a8.78 8.78 0 0 1-.56 2.91c-.3.8-.77 1.53-1.38 2.13a5.88 5.88 0 0 1-2.13 1.38l-.06.02c-.74.28-1.59.48-2.8.53l-.4.02c-1.02.05-1.63.06-4.4.06h-.92a73.1 73.1 0 0 1-4.23-.07 8.78 8.78 0 0 1-2.91-.56c-.8-.3-1.53-.77-2.13-1.38a5.88 5.88 0 0 1-1.38-2.13l-.02-.06a8.84 8.84 0 0 1-.54-2.8l-.01-.37A84.75 84.75 0 0 1 4 16.29v-1c0-2.62.02-3.06.07-4.24.06-1.26.26-2.13.55-2.88l.01-.03c.3-.8.77-1.53 1.38-2.13a5.88 5.88 0 0 1 2.13-1.38l.06-.02a8.84 8.84 0 0 1 2.8-.54l.37-.01C12.39 4 12.99 4 15.71 4zm.91 2.16h-1.24c-2.3 0-2.91.01-3.81.05l-.42.02c-1.17.05-1.8.25-2.23.41-.56.22-.96.48-1.38.9-.4.41-.67.8-.88 1.35l-.03.06a6.7 6.7 0 0 0-.4 2.2l-.02.45c-.04.9-.05 1.53-.05 3.94v1.08c0 2.64.02 3.05.07 4.23v.07c.06 1.13.25 1.74.42 2.16.21.56.47.96.9 1.38.4.4.8.67 1.34.88l.06.03a6.7 6.7 0 0 0 2.2.4l.45.02c.9.04 1.53.05 3.94.05h1.08c2.64 0 3.05-.02 4.23-.07h.07a6.51 6.51 0 0 0 2.16-.42c.52-.19.99-.5 1.38-.9.4-.4.67-.8.88-1.34l.03-.06a6.7 6.7 0 0 0 .4-2.2l.02-.45c.04-.9.05-1.53.05-3.94v-1.09c0-2.63-.02-3.04-.07-4.22v-.07a6.51 6.51 0 0 0-.42-2.16c-.19-.52-.5-.99-.9-1.38a3.7 3.7 0 0 0-1.34-.88l-.06-.03a6.63 6.63 0 0 0-2.16-.4l-.46-.02c-.9-.04-1.5-.05-3.8-.05zM16 9.84a6.16 6.16 0 1 1 0 12.32 6.16 6.16 0 0 1 0-12.32zM16 12a4 4 0 1 0 0 8 4 4 0 0 0 0-8zm6.4-3.85a1.44 1.44 0 1 1 0 2.88 1.44 1.44 0 0 1 0-2.88z"></path></svg></a></li>
								<li class="fl"><a href="OutOfService.jsp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;height:18px;width:18px;fill:currentColor" aria-label="ë¤ì´ë² ë¸ë¡ê·¸ë¡ ì´ëíê¸°" role="img" focusable="false"><path fill="#222" d="M30 0a2 2 0 0 1 2 2v28a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"></path><path fill="#fff" d="M23.92 6A4.1 4.1 0 0 1 28 9.88l.01.2v9.84A4.08 4.08 0 0 1 24.13 24h-5.86l-1.91 3.31a.45.45 0 0 1-.73.08l-.05-.08-1.91-3.3h-5.6a4.08 4.08 0 0 1-4.06-3.87l-.01-.2v-9.86a4.08 4.08 0 0 1 3.87-4.06l.2-.01zm-1.99 7.22c-1.13 0-2.05.95-2.05 2.12 0 1.16.92 2.1 2.05 2.1.47 0 .9-.15 1.24-.42v.59l-.03.08-.05.1c-.11.16-.36.39-.9.39v1.09h.22c.3-.02.87-.13 1.42-.61l.13-.13.05-.06.1-.12c.11-.17.26-.44.31-.76v-4.28h-1.25v.34a2.02 2.02 0 0 0-1.24-.43zM8.81 11.9H7.58v5.6H8.8v-.4c.35.3.79.5 1.27.5 1.1 0 2-.98 2-2.19s-.89-2.2-2-2.2c-.42 0-.81.15-1.14.4l-.13.1zm8.3 1.31c-1.23 0-2.23.98-2.23 2.2s1 2.18 2.23 2.18c1.22 0 2.22-.98 2.22-2.19s-1-2.19-2.22-2.19zm-3.35-.66a1.98 1.98 0 0 0-1.33-.75H12.22v1.12l.08.01c.14.04.44.16.56.5l.04.12v3.94h1.27v-3.97a2.12 2.12 0 0 0-.24-.7l-.08-.15zM9.84 14.3a1.1 1.1 0 1 1 0 2.19 1.1 1.1 0 0 1-1.12-1.1c0-.15.04-.3.1-.43.17-.4.56-.66 1.02-.66zm7.27.05c.58 0 1.06.47 1.06 1.04s-.47 1.05-1.06 1.05c-.6 0-1.07-.47-1.07-1.05s.48-1.04 1.07-1.04zm5.05-.11c.44 0 .83.24 1.01.6.08.15.12.3.12.48s-.05.34-.12.48c-.18.36-.57.6-1 .6a1.1 1.1 0 0 1-1.13-1.08c0-.6.5-1.08 1.12-1.08z"></path></svg></a></li>
								<li class="fl"><a href="OutOfService.jsp"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;height:18px;width:18px;fill:currentColor" aria-label="ë¤ì´ë² í¬ì¤í¸ë¡ ì´ëíê¸°" role="img" focusable="false"><path fill="#222" d="M30 0a2 2 0 0 1 2 2v28a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2z"></path><path fill="#fff" d="M10 0h12.81v16.78l-5.88 10.13a.6.6 0 0 1-.99.09l-.06-.1L10 16.79z"></path><path fill="#222" d="M12.66 4.64v7.5h7.5v-7.5zm5.87 5.69h-1.5l-1.28-1.96v1.96h-1.47V6.45h1.43l1.32 1.95V6.45h1.5z"></path></svg></a href="OutOfService.jsp"></li>
							</ul>
						</div><!--fut_right-->
					</div><!--footer_under_top-->
					<div id="footer_under_bottom">
웹사이트 제공자: Airbnb Ireland UC, private unlimited company, 8 Hanover Quay Dublin 2, D02 DP23 Ireland | 이사: Dermot Clarke, Killian Pattwell, Andrea Finnegan | VAT 번호: IE9827384L | 사업자 등록 번호: IE 511825 | 연락처: terms@airbnb.com, 웹사이트, 080-822-0230 | 호스팅 서비스 제공업체: 아마존 웹서비스 | 에어비앤비는 통신판매 중개자로 에어비앤비 플랫폼을 통하여 게스트와 호스트 사이에 이루어지는 통신판매의 당사자가 아닙니다. 에어비앤비 플랫폼을 통하여 예약된 숙소, 체험, 호스트 서비스에 관한 의무와 책임은 해당 서비스를 제공하는 호스트에게 있습니다.
					</div>
				</div><!--footer_under-->
			</div><!--footer_inner-->
		</div><!--ë°footer-->
 <!-- 후기팝업 -->    
  <div id="bg_popup"></div>
      	<div id="pop_review">
		<div class="pop_header">
			<button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
		</div>
		
		<div class="pop_section">
		
			<!-- 최신순팝업 -->
			<div class="pop_section_sort" style="display:none">
				<div class="pop_section_sort2">
					최신순
				</div>
				<div class="pop_section_sort3" >
					높은 평점순
				</div>
			</div>
			<!-- 최신순팝업 -->
			
			<div class="pop_section1">
				<div class="pop_section1-1">
					<img class="i9if2t0 atm_e2_idpfg4 atm_vy_idpfg4 atm_mk_stnw88 atm_e2_1osqo2v__1lzdix4 atm_vy_1osqo2v__1lzdix4 atm_mk_pfqszd__1lzdix4 i1cqnm0r atm_jp_pyzg9w atm_jr_nyqth1 i1de1kle atm_vh_yfq0k3 dir dir-ltr" aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/pictures/ec500a26-609d-440f-b5d0-9e5f92afd478.jpg" data-original-uri="https://a0.muscache.com/pictures/ec500a26-609d-440f-b5d0-9e5f92afd478.jpg" style="--dls-liteimage-object-fit: cover;">
					<div style="color: rgb(51, 56, 59);"><%=roomvo.getRoom_score() %></div>
					<img class="i9if2t0 atm_e2_idpfg4 atm_vy_idpfg4 atm_mk_stnw88 atm_e2_1osqo2v__1lzdix4 atm_vy_1osqo2v__1lzdix4 atm_mk_pfqszd__1lzdix4 i1cqnm0r atm_jp_pyzg9w atm_jr_nyqth1 i1de1kle atm_vh_yfq0k3 dir dir-ltr" aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/pictures/65bb2a6c-0bdf-42fc-8e1c-38cec04b2fa5.jpg" data-original-uri="https://a0.muscache.com/pictures/65bb2a6c-0bdf-42fc-8e1c-38cec04b2fa5.jpg" style="--dls-liteimage-object-fit: cover;">
				</div>
				<div class="pop_section1-2">게스트 선호</div>
				<div class="pop_section1-3">평점, 후기, 신뢰도 기준<br>에어비앤비에서 가장 사랑받는 숙소</div>
				
			</div>
			
			
			<div class="pop_section2">
				<div>
					
					<div class="pop_section2-1">
						<div>후기 <%=countriveiw %>개</div>
						
						<div class="pop_section2-1-1">
						<span>최신순</span>
						<span style="display:none;">높은 평점순</span>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: #222222; stroke-width: 5.33333; overflow: visible; margin-left: 5px;"><path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path></svg>
						</div>
						
					
					</div>
					
					<div class="pop_section2-2">
						<form id="test1" onsubmit="return false">
							<input type="hidden" id="input_orderby" name="orderby" value="최신순"/>
							<input type="text" id = "searchText" placeholder="후기검색" name="searchText">
							<input type="hidden" name="command" value="searchBytext">
							<input type="hidden" name="roomIdx" value="<%= roomvo.getRoom_idx() %>">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path fill="none" d="M13 24a11 11 0 1 0 0-22 11 11 0 0 0 0 22zm8-3 9 9"></path></svg>
						</form>
						<!-- button이 form태그 안에있으면 form태그 해당메서드로 실행되기때문에 url이 달라진다 -->
<!-- 						<button onclick="test1();" id="searchBtn" value="검색">검색</button> -->
					</div>
				</div>
				
				<div id="review-container"><!-- 오렌지  -->
			<%-- // 최신순일때	<% if() %> --%>
				<%for(ReviewVo review : reviewvo){ %>
					<div class="pop_section2-3">
						<div>
							<img src="<%= review.getUser_image()%>"/>
							<div>
								<span class="re-sp1"><%=review.getUser_id() %><br></span>
								<span class="re-sp2"><%=review.getUser_regidence() %></span>
							</div>
						</div>
						
						<div>
							<div>
								<%if(review.getScore() == 5){ %>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<%}else if(review.getScore() == 4){ %>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<%}else if(review.getScore() == 3){ %>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<%}else if(review.getScore() == 2){ %>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<%}else if(review.getScore() == 1){ %>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 9px; width: 9px; fill: var(--f-k-smk-x);"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<%} %>
							</div>
							· <%=review.getWritten_date() %>
						</div>
					
						
						<div>
						<%=review.getReview() %>
						</div>
					</div>
					<%} %>
					<!-- 높은 평점순일때 -->
					
				</div>
				
			</div><!-- pink끝 -->
		</div>
		
</div><!-- 리뷰팝업끝 -->

<!-- 숙소설명팝업 -->
<div id="explain" style="DISPLAY:NONE;"></div>
	<div id="explain_inner"  style="DISPLAY:NONE;">
		<div class="explain_header">
			<button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
		</div>
		
		<div class="explain_section">
		<h2>숙소 설명</h2>
		
			<%if(explainvo.getR_explain()!=null) { %>
				<p><span><%=explainvo.getR_explain() %> </span></p>
			<%} %>
			
			<%if(explainvo.getRoom_char()!=null) { %>
			<span>숙소</span>
		 	<p><span><%=explainvo.getRoom_char() %></span></p>
		 	<%} %>
		 	
		 	<%if(explainvo.getRoom_place()!=null) { %>
		 	<span>게스트 이용 가능 공간/시설</span>
			<p><span><%=explainvo.getRoom_place() %></span></p>
		 	<%} %>
		 
		 	<%if(explainvo.getRoom_etc()!=null) { %>
			<span>기타 주의사항</span>
			<p><span><%=explainvo.getRoom_etc() %></span></p>
			<%} %>
			
			<%if(explainvo.getRoom_register()!=null) { %>
				<span>등록번호</span>	
				<p><span><%=explainvo.getRoom_register() %></span></p>
			<% } %>
			<!--  class="ll4r2nl atm_kd_pg2kvz_1bqn0at dir dir-ltr" -->
		</div>
	</div>
	
	
	
<!-- 숙소설명팝끝 -->

<!-- 위시팝업 -->
<div id="wish_outer"></div>
<div id="wish" >
	<div class="wish_header">
		<button>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;position:absolute;top: 20px;"><path d="m6 6 20 20M26 6 6 26"></path></svg>
		</button>
		<span>위시리스트에 담기</span>
	</div>
	
	<div class="wish_inner1">
		<div class="wish_content_outer">
			<div class="wish_content1">
				<img src="https://a0.muscache.com/im/pictures/032392ef-892e-4e85-bad1-2881905f67f0.jpg?im_w=1200"/>
				<span class="wish_sp1">경기도 안양시</span><br>
				<span class="wish_sp2">0개 저장됨</span>
			</div>
		</div>
<!-- 		<div class="wish_content_outer">
			<div class="wish_content1">
				<img src="https://a0.muscache.com/im/pictures/032392ef-892e-4e85-bad1-2881905f67f0.jpg?im_w=1200"/>
				<span class="wish_sp1">경기도 안양시</span><br>
				<span class="wish_sp2">0개 저장됨</span>
			</div>
		</div>
		<div class="wish_content_outer">
			<div class="wish_content1">
				<img src="https://a0.muscache.com/im/pictures/032392ef-892e-4e85-bad1-2881905f67f0.jpg?im_w=1200"/>
				<span class="wish_sp1">경기도 안양시</span><br>
				<span class="wish_sp2">0개 저장됨</span>
			</div>
		</div>
		<div class="wish_content_outer">
			<div class="wish_content1">
				<img src="images/wish.png"/>
				<span class="wish_sp1">경기도 안양시</span><br>
				<span class="wish_sp2">0개 저장됨</span>
			</div>
		</div> -->
	</div> <!-- inner1끝 -->
	<div class="wish_inner2">
		<div class="wish_content2">새로운 위시리스트 만들기</div>
	</div>
</div>
<!-- 위시팝업 끝 -->

<!-- 위시 카테고리 만들기 -->
<div id="make_wish_back"></div>
<div id="make_wish">
	<div class="make_wish_header">
		<button>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;position:absolute;top: 20px;"><path d="m6 6 20 20M26 6 6 26"></path></svg>
		</button>
		<span>위시리스트 만들기</span>
	</div>
	<form action="" method="get">
		<div class="make_wish_section">
				<input type="text" maxlength='7' name="wishlist_name" placeholder="제목입력"/>
		</div>
		<div class="make_wish_footer">
			<input type="reset" name="wish_reset" class="wish_reset" value="지우기"/>
			<input name="wish_insert" type="submit" class="wish_insert" value="새로 만들기"/>
		</div>
	</form>
</div>
<!-- 위시 카테고리 만들기끝 -->
<!-- 공유하기 팝업 -->
<div id="share_outer"></div>
<div id="share">
	<div class="share_header">
		<button class="head_button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;margin:0 auto;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
		숙소 공유하기
	</div>
	
	<div class="share_inner1">
		<img src="https://a0.muscache.com/pictures/032392ef-892e-4e85-bad1-2881905f67f0.jpg"/>
		<div class="share_content1">
			<%=roomvo.getRoom_name() %> · Terricciola · ★5.0 · 침실 2개 · 침대 3개 · 욕실 1개
		</div>
	</div>
	
	<div class="share_inner2">
		<div class="share_content2">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M25 5a4 4 0 0 1 4 4v17a5 5 0 0 1-5 5H12a5 5 0 0 1-5-5V10a5 5 0 0 1 5-5h13zm0 2H12a3 3 0 0 0-3 3v16a3 3 0 0 0 3 3h12a3 3 0 0 0 3-3V9a2 2 0 0 0-2-2zm-3-6v2H11a6 6 0 0 0-6 5.78V22H3V9a8 8 0 0 1 7.75-8H22z"></path></svg>
			<span>링크 복사</span>	
		</div>
	</div>
	<div class="share_inner2">
		<div class="share_content2">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 32px; width: 32px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><rect width="28" height="24" x="2" y="4" rx="4"></rect><path d="m3 6 10.42 8.81a4 4 0 0 0 5.16 0L29 6"></path></g></svg>
			<span>이메일</span>	
		</div>
	</div>
		
	</div>
	<div style="clear:both;"></div>
</div>

<!-- 공유하기 팝업끝 -->
<!-- 신고팝업 -->
<div id="report_outer"></div>
<div id="report">
	<div class="report_inner1">
		<button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;margin:0 auto;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
		<h2>이 숙소를 신고하시는 이유를 알려주세요.</h2>
		<span>이 내용은 호스트가 볼 수 없습니다</span>
		
		<div class="report_content1">
			부정확하거나 틀린 정보가 있어요
			<input type="radio" class="report_btn" name="repot_btn" value="alt">
		</div>	
		<div class="report_content1">
			실제 숙소가 아닙니다
			<input type="radio" class="report_btn" name="repot_btn" value="alt">
		</div>	
		<div class="report_content1">
			사기입니다
			<input type="radio" class="report_btn" name="repot_btn" value="alt">
		</div>	
		<div class="report_content1">
			불쾌합니다
			<input type="radio" class="report_btn" name="repot_btn" value="alt">
		</div>	
		<div id="report_popup" class="report_content1" style="border-bottom:none;" >
			기타
			<input type="radio" id="reprot_btn2" class="report_btn" name="repot_btn" value="alt2">
		</div>	
	</div>
	
	<div class="report_inner2">
		<div class="report_content2" id="report_content2">
			다음
		</div>
	</div>
</div>
<!-- 신고팝업끝 -->
<!-- 기타이유적기팝업  -->
<div id=report2_outer></div>
	<div id="report2">
		<div class="report2_section">
			<button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible; margin: 0 auto;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
			<h2>기타 이유를 입력해주세요</h2>
			
			<input type="text" placeholder="예) 위생적인 부분이 별로에요">
		</div>
		
		<div class="report2_footer">
			<button>뒤로</button>
			<div class="report2_btn">
				다음
			</div>
		</div>
	</div>
<!-- 기타이유팝업끝 -->

<!-- 숙소편의시설 팝업 -->
<div id="cate_outer"></div>
<div id="cate">
	<div class="cate_header">
		<button><button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;margin:0 auto;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button></button>
	</div>
	
	<div class="cate_section">
		<h2>숙소 편의시설</h2>
		<% int previousCategoryIdx = convenientvo.get(0).getConvenientCategoryIdx(); %>
		<div class="cate_content1">
			<div class="cate_content1-1">아름다운 전망</div>
			<!-- 반복시작 -->
			<% for(ConvenientVo vo : convenientvo) { %>
				<% if(vo.getConvenientCategoryIdx()!=previousCategoryIdx) { %>
		</div>
		<div class="cate_content1">
			<div class="cate_content1-1"><%=  dao3.getConvCate(vo.getConvenientCategoryIdx()) %></div>
				<%
						previousCategoryIdx = vo.getConvenientCategoryIdx();
					} 
				%>
			
			<div class="cate_content1-2">
				<%= vo.getConvenientImage() %>
				<span><%= vo.getConvenientName()%></span>
				<% if(vo.getConvenientEx()!=null) { %>
					<span><%= vo.getConvenientEx() %></span>
				<% } %>
			</div>
			<% } %>
			<!-- 반복끝 -->

 		</div>

		
	</div>
</div>

<!-- 숙소편의시설 팝업끝 -->
</body>
<script>

</script>





</html>