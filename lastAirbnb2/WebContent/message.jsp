<%@page import="java.util.List"%>
<%@page import="esVo.ChatListVo"%>
<%@page import="esVo.UserInfoVo"%>
<%@page import="esDao.LoginDao"%>
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
	MessageDao messDao = new MessageDao();
	ArrayList<EmojiVo> listEmojiVo = (ArrayList<EmojiVo>)(request.getAttribute("listEmojiVo")); 
	ArrayList<ChatListVo> chatList = (ArrayList<ChatListVo>)(request.getAttribute("chatList"));
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메시지 - 에어비앤비</title>
		<link rel="shortcut icon" href="images/logo2.png">
		<link rel ="stylesheet" href="css/message.css"/>
		<script src="js/jquery-3.7.1.min.js"></script>
		<script src="js/message.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                              <div>한국어</div>
                              <div>대한민국</div>
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
					<a href="doairbnb.html"><strong>당신의 공간을 에어비앤비하세요</strong></a>
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
	         	   <input type="hidden" name="url" value="message.jsp"/>
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
		<% if(userIdx > 0) { %>
			<div id="chatting_list" class="fl">
				<div>
					<div class="fl" id="mess">
						<h1>메시지</h1>
					</div>
					<div class="fl" id="mess_svg">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--f-k-smk-x);"><path d="M14 25h4v4h-4zm-4-3h12v-4H10zm-4-7h20v-4H6zM2 4v4h28V4z"></path></svg>
					</div>
					<div id="message_filter">
						<div>모든 메시지</div>
						<div>보관 처리한 메시지(0)</div>
						<div>읽지 않은 메시지(0)</div>
					</div>
				</div>
				<div>
					<div>
						<% for(ChatListVo vo : chatList) { %>
							<div class="chat_list"><a>
								<div class="pro_img fl"><img src="<%=vo.getUserImage()%>"/></div>
								<div class="other_name fl"><%=vo.getUserId() %></div>
								<div class="current_msg fl"><%=messDao.getRecentChat(vo.getMsgListIdx()) %></div>
								<div style="display: none" class="msgListIdx"><%=vo.getMsgListIdx() %></div>
								<!--getRecentChat null값 확인하기-->				
							</a></div><!--chat_list-->
						<% } %>
					</div>
				</div>
			</div>
			<div class="chatting_ fl">
				<div class="chat_top">
					<div>에어비앤비 고객지원 팀</div>
				</div>
				<div class="chat_center">
					<div class="chat_center_middle">
						<h3 class="chat_date">2022.12.13</h3>
						<div class="chat_">
							<div class="profile_pic fl"><img aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" data-original-uri="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" style="--dls-liteimage-object-fit: cover;"></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">민영</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">아아 그럼일단 예약은 확정된거죠?? 계좌에는 따로 내역이 안찍혀서 걱정돼서요ㅠ</div>
							</div>
						</div>
						<div class="chat_">
							<div class="profile_pic fl"><img src="https://a0.muscache.com/im/pictures/user/82d50c81-b40c-4366-9a31-4533061311a7.jpg?aki_policy=profile_x_medium"/></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">chanee</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">네네 예약 되었습니다</div>
							</div>	
						</div>
						<div class="chat_">
							<div class="profile_pic fl"><img aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" data-original-uri="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" style="--dls-liteimage-object-fit: cover;"></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">민영</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">아아 그럼일단 예약은 확정된거죠?? 계좌에는 따로 내역이 안찍혀서 걱정돼서요ㅠ</div>
							</div>
						</div>
						<div class="chat_">
							<div class="profile_pic fl"><img src="https://a0.muscache.com/im/pictures/user/82d50c81-b40c-4366-9a31-4533061311a7.jpg?aki_policy=profile_x_medium"/></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">chanee</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">네네 예약 되었습니다</div>
							</div>
						</div><div class="chat_">
							<div class="profile_pic fl"><img aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" data-original-uri="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" style="--dls-liteimage-object-fit: cover;"></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">민영</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">아아 그럼일단 예약은 확정된거죠?? 계좌에는 따로 내역이 안찍혀서 걱정돼서요ㅠ</div>
							</div>
						</div>
						<div class="chat_">
							<div class="profile_pic fl"><img src="https://a0.muscache.com/im/pictures/user/82d50c81-b40c-4366-9a31-4533061311a7.jpg?aki_policy=profile_x_medium"/></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">chanee</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">네네 예약 되었습니다</div>
							</div>
						</div><div class="chat_">
							<div class="profile_pic fl"><img aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" data-original-uri="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" style="--dls-liteimage-object-fit: cover;"></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">민영</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">아아 그럼일단 예약은 확정된거죠?? 계좌에는 따로 내역이 안찍혀서 걱정돼서요ㅠ</div>
							</div>
						</div>
						<div class="chat_">
							<div class="profile_pic fl"><img src="https://a0.muscache.com/im/pictures/user/82d50c81-b40c-4366-9a31-4533061311a7.jpg?aki_policy=profile_x_medium"/></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">chanee</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">네네 예약 되었습니다</div>
							</div>
						</div><div class="chat_">
							<div class="profile_pic fl"><img aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" data-original-uri="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" style="--dls-liteimage-object-fit: cover;"></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">민영</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">아아 그럼일단 예약은 확정된거죠?? 계좌에는 따로 내역이 안찍혀서 걱정돼서요ㅠ</div>
							</div>
						</div>
						<div class="chat_">
							<div class="profile_pic fl"><img src="https://a0.muscache.com/im/pictures/user/82d50c81-b40c-4366-9a31-4533061311a7.jpg?aki_policy=profile_x_medium"/></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">chanee</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">네네 예약 되었습니다</div>
							</div>
						</div><div class="chat_">
							<div class="profile_pic fl"><img aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" data-original-uri="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?aki_policy=profile_x_medium" style="--dls-liteimage-object-fit: cover;"></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">민영</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">아아 그럼일단 예약은 확정된거죠?? 계좌에는 따로 내역이 안찍혀서 걱정돼서요ㅠ</div>
							</div>
						</div>
						<div class="chat_">
							<div class="profile_pic fl"><img src="https://a0.muscache.com/im/pictures/user/82d50c81-b40c-4366-9a31-4533061311a7.jpg?aki_policy=profile_x_medium"/></div>
							<div class="chat_content_outer fl">
								<div class="chat_time_and_name">
									<div class="name_ fl">chanee</div>
									<div class="time_ fl">오후 4:49</div>
									<div class="see_more fr"><svg viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: var(--fo-jk-r-s);"><path d="m3 9.5c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.82842712 0 1.5-.67157288 1.5-1.5s-.67157288-1.5-1.5-1.5-1.5.67157288-1.5 1.5.67157288 1.5 1.5 1.5zm5 0c.8284271 0 1.5-.67157288 1.5-1.5s-.6715729-1.5-1.5-1.5-1.5.67157288-1.5 1.5.6715729 1.5 1.5 1.5z"></path></svg></div>
								</div>
								<div class="see_more_content"><button class="delete_chat_button">이 메시지 삭제하기</button></div>
								<div class="chat_content_inner">네네 예약 되었습니다</div>
							</div>
						</div>
					</div>
				</div>
				<div class="chat_bottom">
					<div class="chat_bottom_inner">
						<div class="emoji_ fl"><svg aria-label="ì´ëª¨í°ì½ ì í" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><title>ì´ëª¨í°ì½ ì í</title><path d="M15.83 10.997a1.167 1.167 0 1 0 1.167 1.167 1.167 1.167 0 0 0-1.167-1.167Zm-6.5 1.167a1.167 1.167 0 1 0-1.166 1.167 1.167 1.167 0 0 0 1.166-1.167Zm5.163 3.24a3.406 3.406 0 0 1-4.982.007 1 1 0 1 0-1.557 1.256 5.397 5.397 0 0 0 8.09 0 1 1 0 0 0-1.55-1.263ZM12 .503a11.5 11.5 0 1 0 11.5 11.5A11.513 11.513 0 0 0 12 .503Zm0 21a9.5 9.5 0 1 1 9.5-9.5 9.51 9.51 0 0 1-9.5 9.5Z"></path></svg></div>
						<div id="emoji_list">
							<div>
							<%
								for(EmojiVo vo : listEmojiVo){
									if(vo.getEmoji_idx() % 6 == 1)
										out.println("<ul>");
									out.println("<li>" + vo.getEmoji_url() + "</li>");
									if(vo.getEmoji_idx() % 6 == 0)
										out.println("</ul>");
								}
							%>
							</div>
						</div><!--emoji_list-->
						<div class="input_content fl"><input type="text" value="" placeholder="메시지를 입력하세요..." class="input_content_inner"/></div>
						<div class="chat_etc fl">
							<div class="fr"><svg aria-label="ì¢ìì" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><title>ì¢ìì</title><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg></div>
							<div class="fr"><svg aria-label="ì¬ì§ ëë ëìì ì¶ê°" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><title>ì¬ì§ ëë ëìì ì¶ê°</title><path d="M6.549 5.013A1.557 1.557 0 1 0 8.106 6.57a1.557 1.557 0 0 0-1.557-1.557Z" fill-rule="evenodd"></path><path d="m2 18.605 3.901-3.9a.908.908 0 0 1 1.284 0l2.807 2.806a.908.908 0 0 0 1.283 0l5.534-5.534a.908.908 0 0 1 1.283 0l3.905 3.905" fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></path><path d="M18.44 2.004A3.56 3.56 0 0 1 22 5.564h0v12.873a3.56 3.56 0 0 1-3.56 3.56H5.568a3.56 3.56 0 0 1-3.56-3.56V5.563a3.56 3.56 0 0 1 3.56-3.56Z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path></svg></div>
						</div><!--chat_ect-->
					</div><!--chat_bottom_inner-->
				</div><!--chat_bottom-->
			</div><!--chatting_-->
			<% } %>
		</div><!--content-->
	</body>
	<script>
		$(".chat_list").click(function(){
			let command = "showChat";
			let msgListIdx = $(this).find(".msgListIdx").html();
			let userIdx = <%=userIdx %>;
			$.ajax({
				url : 'SesContoller',
				data : {"command" : command, "msgListIdx" : msgListIdx, "userIdx" : userIdx},
				type : 'post',
				success : function(arr){
					let str= "<div class=\"chat_top\">"
							+	"<div>"+arr.get(0).userId+"<div/>"
							+"</div>"
							+"<div class=\"chat_center\">"
							+	"<div class=\"chat_center_middle\">";
					for(let i = 0; i < arr.length; i++){
						str +=   "<div class=\"chat_\">"
								+	"<div class=\"profile_pic fl\"><img src=\""+ arr.get(i).userImage+ "\"/></div>"
								+	"<div class=\"chat_content_outer fl\">"
								+		"<div class=\"chat_time_and_name\">"
								+			"<div class=\"name_ fl\">" + arr.get(i).userId +"</div>"
								+			"<div class=\"time_ fl\">" + arr.get(i).dateTime + "</div>"
								+			
					}
					$(".chatting_").append(str);
				},
				error : function(r, s, e){
					alert("[에러] code : " + r.status
							+ "message :" + r.responseText
							+ "error : " + e);
				}
			});
		});
	</script>
</html>