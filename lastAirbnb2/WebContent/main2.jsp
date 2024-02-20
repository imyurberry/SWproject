<%@page import="swVo.WishlistListVo"%>
<%@page import="swVo.WishlistVo"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="esVo.UserInfoVo"%>
<%@page import="esVo.LanguageVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myDao.*"%>
<%@page import="myVo.*"%>
<%@page import="esDao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//카테고리 목록을 받음12345
	ArrayList<RoomCategoryVo> roomcate = (ArrayList<RoomCategoryVo>)request.getAttribute("list1"); // roomcate는 
	int paramCate = (Integer)request.getAttribute("cateIdx");   // cate= 국립공원
	ArrayList<RepresentRoomListVo> roomList = (ArrayList<RepresentRoomListVo>)request.getAttribute("roomVo"); 
	ArrayList<WishlistListVo> listWish = (ArrayList<WishlistListVo>) request.getAttribute("listWish");
    RealWishlistDao wDao = new RealWishlistDao();
	
	Main2Dao dao = new Main2Dao();
	// 광화문 위도경도
	double currentLatitude = 126.96033;
	double currentLongitude = 37.264842;
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
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>여행은 살아보는거야-에어비앤비</title>

	<link rel="stylesheet" href="./css/reset.css">
   <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
   <link rel="stylesheet" href="css/main2.css"/>
   <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>   
   <link rel="stylesheet" type="text/css" href="css/slick.css"/>
   <link rel="stylesheet" type="text/css" href="css/slick-theme.css"/>   
	<script src = "js/jquery-3.7.1.min.js"></script>
	<script src = "js/jquery-ui.min.js"></script>
   <script src = "js/main2.js"></script>
	<!-- 날짜 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  	<!--슬릭  -->
   <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>   
</head>	

<body>

<div id = mini_box>
지도 표시하기
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px;"><path d="M31.25 3.75a2.29 2.29 0 0 0-1.01-1.44A2.29 2.29 0 0 0 28.5 2L21 3.67l-10-2L2.5 3.56A2.29 2.29 0 0 0 .7 5.8v21.95a2.28 2.28 0 0 0 1.06 1.94A2.29 2.29 0 0 0 3.5 30L11 28.33l10 2 8.49-1.89a2.29 2.29 0 0 0 1.8-2.24V4.25a2.3 2.3 0 0 0-.06-.5zM12.5 25.98l-1.51-.3L9.5 26H9.5V4.66l1.51-.33 1.49.3v21.34zm10 1.36-1.51.33-1.49-.3V6.02l1.51.3L22.5 6h.01v21.34z"></path></svg>
</div>
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
			<div id="center" class="fl">
				<div class= "btns">
		          <button class ="btn1">
		            <div>어디든지</div>
		          </button>
		          <button class ="btn2">
		                <div>언제든 일주일</div>
		          </button>
		          <button class ="btn3">
		              <div>게스트 추가</div>
		              <div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:12px;width:12px;stroke:currentColor;stroke-width:5.333333333333333;overflow:visible" aria-hidden="true" role="presentation" focusable="false"><path fill="none" d="M13 24a11 11 0 1 0 0-22 11 11 0 0 0 0 22zm8-3 9 9"></path></svg></div>
		          </button> 
		        </div>
			</div><!--header_center--> 
			<div id="center2" class="fl" style="display:none;">
		         <div class="btn4">숙소</div>
		         <div class="btn5">체험</div>
		         <div class="btn6">온라인 체험</div>
   			</div>
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
	         	   <input type="hidden" name="url" value="Main2"/>
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
<!-- header2 -->
<div id="header2" style="display:none;">

<!-- ----------세부창 -->
	<div id="head_pop1" style="display:none;"><!--오랜지  -->
		<div class="pop_content1"><!-- 하늘색 -->
			<div class="pop_content1-1">최근 검색 내역</div>
			<div class="pop_content1-2">
			
				<div class="pop_content1-3">
					<div class= "pop_content1-4">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 22px; width: 22px; fill: currentcolor;"><path d="M16 .33a15.67 15.67 0 1 1 0 31.34A15.67 15.67 0 0 1 16 .33zm0 2a13.67 13.67 0 1 0 0 27.34 13.67 13.67 0 0 0 0-27.34zm1 3v10.1l8.74 5.04-1 1.73L15 16.58V5.33z"></path></svg>
					</div>
					<div class= "pop_content1-5">
						<span>제주도 · 숙소</span><br>
						언제든일주일
					</div>
				</div>
				
				<div class="pop_content1-3">
					<div class= "pop_content1-4">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 22px; width: 22px; fill: currentcolor;"><path d="M16 .33a15.67 15.67 0 1 1 0 31.34A15.67 15.67 0 0 1 16 .33zm0 2a13.67 13.67 0 1 0 0 27.34 13.67 13.67 0 0 0 0-27.34zm1 3v10.1l8.74 5.04-1 1.73L15 16.58V5.33z"></path></svg>
					</div>
					<div class= "pop_content1-5">
						<span>용산구 · 숙소</span><br>
						 12월 14일~16일
					</div>
				</div>
				
			</div>
		</div><!-- 왼쪽끝 -->
		
		<div class="pop_content2" >
			<div class="pop_content2-1">지역으로 검색하기</div>
			<div class="pop_content2-2"> <!-- 지역그리드 -->
				<div class="pop_content2-3">
					<img src="https://a0.muscache.com/pictures/f9ec8a23-ed44-420b-83e5-10ff1f071a13.jpg"/>
					<span>유연한 검색</span>
				</div>
				<div class="pop_content2-3">
					<img src="https://a0.muscache.com/im/pictures/d77de9f5-5318-4571-88c7-e97d2355d20a.jpg"/>
					<span>아시아</span>
				</div>
				<div class="pop_content2-3">
					<img src="https://a0.muscache.com/pictures/f9ec8a23-ed44-420b-83e5-10ff1f071a13.jpg"/>
					<span>오세아니아</span>
				</div>
				<div class="pop_content2-3">
					<img src="https://a0.muscache.com/im/pictures/4e762891-75a3-4fe1-b73a-cd7e673ba915.jpg"/>
					<span>아메리카</span>
				</div>
				<div class="pop_content2-3">
					<img src="https://a0.muscache.com/pictures/f9ec8a23-ed44-420b-83e5-10ff1f071a13.jpg"/>
					<span>아프리카</span>
				</div>
				<div class="pop_content2-3">
					<img src="https://a0.muscache.com/im/pictures/7b5cf816-6c16-49f8-99e5-cbc4adfd97e2.jpg"/>
					<span>유럽</span>
				</div>
			</div>
		</div>
	</div>
<!-- 세부차1번끝  -->
<div id="head_pop2" style="display:none;">

	<div class="hpop_content1">
		<div class="hpop_content1-1">
			<div>날짜 지정</div>
			<div>월 단위</div>
			<div>유연한 일정</div>
		</div>
	</div>
	
	<div class="hpop_content2">
		<div class="hpop_content2-1">
		 	<div id="dp1" name="dp1" class="datepicker"></div>
		</div>
		<div class="hpop_content2-2">
			<div id="dp2" name="dp2" class="datepicker2"></div>
		</div>
	</div>
	 
	<div class="hpop_content3">
		<div class="hpop_content3-1">정확한날짜</div>
		<div class="hpop_content3-2"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 2.66667; overflow: visible;"><path fill="none" d="M16 4v16m-8-8h16M8 26h16"></path></svg>1일</div>
		<div class="hpop_content3-2"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 2.66667; overflow: visible;"><path fill="none" d="M16 4v16m-8-8h16M8 26h16"></path></svg> 2일</div>
		<div class="hpop_content3-2"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 2.66667; overflow: visible;"><path fill="none" d="M16 4v16m-8-8h16M8 26h16"></path></svg> 3일</div>
		<div class="hpop_content3-2"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 2.66667; overflow: visible;"><path fill="none" d="M16 4v16m-8-8h16M8 26h16"></path></svg> 7일</div>
	</div>
</div>
<!-- 세부창2끝 -->
<div id="head_pop3" style="display:none;">

	<div class="hpop_content1">
		<div class="hpop_content1-1">
			<div>날짜 지정</div>
			<div>월 단위</div>
			<div>유연한 일정</div>
		</div>
	</div>
	
	<div class="hpop_content4">
		<span>숙박기간을 선택해주세요</span>
		<div class="hpop_content4-1">
			<div>주말</div>
			<div>일주일</div>
			<div>한 달</div>
		</div>
	</div>
	
	<div  class="hpop_content5">
		<span>여행날짜를 선택하세요</span>
		<div class="hpop_content5-1">
			<div>
				<img src="https://a0.muscache.com/pictures/cf82c9bc-520a-4486-9be4-1f0927972381.jpg" />
				<span>12월</span>
			</div>
			<div>
				<img src="https://a0.muscache.com/pictures/cf82c9bc-520a-4486-9be4-1f0927972381.jpg" />
				<span> 1월</span>
			</div>
			<div>
				<img src="https://a0.muscache.com/pictures/cf82c9bc-520a-4486-9be4-1f0927972381.jpg" />
				<span> 2월</span>
			</div>
			<div>
				<img src="https://a0.muscache.com/pictures/cf82c9bc-520a-4486-9be4-1f0927972381.jpg" />
				<span> 3월</span>
			</div>
			<div>
				<img src="https://a0.muscache.com/pictures/cf82c9bc-520a-4486-9be4-1f0927972381.jpg" />
				<span> 4월</span>
			</div>
			<div>
				<img src="https://a0.muscache.com/pictures/cf82c9bc-520a-4486-9be4-1f0927972381.jpg" />
				<span> 5월</span>
			</div>
		</div>
		<div class="hpop_content5-2">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 5.33333; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
		</div>
	</div>

</div>
<!-- 세부창3끝 -->
<div id="head_pop4" style="display:none;" >
	<div class="hpop_content6"><!--오렌지  -->
			<div>
				<span class="hop_content6-1">성인</span>
				<span class="hop_content6-2">13세 이상</span>
			</div>
			<div>
				<button class= "hop4_btn1"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg></button> 
				<input type="text" class="hop4_input" value="0"/>
				<button class="hop4_btn2"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg></button>
			</div>
	</div>
	<div class="hpop_content6"><!--오렌지  -->
			<div>
				<span class="hop_content6-1">어린이</span>
			<span class="hop_content6-2">2~12세</span>
			</div>
			<div>
				<button class= "hop4_btn1"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg></button> 
				<input type="text" class="hop4_input" value="0"/>
				<button class="hop4_btn2"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg></button>
			</div>
	</div>
	<div class="hpop_content6"><!--오렌지  -->
			<div>
				<span class="hop_content6-1">유아</span>
				<span class="hop_content6-2">2세 미만</span>
			</div>
			<div>
				<button class= "hop4_btn1"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg></button> 
				<input type="text" class="hop4_input" value="0"/>
				<button class="hop4_btn2"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg></button>
			</div>
	</div>
		<div class="hpop_content6" style="border-bottom:none;"><!--오렌지  -->
			<div>
				<span class="hop_content6-1">반려동물</span>
				<span class="hop_content6-3">보조동물을 동반하시나요?</span>
			</div>
			<div>
				<button class= "hop4_btn1"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg></button> 
				<input type="text" class="hop4_input" value="0"/>
				<button class="hop4_btn2"><svg viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;margin-left: 9.2px;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg></button>
			</div>
	</div>
</div>
<!--세부창4끝  -->
<!--세부창 끝  -->	

	<div id="header_inner">
		<div class="head_content1">
			<span>여행지</span>
			<input type="text" id="head_input" name="email" placeholder="여행지 검색"/>
		</div>
		<div class="head_content2">
			<span>체크인</span>
			<span>날짜추가</span>
		</div>
		<div class="head_content3">
			<span>체크아웃</span>
			<span>날짜추가</span>
		</div>
		<div class="head_content4">
			<span>여행자</span>
			<span>게스트 추가</span>
			<div class="head_svg">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="M13 24a11 11 0 1 0 0-22 11 11 0 0 0 0 22zm8-3 9 9"></path></svg>
			</div>
		</div>
		
		
	</div>
</div>
<!-- header2끝  -->
<div id ="section">
	<div id="menu">
	 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: inline;fill: none;height: 12px;width: 12px; stroke: currentcolor;stroke-width: 5.33333;overflow: visible;position: absolute;left: 62px;top: 29px;"><path fill="none" d="M20 28 8.7 16.7a1 1 0 0 1 0-1.4L20 4"></path></svg>
		<div id ="cate">
			<!--  -->
			<% for( RoomCategoryVo vo : roomcate ){ %>
				<div class="w hover">
					<span>
						<img src="<%= vo.getCategory_icon()%>"/>
						<div><span><%=vo.getCategory_name() %></span></div>
						<div style="display:none;"><%=vo.getRoom_category_idx() %></div>
<!-- 					<div class="bar" style="width:62.5625px; height:2px;background-color:black; visibility:hidden; "></div> -->
					</span>
				</div>
			<% } %>
		</div><!-- 카테끝 -->
		 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; cursor : pointer; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 5.33333; overflow: visible;position: absolute;top: 28.5px;right: 160px;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
		<div id="menu_btn">
			<button>
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:16px;width:16px;stroke:currentColor;stroke-width:3;overflow:visible" aria-hidden="true" role="presentation" focusable="false"><path fill="none" d="M7 16H3m26 0H15M29 6h-4m-8 0H3m26 20h-4M7 16a4 4 0 1 0 8 0 4 4 0 0 0-8 0zM17 6a4 4 0 1 0 8 0 4 4 0 0 0-8 0zm0 20a4 4 0 1 0 8 0 4 4 0 0 0-8 0zm0 0H3"></path></svg>
				<a>필터</a>
			</button>
		</div>
	</div><!-- 메뉴끝 -->
	
</div>



<!-- 내용 -->
<div id="content_outer">
	<div id="content">
<!-- 		<a>
			<div>
				<img src="https://a0.muscache.com/im/pictures/34822e87-1915-4f1e-9ae0-a5b0cccbce1e.jpg?im_w=1200"/>
				<button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: rgba(0, 0, 0, 0.5); height: 24px; width: 22.7px; stroke:white; stroke-width: 2; overflow: visible;"><path d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16 8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z"></path></svg></button>
			</div>
			<div class="ps">
				<div>토스카나 | 수영장과 레스토랑이 있는 농장 체험 숙박</div>
				<span>★  5.0</span>
				<div>치악산국립공원에서 60km</div>
				<div>12월 3일~8일</div>
				<div><b>₩294,455</b> /박</div>
			</div>
		</a> -->
		<% for(RepresentRoomListVo r : roomList){ %>
		<% double roomLatitude = r.getLatitude(); 
		   double roomLongitude = r.getLongitude();
		%>
		<%
		double distance = dao.checkDistance(currentLatitude, currentLongitude, roomLatitude, roomLongitude);
		if(paramCate == 8 || paramCate == 2) {
			distance = dao.checkDistance1(currentLatitude, currentLongitude, roomLatitude, roomLongitude); 
		}
		%>
			<a>	
				<div>
					<img src="<%=r.getImg1() %>"/>
					<svg class ="heart_empty" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: rgba(0, 0, 0, 0.5); height: 24px; width: 22.7px; stroke:white; stroke-width: 2; overflow: visible;"><path d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16 8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z"></path></svg>
				</div>
				<div class="ps">
					<div><%= r.getRoomName()%></div>
					<span>★<%= r.getRoomScore()%></span>
					<div>광화문에서 <%=distance %>km</div>
					<div>12월 3일~8일</div>
					<div><b>₩<%= new DecimalFormat("###,###").format(r.getRoomPrice()) %></b> /박</div>
				</div>
				<div class="room_idx" style="display:none;"><%=r.getRoomIdx()%></div>
			</a>
		<% } %>
		
	</div>
</div>
<!-- 위시팝업 -->
<input type="hidden" id="heart_val"/>
<div id="wish_outer"></div>
<div id="wish" >
	<div class="wish_header">
		<button>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;position:absolute;top: 20px;"><path d="m6 6 20 20M26 6 6 26"></path></svg>
		</button>
		<span>위시리스트에 담기</span>
	</div>
	
	<div class="wish_inner1">
		<%if(listWish != null){ %>
		<% for(WishlistListVo vo : listWish) { %> 
		<div class="wish_content_outer">
			<div class="wish_content1">
				<img src="<%=vo.getImg()%>"/>
				<span class="wish_sp1"><%=vo.getBiglistName() %></span><br>
				<span class="wish_sp2"><%=vo.getCnt() %>개 저장됨</span>
			</div>
		</div>
		<% } %>
		<% } %>
<%--
		<div class="wish_content_outer">
			<div class="wish_content1">
				<img src="https://a0.muscache.com/im/pictures/032392ef-892e-4e85-bad1-2881905f67f0.jpg?im_w=1200"/>
				<span class="wish_sp1">경기도 안양시</span><br>
				<span class="wish_sp2">0개 저장됨</span>
			</div>
		</div>
--%>
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
		</div>
	-->
		
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


<!--필터팝업  -->
<div id="filter_outer" style="display:hidden;"></div>
<div id="filter" style="display:hidden;">
	<div class="filter_header">
		<button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
		필터
	</div>
	<div class="filter_content">
		<div class="filter_content1">
			<h1>숙소유형</h1>
			<span>방, 집 전체 등 원하는 숙소 유형을 검색해보세요.</span>
			<div class="fil_btns">
				<button >모든유형</button>
				<button >방</button>
				<button >집 전체</button>
			</div>
		</div>
		
		<form action="lmyController" method="post">
			<input type="hidden" name="command" value="filter_room"/>
			<input type="hidden" name="category_idx" value="<%=paramCate%>"/>
			<div class="filter_content2">
				<h1>가격범위</h1>
				<span>1박 요금(수수료 및 세금 포함)</span>
				<div class="filter_content2-2">
					<div class="filter_price">
					
						<div class="filter_price_input">
							<span class="filter_span">최저</span><br>
							<span class="filter_span2">R</span>
							<input type="text" id="fist_price" name="min_price">
						</div>
						<span></span>
						<div class="filter_price_input">
							<span class="filter_span">최고</span><br>
							<span class="filter_span2">R</span>
							<input type="text" id="fist_price" name="max_price">
						</div>
						
					</div>
				</div>
			</div>
			
			<script>
			
			</script>
			
			<div class="filter_content3">
				<input type="hidden" name="fil3_btns" value="0"/>
				<input type="hidden" name="fil3_btns2" value="0"/>
				<input type="hidden" name="fil3_btns3" value="0"/>
				<h1>침실과 침대</h1>
				<span>침실</span>
				<div class="fil3_btns">
					<button type="button">상관없음</button>
					<button type="button">1</button>
					<button type="button">2</button>
					<button type="button">3</button>
					<button type="button">4</button>
					<button type="button">5</button>
					<button type="button">6</button>
					<button type="button">7</button>
					<button type="button">8+</button>
				</div>
				
				<span>침대</span>
				<div class="fil3_btns2">
					<button type="button">상관없음</button>
					<button type="button">1</button>
					<button type="button">2</button>
					<button type="button">3</button>
					<button type="button">4</button>
					<button type="button">5</button>
					<button type="button">6</button>
					<button type="button">7</button>
					<button type="button">8+</button>
				</div>
				
					
				<span>욕실</span>
				<div class="fil3_btns3">
					<button type="button">상관없음</button>
					<button type="button">1</button>
					<button type="button">2</button>
					<button type="button">3</button>
					<button type="button">4</button>
					<button type="button">5</button>
					<button type="button">6</button>
					<button type="button">7</button>
					<button type="button">8+</button>
				</div>
			</div>
	<div class="filter_footer">
		<!-- <div class="filter_footer1"><span>전체 해제</span></div> -->
		<!-- <div>숙소 n개 보기</div> -->
		<input type="reset" value="전체 해제" id="reset"/>
		<input type="submit" value="속소 보기" id="Show_all_lists"/>
	</div>
	</form>
	
</div>

<!-- 필터팝업 -->

<!-- 슾파이더 -->

<script>
		$(function() {
			//슬릭
			$('#cate').slick({
				slidesToShow: 17,
			    slidesToScroll: 17
			    
			});
			
			//카테고리 인덱스mainservlet으로 넘겨주기
			$("#cate .w").click(function() {
				let selectedCate = $(this).find("span").find("div:nth-child(3)").text();
				location.href="lmyController?command=main2&cate=" + selectedCate;
			});	
			
	         let cate = <%=paramCate%>;
	         $(".w > span > div:nth-child(3)").each(function(idx, item) {
	            //console.log($(item).text());
	            if($(item).text() == cate) {
	               $(item).parents(".w").removeClass("hover").addClass("on");
	            }
	         });
	         
	         // 숙소idx 파라미터 넘기기
	    	$("#content>a").click(function(){
	    		let roomIdx = $(this).find(".room_idx").text();
	    		location.href="lmyController?command=main3&roomIdx=" + roomIdx;
	    	 });
	         
	         
	         // 필터 ajax
	         //필터에있는것들 form으로 통째로 다 감싸주기
/* 	         $(".filter_footer>div:nth-child(2)").click(function(){
	        	 var formData = $("#form1").serialize(); //form안에있는 정보 정렬햊

	             $.ajax({
	                 cache : false,
	                 url : "${pageContext.request.contextPath}/testForm1", // 요기에
	                 type : 'POST', 
	                 data : formData, 
	                 success : function(data) {
	                     var jsonObj = JSON.parse(data);
	                 }, // success 
	         
	                 error : function(xhr, status) {
	                     alert(xhr + " : " + status);
	                 }
	             }); // $.ajax */
	    
	         
	         
	         
		});
</script>
</body>

</html>