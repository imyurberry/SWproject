<%@page import="esDao.LoginDao"%>
<%@page import="esVo.UserInfoVo"%>
<%@page import="esVo.EmojiVo"%>
<%@page import="esDao.MessageDao"%>
<%@page import="esVo.LanguageVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="esDao.LanguageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	LoginDao LoginDao = new LoginDao();
	LanguageDao langDao = new LanguageDao();
	ArrayList<LanguageVo> listLanguageVo = langDao.getLanguage();
	int userIdx = 0;
	UserInfoVo userList = null;
	int howManyAlarm = 0;
	try{
		userIdx = (Integer)request.getSession().getAttribute("userIdx"); //--> 로그인창 만들면 이걸로 적용하기	
		userList = LoginDao.getUserInfoBy(userIdx);
		howManyAlarm = (Integer)LoginDao.getCountAlarm(userIdx);
	} catch (NullPointerException e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>계정 관리 - 에어비앤비</title>
		<link rel="shortcut icon" href="images/logo2.png">
		<link rel ="stylesheet" href="css/account.css"/>
		<script src="js/jquery-3.7.1.min.js"></script>
		<script src="js/account.js"></script>
	</head>
	
	<body id="body">
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
         
            <form id="jm_form" action="SesController" method="post">
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
	         	   <input type="hidden" name="url" value="account.jsp"/>
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
      		<form method="post" class="join_user_form" action="SesController">
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
		
		<div id="content">
			<div>
				<div id="content_top">
					<div>계정</div>
					<div>
					<% if(userIdx > 0) { %>
						<div class="fl"><%=userList.getUser_id() %></div>
						<span class="fl"><%=userList.getEmail() %> · </span>
						<a class="fl" href="profile_timeline.jsp?thisUserIdx=<%=userIdx%>">프로필로 이동</a>
					<% } else { %>
						<div class="fl" style="width: 200px;">로그인부터 해주세요.</div>
					<% } %>
					</div><!--ê³ì  ë°ì ì´ë¦ë¤-->
				</div><!--content_top-->
				<div id="content_center">
					<div>
						<a class="fl" href="privacy.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M29 5a2 2 0 0 1 2 1.85V25a2 2 0 0 1-1.85 2H3a2 2 0 0 1-2-1.85V7a2 2 0 0 1 1.85-2H3zm0 2H3v18h26zm-3 12v2h-8v-2zm-16-8a3 3 0 0 1 2.5 4.67A5 5 0 0 1 15 20h-2a3 3 0 0 0-2-2.83V14a1 1 0 0 0-2-.12v3.29A3 3 0 0 0 7 20H5a5 5 0 0 1 2.5-4.33A3 3 0 0 1 10 11zm16 4v2h-8v-2zm0-4v2h-8v-2z"></path></svg></div><!--svg-->	
							<div class="explain46">
								<div>개인정보</div>
								<div>개인정보 및 연락처를 알려주세요</div>
							</div>
						</div></a>
						<a class="fl" href="OutOfService.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="m16 .8.56.37C20.4 3.73 24.2 5 28 5h1v12.5C29 25.57 23.21 31 16 31S3 25.57 3 17.5V5h1c3.8 0 7.6-1.27 11.45-3.83L16 .8zm-1 3a22.2 22.2 0 0 1-9.65 3.15L5 6.97V17.5c0 6.56 4.35 11 10 11.46zm2 0v25.16c5.65-.47 10-4.9 10-11.46V6.97l-.35-.02A22.2 22.2 0 0 1 17 3.8z"></path></svg></div>
							<div class="explain64">
								<div>로그인 및 보안</div>
								<div>비밀번호를 변경하고 계정을 안전하게 보호하세요</div>
							</div>
						</div></a>
						<a class="fl" href="OutOfService.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M25 4a2 2 0 0 1 2 1.85V8h2.04c1.04 0 1.88.82 1.96 1.85V26c0 1.05-.8 1.92-1.81 2H6.96a1.98 1.98 0 0 1-1.95-1.85L5 26v-2H3a2 2 0 0 1-2-1.85V6a2 2 0 0 1 1.85-2H3zm2 18a2 2 0 0 1-1.85 2H7v2h22V10h-2zM25 6H3v16h22zm-3 12a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm-8-8a4 4 0 1 1 0 8 4 4 0 0 1 0-8zm0 2a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM6 8a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path></svg></div>
							<div class="explain64">
								<div>결제 및 대금 수령</div>
								<div>결제, 대금 수령, 쿠폰, 기프트카드를 검토해주세요.</div>
							</div>
						</div></a>
					</div>
					<div>
						<a class="fl" href="OutOfService.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M28.41 10 20 1.59A2.01 2.01 0 0 0 18.59 1H8a5 5 0 0 0-5 5v20a5 5 0 0 0 5 5h16a5 5 0 0 0 5-5V11.41a1.99 1.99 0 0 0-.59-1.41ZM19 3.41 26.59 11H22a3 3 0 0 1-3-3ZM27 26a3 3 0 0 1-3 3H8a3 3 0 0 1-3-3V6a3 3 0 0 1 3-3h9v5a5 5 0 0 0 5 5h5Z"></path></svg></div>
							<div class="explain46">
								<div>세금</div>
								<div>납세자 정보 및 세금 서류 관리</div>
							</div>
						</div></a>
						<a class="fl" href="OutOfService.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M30.83 3.73a2 2 0 0 0-2.64-1.02L11.79 10H7a6 6 0 0 0-.26 12H11v7h2v-6.46l15.19 6.75A2 2 0 0 0 31 27.46V4.54a2.02 2.02 0 0 0-.17-.81ZM6.82 20A4 4 0 0 1 7 12h4v8H7.02ZM29 27.46l-16-7.1v-8.71l16-7.11Z"></path></svg></div>
							<div class="explain46">
								<div>알림</div>
								<div>알림 환경설정 및 연락 방식을 선택하세요</div>
							</div>
						</div></a>
						<a class="fl" href="OutOfService.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M16 27A15.57 15.57 0 0 1 1.48 16.94l-.1-.3.13-.51a15 15 0 0 1 28.98-.01l.14.53-.11.3A15.58 15.58 0 0 1 16 27zM3.47 16.53a13.5 13.5 0 0 0 25.06 0 13 13 0 0 0-25.06 0zM16 21a5 5 0 1 1 5-5 5 5 0 0 1-5 5zm0-8a3 3 0 1 0 3 3 3 3 0 0 0-3-3z"></path></svg></div>
							<div class="explain64">
								<div>개인정보 및 공개 설정</div>
								<div>개인정보, 연결된 서비스 및 데이터 공유 설정 관리</div>
							</div>
						</div></a>
					</div><!--íìì ëë²ì§¸ div-->
					<div>
						<a class="fl" href="OutOfService.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M24 31a7 7 0 0 0 0-14H8a7 7 0 0 0 0 14zm5-7a5 5 0 1 1-5-5 5 5 0 0 1 5 5zM3 24a5 5 0 0 1 5-5h11.11a6.98 6.98 0 0 0 0 10H8a5 5 0 0 1-5-5zM24 1H8a7 7 0 0 0 0 14h16a7 7 0 0 0 0-14zM3 8a5 5 0 1 1 5 5 5 5 0 0 1-5-5zm21 5H12.89a6.98 6.98 0 0 0 0-10H24a5 5 0 0 1 0 10z"></path></svg></div>
							<div class="explain46">
								<div>글로벌 환경 설정</div>
								<div>기본 언어, 통화, 시간대 설정하기</div>
							</div>
						</div></a>
						<a class="fl" href="OutOfService.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M26 2a1 1 0 0 1 .92.61l.04.12 2 7a1 1 0 0 1-.85 1.26L28 11h-3v5h6v2h-2v13h-2v-2.54a3.98 3.98 0 0 1-1.73.53L25 29H7a3.98 3.98 0 0 1-2-.54V31H3V18H1v-2h5v-4a1 1 0 0 1 .88-1h.36L6.09 8.4l1.82-.8L9.43 11H12a1 1 0 0 1 1 .88V16h10v-5h-3a1 1 0 0 1-.99-1.16l.03-.11 2-7a1 1 0 0 1 .84-.72L22 2h4zm1 16H5v7a2 2 0 0 0 1.7 1.98l.15.01L7 27h18a2 2 0 0 0 2-1.85V18zm-16-5H8v3h3v-3zm14.24-9h-2.49l-1.43 5h5.35l-1.43-5z"></path></svg></div>
							<div class="explain64">
								<div>출장</div>
								<div>회사 이메일을 입력하면 출장에서 혜택을 누리실 수 있습니다.</div>
							</div>
						</div></a>
						<a class="fl" href="OutOfService.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M27 5h-4a2 2 0 0 0-2 2v4h-4V3a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v8H5a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h22a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2zM9 29H5V13h4zm6 0h-4V3h4zm6 0h-4V13h4zm6 0h-4V7h4z"></path></svg></div>
							<div class="explain64">
								<div>전문 호스팅 도구</div>
								<div>에어비앤비에서 여러 숙소를 관리하신다면 전문 도구를 이용해보세요.</div>
							</div>
						</div></a>
					</div>
					<div>
						<a class="fl" href="OutOfService.jsp"><div>
							<div class="svg"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M28 2a2 2 0 0 1 2 1.85V28a2 2 0 0 1-1.85 2H4a2 2 0 0 1-2-1.85V4a2 2 0 0 1 1.85-2H4zM13.59 17H4v11h11v-9.59l-4.3 4.3-1.4-1.42zM28 17h-9.59l4.3 4.3-1.42 1.4L17 18.42V28h11zM15 4H4v11h3.54a4 4 0 0 1 6.28-4.84c.29.28.68.85 1.18 1.74zm6 7c-.53 0-.98.17-1.42.6-.21.2-.63.87-1.22 1.98l-.25.47-.5.95H21a2 2 0 0 0 1.98-1.7l.01-.15L23 13a2 2 0 0 0-2-2zm7-7H17v7.9c.5-.89.89-1.46 1.18-1.74A4 4 0 0 1 24.46 15H28zm-17 7a2 2 0 0 0-2 2v.15A2 2 0 0 0 11 15h3.38l-.49-.95-.36-.69c-.54-.98-.91-1.58-1.1-1.76-.45-.43-.9-.6-1.43-.6z"></path></svg></div>
							<div class="explain64">
								<div>추천 크레딧 및 쿠폰</div>
								<div>추천 크레딧과 쿠폰이 있습니다. 자세히 알아보기</div>
							</div>
						</div></a>
					</div>
				</div><!--content_center-->
				<div id="content_bottom">
					<div>계정을 비활성화하셔야 하나요?</div>
					<a href="OutOfService.jsp">지금 처리하기</a>
				</div>
			</div>
		</div><!--content-->
		
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
	</body>
</html>