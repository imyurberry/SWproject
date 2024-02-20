<%@page import="myDao.RealWishlistDao"%>
<%@page import="swVo.WishlistListVo"%>
<%@page import="esVo.UserInfoVo"%>
<%@page import="esVo.LanguageVo"%>
<%@page import="esDao.LanguageDao"%>
<%@page import="esDao.LoginDao"%>
<%@page import="swVo.ExpOnlineVo"%>
<%@page import="swVo.ExpReviewVo"%>
<%@page import="swVo.ExpCateVo"%>
<%@page import="swVo.ExperienceVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="swDao.ExperienceDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	// Experience
	ExperienceVo vo = (ExperienceVo)request.getAttribute("experienceVO");
	ArrayList<ExperienceVo> listExpVo = (ArrayList<ExperienceVo>)request.getAttribute("listExperienceVo");
	String expCate = (String)request.getAttribute("expCate");
	ArrayList<ExperienceVo> listInfoExp = (ArrayList<ExperienceVo>)request.getAttribute("listInfoExp");
	
	// Review
	ExpReviewVo rVo = (ExpReviewVo)request.getAttribute("expreviewVO");
	ArrayList<ExpReviewVo> listReviewVo = (ArrayList<ExpReviewVo>)request.getAttribute("listExpReview");
	
	int idx = (Integer)request.getAttribute("idx");
	
	// Online
	ExpOnlineVo oVo = (ExpOnlineVo)request.getAttribute("exponlineVO");
	ArrayList<ExpOnlineVo> listOnlineVo = (ArrayList<ExpOnlineVo>)request.getAttribute("listOnlineType");
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
	
	// Wishlist
	ArrayList<WishlistListVo> listWish = (ArrayList<WishlistListVo>) request.getAttribute("listWish");
    RealWishlistDao wDao = new RealWishlistDao();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title><%= vo.getExpName() %></title>
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="slick/slick-theme.css"/>
		<link rel="stylesheet" href="slick/slick.css"/>
		<link rel="stylesheet" href="css/ExpInfo.css"/>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" href="JS/jquery-ui.min.css"/>
		<script src="js/jquery-3.7.1.min.js"></script>
		<script src="js/ExpInfo.js"></script>
		<script src="JS/jquery-ui.min.js"></script>
		
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
		<script> 
			let max_member= <%= vo.getN() %>;
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
         
            <form id="jm_form" action="LswController" method="post">
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
      		<form method="post" class="join_user_form" action="Controller">
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
		
		<div id="exp_all_body">
			<div id="online_all_view">
				<a id="online_av" href="ExpMain.jsp" style="text-decoration: underline;">온라인 체험 모두 보기</a>
			</div>
			
			<div id="ei_title">
				<svg class="fl" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: currentcolor;"><path d="M13.5 1A2.5 2.5 0 0 1 16 3.34v7.16a2.5 2.5 0 0 1-2.34 2.5h-2.41v1.5H13V16H3v-1.5h1.75V13H2.5A2.5 2.5 0 0 1 0 10.66V3.5A2.5 2.5 0 0 1 2.34 1H13.5zM9.75 13h-3.5v1.5h3.5V13zm-7-6.5c-.17 0-.34.01-.5.03L2 6.57v1.56a2.25 2.25 0 0 1 2.93 2.7l-.06.17h1.56a3.75 3.75 0 0 0-3.68-4.5zm0-3c-.17 0-.34 0-.5.02L2 3.54v1.51a5.25 5.25 0 0 1 5.98 5.7l-.03.25h1.5a6.75 6.75 0 0 0-6.7-7.5zm0 6a.75.75 0 1 0 0 1.5.75.75 0 0 0 0-1.5z"></path></svg>
				<div><b class="fl ol_txt">온라인 체험</b><br/></div>
				<!-- <svg class="fl translate" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-label="자동 번역된 이름: 현지 전문가와 함께하는 완벽한 맞춤 일본 여행 계획을 세워보세요" role="img" focusable="false" style="display: block; height: 24px; width: 24px; fill: currentcolor;"><path d="M9 0a1 1 0 0 1 1 .88V6h5a1 1 0 0 1 1 .88V15a1 1 0 0 1-.88 1H7a1 1 0 0 1-1-.88V10H1a1 1 0 0 1-1-.88V1a1 1 0 0 1 .88-1H9zm1.73 7-1.4.5.24.21.13.13c.12.13.23.25.3.36l.08.1.05.07.04.08H7.31v1.3h1.2l.17.53.1.26.1.3A6.3 6.3 0 0 0 10 12.61c-.5.32-1.12.61-1.87.87l-.33.11-.35.11-.44.14.72 1.15.4-.13.4-.12c1-.35 1.83-.76 2.48-1.22.57.4 1.28.77 2.12 1.08l.37.14.38.12.41.13.72-1.15-.45-.14-.26-.08-.34-.11a9.23 9.23 0 0 1-1.94-.9 6.3 6.3 0 0 0 1.07-1.7l.13-.31.11-.33.17-.52h1.2V8.45h-3.05l-.1-.23A3.7 3.7 0 0 0 11 7.3l-.12-.15-.14-.15zm1.35 2.76-.04.13-.08.22-.1.27a4.99 4.99 0 0 1-.86 1.38 4.95 4.95 0 0 1-.74-1.13l-.12-.25-.1-.27-.08-.22-.04-.13h2.16zM9 1H1v8h5V7l.01-.17H3.83L3.43 8H2l2.26-6h1.48l1.5 4H9V1zM5 3.41 4.25 5.6h1.5L5 3.41z"></path></svg> -->
				<b id="title_name"><%= vo.getExpName() %></b>
				<div style="clear:both;"></div>
			</div>
			<div id="exp_etc">
				<svg class="fl star" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 14px; width: 14px; fill: currentcolor;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
				<div id="score"><span><%= rVo == null ? 0 : rVo.getAvg() %></span> <span>(<%= rVo == null ? 0 : rVo.getCnt() %>)</span> <span>&middot;</span> <u><b><%= vo.getExpLocation() %></b></u></div>
				<div class="fr top_button">
					<div class="heart">
						<b style="text-decoration: underline;">저장</b>
						<svg class="fl bt_svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><path d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16 8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z"></path></svg>
					</div>
				</div>
				<div class="fr top_button">
					<b style="text-decoration: underline;">공유하기</b style="text-decoration: underline;">
					<svg class="fl bt_svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
				</div>
				<div style="clear:both;"></div>
			</div>
			
			<div id="images">
				<img class="fl imgs" src="<%= vo.getExpImg1() %>"/>
				<img class="fl imgs" src="<%= vo.getExpImg2() %>"/>
				<div id="small_img" class="fl">
					<img class="sm_imgs" src="<%= vo.getExpImg3() %>"/>
					<img class="sm_imgs" src="<%= vo.getExpImg4() %>"/>
				</div>
				<img class="fl imgs" src="<%= vo.getExpImg5() %>"/>
				<div id="iav_box">
					<div id="img_all_view" style="cursor: pointer;">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17 17" role="presentation" aria-hidden="true" focusable="false" style="height: 12px; width: 12px; display: block; fill: currentcolor;"><circle cx="1.5" cy="1.5" r="1.5"></circle><circle cx="1.5" cy="8.5" r="1.5"></circle><circle cx="8.5" cy="1.5" r="1.5"></circle><circle cx="8.5" cy="8.5" r="1.5"></circle><circle cx="15.5" cy="1.5" r="1.5"></circle><circle cx="15.5" cy="8.5" r="1.5"></circle><circle cx="1.5" cy="15.5" r="1.5"></circle><circle cx="8.5" cy="15.5" r="1.5"></circle><circle cx="15.5" cy="15.5" r="1.5"></circle></svg>
						<b>사진 5개 모두 보기</b>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			
			<div id="exp_body">
				<div id="body_left" class="fl">
					<div id="exp_host">
						<b id="exp_host_name"><%= vo.getExpHostId() %> 님의 <%= vo.getExpType() %></b><br/>
						<div id="exp_detail">
							<span><%= vo.getTime() %></span> <span>&middot;</span> <span>제공 언어:</span> <span><%= vo.getLanguage() %></span>
						</div>
						<img class="fr host_img" src="<%= vo.getHostImage() %>"/>
						<div style="clear:both;"></div>
					</div>
					
					<div id="exp_info">
						<div class="info">
							<svg class="fl info_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="height: 24px; width: 24px; fill: currentcolor;"><path d="M28.75 26h-2.04A10.93 10.93 0 0 0 18 17.69v-2.12a5 5 0 1 0-4 0v2.12A10.93 10.93 0 0 0 5.3 26H3.24a12.93 12.93 0 0 1 8.2-9.68 7 7 0 1 1 9.1 0 12.93 12.93 0 0 1 8.2 9.68zm-6.84-3.5-1.41-1.41-6.5 6.5-3-3L9.59 26 14 30.41z"></path></svg>
							<div class="fl info_info">
								<b class="info_title">맞춤 체험</b><br/>
								<a class="info_detail">게스트 관심사에 맞춰 진행되는 체험입니다.</a>		
							</div>
							<div style="clear:both;"></div>
						</div>
						
						<div class="info">
							<svg class="fl info_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="height: 24px; width: 24px; fill: currentcolor;"><path d="M28 2h-6V0h-2v2h-8V0h-2v2H4a2 2 0 0 0-2 2v21a5 5 0 0 0 5 5h12.59a2.01 2.01 0 0 0 1.41-.59L29.41 21a2.01 2.01 0 0 0 .59-1.41V4a2 2 0 0 0-2-2Zm-8 25.59V23a3 3 0 0 1 3-3h4.59ZM28 10H4v2h24v6h-5a5 5 0 0 0-5 5v5H7a3 3 0 0 1-3-3V4h6v2h2V4h8v2h2V4h6Z"></path></svg>
							<div class="fl info">
								<b class="info_title">유연한 환불 정책</b><br/>
								<a class="info_detail">체험 시작 24시간 전까지 수수료 없이 취소하실 수 있습니다.</a>			
							</div>
							<div style="clear:both;"></div>
						</div>
					</div>
					
					<!-- <div id="trans_language">
						<svg id="tl_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="presentation" focusable="false" style="height: 16px; width: 16px; fill: currentcolor;"><path d="M9 0a1 1 0 0 1 1 .88V6h5a1 1 0 0 1 1 .88V15a1 1 0 0 1-.88 1H7a1 1 0 0 1-1-.88V10H1a1 1 0 0 1-1-.88V1a1 1 0 0 1 .88-1H9zm1.73 7-1.4.5.24.21.13.13c.12.13.23.25.3.36l.08.1.05.07.04.08H7.31v1.3h1.2l.17.53.1.26.1.3A6.3 6.3 0 0 0 10 12.61c-.5.32-1.12.61-1.87.87l-.33.11-.35.11-.44.14.72 1.15.4-.13.4-.12c1-.35 1.83-.76 2.48-1.22.57.4 1.28.77 2.12 1.08l.37.14.38.12.41.13.72-1.15-.45-.14-.26-.08-.34-.11a9.23 9.23 0 0 1-1.94-.9 6.3 6.3 0 0 0 1.07-1.7l.13-.31.11-.33.17-.52h1.2V8.45h-3.05l-.1-.23A3.7 3.7 0 0 0 11 7.3l-.12-.15-.14-.15zm1.35 2.76-.04.13-.08.22-.1.27a4.99 4.99 0 0 1-.86 1.38 4.95 4.95 0 0 1-.74-1.13l-.12-.25-.1-.27-.08-.22-.04-.13h2.16zM9 1H1v8h5V7l.01-.17H3.83L3.43 8H2l2.26-6h1.48l1.5 4H9V1zM5 3.41 4.25 5.6h1.5L5 3.41z"></path></svg>
						<div id="trans_txt">
							<a id="trans_info" class="fl">일부 정보는 자동 번역되었습니다. </a><b><u>원문 보기</u></b>
							<div style="clear:both;"></div>
						</div>
					</div> -->
					
					<div id="exp_explain">
						<b id="program">프로그램</b>
						<div id="explain_txt">
							<span><%= vo.getExpExplain() %></span>
							<a id="mv_button" href="#" style="color:#222;"><b style="text-decoration: underline;">자세히 읽어보기</b></a>
						</div>
					</div>
				</div>
				
				<div id="res_box" class="fr">
					<div id="reservation">
						<div id="price_info">
							<b id="price">최저가 ₩<%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b><a id="member">일행당</a><br/>
							<a href="#" id="price_mv" style="color:rgb(113, 113, 113)">요금 모두 보기</a>
						</div>
						
						<div class="select">
							<div class="fl select_detail">
								<a class="detail_title">날짜</a><br>
								<a class="detail_content">날짜 입력</a>
								<svg class="fr arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block;fill: none;height: 16px;width: 16px;stroke: currentcolor;stroke-width: 4;overflow: visible; transform: rotate(90deg);"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
								<div style="clear:both;"></div>
							</div>
							<div class="fl select_detail">
								<a class="detail_title">게스트</a><br>
								<a class="detail_content">게스트 1명</a>
								<svg class="fr arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block;fill: none;height: 16px;width: 16px;stroke: currentcolor;stroke-width: 4;overflow: visible; transform: rotate(90deg);"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
								<div style="clear:both;"></div>
							</div>
							<div style="clear:both;"></div>
						</div>
						
						<div id="date_box">
							<div class="date">
								<div class="fl date_detail">
									<b class="dt_date">11월 28일(화)</b><br>
									<span class="dt_etc">오전 7:00–오전 7:45 (KST)</span><br>
									<span class="dt_etc">프라이빗 예약만 가능</span>
								</div>
								<div class="fl res_detail">
									<b class="rd_price">최저가 ₩<%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <a>일행당</a>
									<a class="res_button1" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="date">
								<div class="fl date_detail">
									<b class="dt_date">11월 28일(화)</b><br>
									<span class="dt_etc">오전 7:00–오전 7:45 (KST)</span><br>
									<span class="dt_etc">프라이빗 예약만 가능</span>
								</div>
								<div class="fl res_detail">
									<b>최저가 ₩<%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <a>일행당</a>
									<a class="res_button1" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
								</div>
								<div style="clear:both;"></div>
							</div>
							<div class="date">
								<div class="fl date_detail">
									<b class="dt_date">11월 28일(화)</b><br>
									<span class="dt_etc">오전 7:00–오전 7:45 (KST)</span><br>
								</div>
								<div class="fl res_detail">
									<b class="rd_price">₩<%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <a>/인</a>
									<div class="res_button2">매진</div>
								</div>
								<div style="clear:both;"></div>
							</div>
							
							<div id="date_mv"><b>날짜 더 보기</b></div>
							
							<div style="clear:both;"></div>
						</div>
						
						<div id="select_res_date" style="display: none;">
							<div><b>날짜 입력</b></div>
							<div class="select">
								<div class="fl select_detail">
									<a class="detail_title">날짜</a><br>
									<a class="detail_content">날짜 입력</a>
									<svg class="fr arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block;fill: none;height: 16px;width: 16px;stroke: currentcolor;stroke-width: 4;overflow: visible; transform: rotate(270deg);"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
									<div style="clear:both;"></div>
								</div>
								<div class="fl select_detail">
									<a class="detail_title">게스트</a><br>
									<a class="detail_content">게스트 1명</a>
									<svg class="fr arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block;fill: none;height: 16px;width: 16px;stroke: currentcolor;stroke-width: 4;overflow: visible; transform: rotate(90deg);"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
									<div style="clear:both;"></div>
								</div>
								<div style="clear:both;"></div>
								<div></div>
							</div>
							<div id="calendar">
								<div id="dp1" name="dp1" class="datepicker"></div>
								<div id="dp2" name="dp2" class="datepicker2"></div>
							</div>
							<div id="srd_bottom">
								<div><b>날짜 지우기</b></div>
								<div><b>저장</b></div>
							</div>
						</div>
						
						<div id="select_guest" style="display: none;">
							<div class="select">
								<div class="fl select_detail">
									<a class="detail_title">날짜</a><br>
									<a class="detail_content">날짜 입력</a>
									<svg class="fr arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block;fill: none;height: 16px;width: 16px;stroke: currentcolor;stroke-width: 4;overflow: visible; transform: rotate(90deg);"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
									<div style="clear:both;"></div>
								</div>
								<div class="fl select_detail">
									<a class="detail_title">게스트</a><br>
									<a class="detail_content">게스트 1명</a>
									<svg class="fr arrow" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block;fill: none;height: 16px;width: 16px;stroke: currentcolor;stroke-width: 4;overflow: visible; transform: rotate(270deg);"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
									<div style="clear:both;"></div>
								</div>
								<div style="clear:both;"></div>
								<div></div>
							</div>
							
							<div id="guest_count">
								<div class="gc_count">
									<div class="gc_age">
										<div>성인</div>
										<div>13세 이상</div>
									</div>
									<div class="gc_cnt">
										<div class="gc_button">
											<svg class="gc_minus" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg>
										</div>
										<input type="text" class="gc_num" value="1"/>
										<div class="gc_button">
											<svg class="gc_plus" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg>
										</div>
									</div>
								</div>
								<div class="gc_count">
									<div class="gc_age">
										<div>어린이</div>
										<div>2~12세</div>
									</div>
									<div class="gc_cnt">
										<div class="gc_button">
											<svg class="gc_minus" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg>
										</div>
										<input type="text" class="gc_num" value="0"/>
										<div class="gc_button">
											<svg class="gc_plus" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg>
										</div>
									</div>
								</div>
								<div class="gc_count">
									<div class="gc_age">
										<div>유아</div>
										<div>2세 미만</div>
									</div>
									<div class="gc_cnt">
										<div class="gc_button">
											<svg class="gc_minus" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;"><path d="m.75 6.75h10.5v-1.5h-10.5z"></path></svg>
										</div>
										<input type="text" class="gc_num" value="0"/>
										<div class="gc_button">
											<svg class="gc_plus" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 12px; width: 12px; fill: currentcolor;"><path d="m6.75.75v4.5h4.5v1.5h-4.5v4.5h-1.5v-4.5h-4.5v-1.5h4.5v-4.5z"></path></svg>
										</div>
									</div>
								</div>
							</div>
							
							<div id="sg_save"><b>저장</b></div>
						</div>
					</div>
					
					<div id="report">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="color: #717171; display: block; height: 16px; width: 16px; fill: currentcolor;"><path d="M28 6H17V4a2 2 0 0 0-2-2H3v28h2V18h10v2a2 2 0 0 0 2 2h11.12a1 1 0 0 0 .84-1.28L27.04 14l1.92-6.72A1 1 0 0 0 28 6z"></path></svg>
						<span id="report_txt"><b>체험 신고하기</b></span>
					</div>
					
				</div>
				<div style="clear:both;"></div>
				
				<div id="exp_join" class="fl">
					<div id="join_title">
						<b>참여 방법</b>
					</div>
					<div class="fl join_solution">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M27 3a2 2 0 0 1 2 1.85v14.97l2.43 6.48a2 2 0 0 1-.88 2.44l-.15.07-.14.06a2 2 0 0 1-.52.12l-.18.01H2.44a2 2 0 0 1-1.92-2.53l.05-.17L3 19.82V5a2 2 0 0 1 1.7-1.98L4.85 3H5zm.3 18H4.7l-2.26 6h27.12zM19 23v2h-6v-2zm8-18H5v14h22zM16 7a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path></svg>
						<div class="sol_title"><b>영상 통화 참여하기</b></div>
						<div class="sol_detail">데스크톱 컴퓨터나 모바일 기기에서 줌을 이용해 참여하세요. 예약이 확정되면 참여 방법에 대한 자세한 내용과 링크가 담긴 이메일을 보내드립니다.</div>
					</div>
					<div class="fl join_solution">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 32px; width: 32px; fill: currentcolor;"><path d="M22 7a5 5 0 0 1 3.4 8.67 9 9 0 0 1 5.6 8.06V24h-2a7 7 0 0 0-6-6.93v-2.24a3 3 0 1 0-4-3V12l.08.06a5 5 0 0 1 .32 7.6 9 9 0 0 1 5.6 8.07V28h-2a7 7 0 0 0-6-6.93v-2.24a3 3 0 1 0-2 0v2.24a7 7 0 0 0-6 6.69V28H7a9 9 0 0 1 5.6-8.34 4.98 4.98 0 0 1 .32-7.6L13 12a3 3 0 1 0-4 2.83v2.24a7 7 0 0 0-6 6.69V24H1a9 9 0 0 1 5.6-8.34A4.98 4.98 0 0 1 10 7a5 5 0 0 1 4.92 4.12 4.98 4.98 0 0 1 2.16 0A5 5 0 0 1 22 7z"></path></svg>
						<div class="sol_title"><b>프라이빗 예약하기</b></div>
						<div class="sol_detail"><%=vo.getExpHostId() %>님은 최대 1명 내에서 모든 규모의 프라이빗 예약을 호스팅하실 수 있습니다. 프라이빗 예약은 최저가 ₩59,015부터 가능합니다.</div>
					</div>
				</div>
				
				<div id="review" class="fl">
					<div id="review_score">
						<svg class="fl" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 16px; width: 16px; fill: currentcolor;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<div id="score_txt">
							<b><%= rVo == null ? 0 : rVo.getAvg() %></b><b>점</b><b>(후기</b> <b><%= rVo == null ? 0 : rVo.getCnt() %></b><b>개)</b>
						</div>
					</div>
					<% if(listReviewVo != null) { %>
						<% int cnt = 0; %>
						<% for(ExpReviewVo erVo : listReviewVo) { %>
							<% if(cnt==6) break; %>
							<div class="fl rvz">
								<div class="user_info">
									<img class="user_img" src="<%= erVo.getUserImage()%>"/>
									<b class="user_name"><%= erVo.getUserName() %></b><br>
									<a class="review_date"><%= erVo.getWrittenDate() %></a>
								</div>
								<div class="review_txt">
									<%= erVo.getReview() %>
								</div>
								<div class="rv_more_view">
									<a class="rv_mv" style="color: #222;" href="#"><b>더 보기</b></a>
									<svg class="mv_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 5.33333; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
								</div>
							</div>
							<% cnt++; %>
						<% } %>
					<% } %>
					
					<div style="clear:both;"></div>
					
					<div id="rv_all_view">
						<div>
							<b>후기</b> <b><%= rVo == null ? 0 : rVo.getCnt() %></b><b>개 모두 보기</b>
						</div>
					</div>
				</div>
				<div style="clear:both;"></div>
				
				<div id="host_introduce" class="fl">
					<div id="hi_info">
						<img class="fl host_img" style="left:0; top:48px;" src="<%=vo.getHostImage() %>"/>
						<div id="hi_host">
							<b>호스트 </b><b><%=vo.getExpHostId() %></b><b>님 소개</b>
						</div>
						<div id="year">
							<a>에어비앤비 호스팅 시작 연도: </a><a><%=vo.getHostYear() %>년</a>
						</div>
					</div>
					<div id="host_etc">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="height: 16px; width: 16px; fill: currentcolor;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
						<div><a>후기 </a><a>47</a><a>개</a></div>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="height: 16px; width: 16px; fill: currentcolor;"><path d="m16 .8.56.37C20.4 3.73 24.2 5 28 5h1v12.5C29 25.57 23.21 31 16 31S3 25.57 3 17.5V5h1c3.8 0 7.6-1.27 11.45-3.83L16 .8zm7 9.08-9.5 9.5-4.5-4.5L6.88 17l6.62 6.62L25.12 12 23 9.88z"></path></svg>
						<div>본인 인증 완료</div>
					</div>
					<div id="hi_introduce">
						<%=vo.getHostIntro() %>
					</div>
					<div id="hi_bottom"> 
						<div id="host_contact">
							<!-- <b>호스트에게<br>연락하기</b> -->
							<form action="SesController" method="post">
								<input type="submit" value="호스트에게 연락하기"/>
								<input type="hidden" name="thisUserIdx" value="0"/>
								<input type="hidden" name="command" value="message"/>
							</form>
						</div>
						<div id="hi_pay_a">
							<div id="hi_pay_r">
								<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="height: 24px; width: 24px; fill: rgb(255, 180, 0);"><path d="m5 20.5a.5.5 0 0 1 -.5.5h-.5v.5a.5.5 0 0 1 -1 0v-.5h-.5a.5.5 0 0 1 0-1h .5v-.5a.5.5 0 0 1 1 0v .5h.5a.5.5 0 0 1 .5.5zm1.5 1.5a.5.5 0 1 0 .5.5.5.5 0 0 0 -.5-.5zm16-20h-.5v-.5a.5.5 0 0 0 -1 0v .5h-.5a.5.5 0 0 0 0 1h .5v.5a.5.5 0 0 0 1 0v-.5h.5a.5.5 0 0 0 0-1zm-2.58 4.87a13.41 13.41 0 0 1 -6.76-3.2.37.37 0 0 0 -.63.26l.08 16.22a.38.38 0 0 0 .55.32 11.98 11.98 0 0 0 7.07-13.31.37.37 0 0 0 -.31-.3z"></path><path d="m14.39 8.32a1.93 1.93 0 0 0 -3.66 0l-2.42 4.85a3.09 3.09 0 0 0 -.4 1.61 2.36 2.36 0 0 0 2.23 2.23 3.95 3.95 0 0 0 2.42-1.06 3.95 3.95 0 0 0 2.42 1.06 2.36 2.36 0 0 0 2.23-2.23 3.09 3.09 0 0 0 -.4-1.61zm-2.72 4.38c0-.05.01-1.23.89-1.23s.88 1.18.88 1.23a3.25 3.25 0 0 1 -.88 1.83 3.25 3.25 0 0 1 -.89-1.83zm3.31 3.31a2.92 2.92 0 0 1 -1.71-.77 4.3 4.3 0 0 0 1.17-2.54 2.02 2.02 0 0 0 -1.8-2.22l-.08-.01a2.02 2.02 0 0 0 -1.89 2.15l.01.08a4.29 4.29 0 0 0 1.17 2.54 2.92 2.92 0 0 1 -1.71.77 1.36 1.36 0 0 1 -1.23-1.23 2.13 2.13 0 0 1 .29-1.16l2.42-4.85c.33-.65.55-.76.94-.76s.61.11.94.76l2.42 4.85a2.13 2.13 0 0 1 .29 1.16 1.36 1.36 0 0 1 -1.23 1.23zm7.01-10.35a.5.5 0 0 0 -.43-.4 13.03 13.03 0 0 1 -8.68-4.57.52.52 0 0 0 -.77 0 13.03 13.03 0 0 1 -8.68 4.57.5.5 0 0 0 -.43.4c-1.58 8.19 1.55 14.02 9.3 17.31a.5.5 0 0 0 .39 0c7.75-3.29 10.87-9.11 9.3-17.31zm-9.49 16.3c-7.1-3.09-9.91-8.25-8.57-15.76a13.98 13.98 0 0 0 8.57-4.43 13.98 13.98 0 0 0 8.57 4.43c1.33 7.51-1.48 12.67-8.57 15.76z" fill="#484848"></path></svg>
								<a>안전한 결제를 위해 에어비앤비 웹사이트나 앱 외부에서 송금하거나 대화를<br>나누지 마세요. </a>
								<a href="#" style="color:#222;"><b>자세히 알아보기</b></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="exp_online">
				<div id="online_title">
					<b>체험</b><br>
					<b><%= oVo.getOnlineTitle() %></b><br>
				</div>
				<% for(ExpOnlineVo eoVo : listOnlineVo) { %>
					<%= eoVo.getOnlineImage().replace("\\\"", "\"") %>
					<div class="fl online_txt"><%= eoVo.getOnlineInfo() %></div>
				<% } %>
					<div style="clear:both;"></div>
			</div>
			
			<div id="reservation_select">
				<div id="rs_title">
					<b>예약 가능한 날짜 선택하기</b><br>
					<div><a>예약 가능한 시간대 </a><a>86</a><a>개</a></div>
				</div>
				<div class="fl rs_select">
					<b>11월 29일 (수)</b><br>
					<a>오전 7:00-오전 7:45 (KST)</a>
					<div class="rs_price"><b>₩ <%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <a>/인</a></div>
					<div class="rs_sold_out"><b>매진</b></div>
				</div>
				<div class="fl rs_select">
					<b>11월 29일 (수)</b><br>
					<a>오전 8:00-오전 8:45 (KST)</a><br>
					<a class="private">프라이빗 예약만 가능</a>
					<div class="rs_price"><b>최저가 ₩ <%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <a>일행당</a></div>
					<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
				</div>
				<div class="fl rs_select">
					<b>11월 29일 (수)</b><br>
					<a>오전 7:00-오전 7:45 (KST)</a>
					<div class="rs_price"><b>₩ <%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <a>/인</a></div>
					<div class="rs_sold_out"><b>매진</b></div>
				</div>
				<div class="fl rs_select">
					<b>11월 29일 (수)</b><br>
					<a>오전 7:00-오전 7:45 (KST)</a><br>
					<a class="private">프라이빗 예약만 가능</a>
					<div class="rs_price"><b>최저가 ₩ <%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <a>일행당</a></div>
					<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
				</div>
				<div class="fl rs_select">
					<b>11월 29일 (수)</b><br>
					<a>오전 7:00-오전 7:45 (KST)</a><br>
					<a class="private">프라이빗 예약만 가능</a>
					<div class="rs_price"><b>최저가 ₩ <%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <a>일행당</a></div>
					<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
				</div>
				<div style="clear:both;"></div>
				<div id="date_more_view"><b>날짜 더 보기</b></div>
			</div>
			
			<div id="caution">
				<div id="caution_title"><b>알아두어야 할 사항</b></div>
				<div class="fl caution_box">
					<b>게스트 필수조건</b>
					<div class="guest">
						<div class="fl guest_icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" aria-hidden="true" role="presentation" focusable="false" style="height: 16px; width: 16px; fill: currentcolor;"><path d="M8 1a4 4 0 0 1 2.19 7.35 7 7 0 0 1 4.8 6.38L15 15v1H1v-1a7 7 0 0 1 4.81-6.65A4 4 0 0 1 8 1z"></path></svg></div>
						<span><span>참가 가능 연령: </span><span><%= vo.getAge() %></span><span>세 이상, 최대 인원수: 총 </span><span><%= vo.getN() %></span><span>명</span></span>
						<div style="clear:both;"></div>
					</div>
					<div class="guest">
						<div class="fl guest_icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="height: 16px; width: 16px; fill: currentcolor;"><path d="M16 27a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm0-13a9 9 0 0 0-8.04 4.96l1.52 1.52A7 7 0 0 1 16 16a7 7 0 0 1 6.52 4.48l1.52-1.52A9 9 0 0 0 16 14zm0-5c-4.89 0-9.19 2.51-11.7 6.3l1.46 1.46a11.98 11.98 0 0 1 20.48 0l1.45-1.45C25.2 11.5 20.9 9 16 9zm0-5A18.95 18.95 0 0 0 .73 11.73l1.43 1.43a16.97 16.97 0 0 1 27.68 0l1.43-1.43C27.81 7.05 22.27 4 16 4z"></path></svg></div>
						<a>체험에 참여하려면 동영상과 오디오를 전송할 수 있는<br>기능이 필요합니다.</a>
						<div style="clear:both;"></div>
					</div>
				</div>
				<div class="fl caution box">
					<b>환불 정책</b><br>
					<div class="refund">체험 시작 24시간 전까지 예약을 취소하면 전액 환불받을 수<br>있습니다.</div>
					<div class="refund">
						<a style="color: #222;" href="OutOfService.html"><b>더 보기</b></a>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 5.33333; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			
			<div id="exp_recommend">
				<div id="er_title">
					<b><%= expCate %></b>
					<div id="ert_point" class="fr">
						<div id="ert_left" class="fl">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="M20 28 8.7 16.7a1 1 0 0 1 0-1.4L20 4"></path></svg>
						</div>
						<div id="ert_right" class="fr">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" transform="rotate(180)" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="M20 28 8.7 16.7a1 1 0 0 1 0-1.4L20 4"></path></svg>
						</div>
						<div style="clear:both;"></div>
					</div>
				</div>
				
<style>
	.slick-prev {
		position: absolute;
		left: 10px !important;
		/*opacity: 1 !important;*/
		z-index: 1;
	}
	.slick-next {
		right:0 !important;
		/*opacity: 1 !important;*/
		z-index: 1;
	}
	.slick-prev:before, .slick-next:before {
		color: red;		
	}
	.slick-disabled {
		opacity: 0.25 !important;
	}

</style>
				
				<div id="er_expz">
					<%
					for(ExperienceVo eVo : listInfoExp) {
					%>
						<a id="er_exp" class="fl" href="ExpInfo?exp_idx=<%= eVo.getExpIdx() %>">
							<div class=er_img style="background-image: url('<%= eVo.getExpImg1() %>')">
								<input type="hidden" class="heart_val" value="0"/>
								<div class="heart">
									<svg class="heart_empty" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block;fill: rgba(0, 0, 0, 0.5);height: 24px;width: 24px; overflow: visible;"><path d="M16 28c7-4.73 14-10 14-17a6.98 6.98 0 0 0-7-7c-1.8 0-3.58.68-4.95 2.05L16 8.1l-2.05-2.05a6.98 6.98 0 0 0-9.9 0A6.98 6.98 0 0 0 2 11c0 7 7 12.27 14 17z"></path></svg>
								</div>
							</div>
							<div class="er_explain">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="height: 12px; width: 12px; fill: currentcolor;"><path fill-rule="evenodd" d="m15.1 1.58-4.13 8.88-9.86 1.27a1 1 0 0 0-.54 1.74l7.3 6.57-1.97 9.85a1 1 0 0 0 1.48 1.06l8.62-5 8.63 5a1 1 0 0 0 1.48-1.06l-1.97-9.85 7.3-6.57a1 1 0 0 0-.55-1.73l-9.86-1.28-4.12-8.88a1 1 0 0 0-1.82 0z"></path></svg>
								<span><%= eVo.getScore() %></span>
								<span class="rv_loc"><span>(</span><span>39</span><span>) &middot; <%=eVo.getExpLocation()%></span></span>
								<div class="er_name"><%=eVo.getExpName()%></div>
								<div class="price"><b>₩</b><b><%=new DecimalFormat("###,###").format(eVo.getExpPrice())%></b><b>~</b><span>/인</span></div>
							</div>
						</a>
					<%
					}
					%>
					<div style="clear:both;"></div>
				</div>
			</div>
		</div>
		
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
      
		<div class="container">
	      <div id="date_mv_inner">
		      <div id="back_page" onclick="history.back();">
					<div>
						<svg viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false" style="cursor:pointer; height: 16px; width: 16px; display: block; fill: rgb(34, 34, 34);"><path d="m23.25 24c-.19 0-.38-.07-.53-.22l-10.72-10.72-10.72 10.72c-.29.29-.77.29-1.06 0s-.29-.77 0-1.06l10.72-10.72-10.72-10.72c-.29-.29-.29-.77 0-1.06s.77-.29 1.06 0l10.72 10.72 10.72-10.72c.29-.29.77-.29 1.06 0s .29.77 0 1.06l-10.72 10.72 10.72 10.72c.29.29.29.77 0 1.06-.15.15-.34.22-.53.22" fill-rule="evenodd"></path></svg>
					</div>
				</div>
				<div id="sd_body">
					<div id="body_inner">
						<div id="select_date" class="fl">
							<div><b>날짜 선택</b></div>
							<div id="select_button">
								<div class="fl select_cell">
									<div class="sc_text">
										<div>날짜</div>
										<div>날짜 입력</div>
									</div>
									<div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg></div>
								</div>
								<div class="fl select_cell">
									<div class="sc_text">
										<div>게스트</div>
										<div>게스트 1명</div>
									</div>
									<div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="cursor: pointer; display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg></div>
								</div>
							</div>
							
							<div id="private">
								<div id="pv_text">
									<div><b>프라이빗 예약 가능 여부만 표시</b></div>
									<div><span><%= vo.getExpHostId() %></span><span>님은 최대 </span><%= vo.getN() %><span>명 내에서 모든 규모의 프라이빗 예약을 호스팅하실 수 있습니다. 프라이빗 예약은 최저가 ₩</span><span><%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></span><span>부터 가능합니다.</span></div>
								</div>
								<div id="pv_button" class="fr"><div></div></div>
								<div style="clear:both;"></div>
							</div>
							
							<div id="sd_bottom">
								<div><span>달력에 표시되지 않은 날짜와 시간에 예약이 가능한지 알아보거나 대규모 그룹을<br/>예약하고 싶다면 </span><span><%= vo.getExpHostId() %></span><span>님에게 연락하세요.</span></div>
								<div><b>예약 가능 여부 문의</b></div>
							</div>
						</div>
						
						<div id="select_time" class="fr">
							<div class="dmv_date"><b>12월 4일 (월)</b></div>
							<div class="select_box">
								<div class="sb_top">
									<div class="sbt_top">
										<div>
											<span>오전 7:00-오전 7:45 (KST)</span><br/>
											<b>최저가 ₩</b><b><%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <span>일행당</span>
										</div>
										<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
									</div>
									<div class="sbt_bottom">
										<div>프라이빗 예약만 가능</div>
										<div><span>체험 진행 언어:</span> <span><%= vo.getLanguage() %></span></div>
										<div><span>12월 3일 오전 7:00 (KST)</span><span>까지 취소하시면 전액 환불됩니다.</span></div>
									</div>
								</div>
								
								<div class="sb_bottom">
									<div class="share">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
										<a style="color: #222;" href="#"><b><u>공유하기</u></b></a>
									</div>
								</div>
							</div>
							<div class="select_box">
								<div class="sb_top">
									<div class="sbt_top">
										<div>
											<span>오전 8:00-오전 8:45 (KST)</span><br/>
											<b>최저가 ₩</b><b><%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <span>일행당</span>
										</div>
										<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
									</div>
									<div class="sbt_bottom">
										<div>프라이빗 예약만 가능</div>
										<div><span>체험 진행 언어:</span> <span><%= vo.getLanguage() %></span></div>
										<div><span>12월 3일 오전 8:00 (KST)</span><span>까지 취소하시면 전액 환불됩니다.</span></div>
									</div>
								</div>
								
								<div class="sb_bottom">
									<div class="share">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
										<a style="color: #222;" href="#"><b><u>공유하기</u></b></a>
									</div>
								</div>
							</div>
							<div class="dmv_date"><b>12월 5일 (화)</b></div>
							<div class="select_box">
								<div class="sb_top">
									<div class="sbt_top">
										<div>
											<span>오전 7:00-오전 7:45 (KST)</span><br/>
											<b>최저가 ₩</b><b><%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <span>일행당</span>
										</div>
										<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
									</div>
									<div class="sbt_bottom">
										<div>프라이빗 예약만 가능</div>
										<div><span>체험 진행 언어:</span> <span><%= vo.getLanguage() %></span></div>
										<div><span>12월 4일 오전 7:00 (KST)</span><span>까지 취소하시면 전액 환불됩니다.</span></div>
									</div>
								</div>
								
								<div class="sb_bottom">
									<div class="share">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
										<a style="color: #222;" href="#"><b><u>공유하기</u></b></a>
									</div>
								</div>
							</div>
							<div class="select_box">
								<div class="sb_top">
									<div class="sbt_top">
										<div>
											<span>오전 8:00-오전 8:45 (KST)</span><br/>
											<b>최저가 ₩</b><b><%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <span>일행당</span>
										</div>
										<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
									</div>
									<div class="sbt_bottom">
										<div>프라이빗 예약만 가능</div>
										<div><span>체험 진행 언어:</span> <span><%= vo.getLanguage() %></span></div>
										<div><span>12월 4일 오전 8:00 (KST)</span><span>까지 취소하시면 전액 환불됩니다.</span></div>
									</div>
								</div>
								
								<div class="sb_bottom">
									<div class="share">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
										<a style="color: #222;" href="#"><b><u>공유하기</u></b></a>
									</div>
								</div>
							</div>
							<div class="dmv_date"><b>12월 6일 (수)</b></div>
							<div class="select_box">
								<div class="sb_top">
									<div class="sbt_top">
										<div>
											<span>오전 7:00-오전 7:45 (KST)</span><br/>
											<b>최저가 ₩</b><b><%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <span>일행당</span>
										</div>
										<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
									</div>
									<div class="sbt_bottom">
										<div>프라이빗 예약만 가능</div>
										<div><span>체험 진행 언어:</span> <span><%= vo.getLanguage() %></span></div>
										<div><span>12월 5일 오전 7:00 (KST)</span><span>까지 취소하시면 전액 환불됩니다.</span></div>
									</div>
								</div>
								
								<div class="sb_bottom">
									<div class="share">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
										<a style="color: #222;" href="#"><b><u>공유하기</u></b></a>
									</div>
								</div>
							</div>
							<div class="select_box">
								<div class="sb_top">
									<div class="sbt_top">
										<div>
											<span>오전 8:00-오전 8:45 (KST)</span><br/>
											<b>최저가 ₩</b><b><%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <span>일행당</span>
										</div>
										<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
									</div>
									<div class="sbt_bottom">
										<div>프라이빗 예약만 가능</div>
										<div><span>체험 진행 언어:</span> <span><%= vo.getLanguage() %></span></div>
										<div><span>12월 5일 오전 8:00 (KST)</span><span>까지 취소하시면 전액 환불됩니다.</span></div>
									</div>
								</div>
								
								<div class="sb_bottom">
									<div class="share">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
										<a style="color: #222;" href="#"><b><u>공유하기</u></b></a>
									</div>
								</div>
							</div>
							<div class="dmv_date"><b>12월 7일 (목)</b></div>
							<div class="select_box">
								<div class="sb_top">
									<div class="sbt_top">
										<div>
											<span>오전 7:00-오전 7:45 (KST)</span><br/>
											<b>최저가 ₩</b><b><%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <span>일행당</span>
										</div>
										<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
									</div>
									<div class="sbt_bottom">
										<div>프라이빗 예약만 가능</div>
										<div><span>체험 진행 언어:</span> <span><%= vo.getLanguage() %></span></div>
										<div><span>12월 6일 오전 7:00 (KST)</span><span>까지 취소하시면 전액 환불됩니다.</span></div>
									</div>
								</div>
								
								<div class="sb_bottom">
									<div class="share">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
										<a style="color: #222;" href="#"><b><u>공유하기</u></b></a>
									</div>
								</div>
							</div>
							<div class="select_box">
								<div class="sb_top">
									<div class="sbt_top">
										<div>
											<span>오전 8:00-오전 8:45 (KST)</span><br/>
											<b>최저가 ₩</b><b><%= new DecimalFormat("###,###").format(vo.getExpPrice()) %></b> <span>일행당</span>
										</div>
										<a class="rs_button" href="LswController?command=payment&exp_idx=<%= idx %>"><b>선택</b></a>
									</div>
									<div class="sbt_bottom">
										<div>프라이빗 예약만 가능</div>
										<div><span>체험 진행 언어:</span> <span><%= vo.getLanguage() %></span></div>
										<div><span>12월 6일 오전 8:00 (KST)</span><span>까지 취소하시면 전액 환불됩니다.</span></div>
									</div>
								</div>
								
								<div class="sb_bottom">
									<div class="share">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 2; overflow: visible;"><g fill="none"><path d="M27 18v9a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-9M16 3v23V3zM6 13l9.3-9.3a1 1 0 0 1 1.4 0L26 13"></path></g></svg>
										<a style="color: #222;" href="#"><b><u>공유하기</u></b></a>
									</div>
								</div>
							</div>
						</div>
						<div style="clear:both;"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container">
		
			<script>
				let imgNum = 1;
				function imgSlide() {
					imgNum++;
				}
			</script>
		
			<div id="image_all_view">
				<div id="iav_top">
					<div id="close" style="cursor: pointer;">
						<svg viewBox="0 0 12 12" role="presentation" aria-hidden="true" focusable="false" style="color: #FFF; height: 12px; width: 12px; fill: currentcolor;"><path d="m11.5 10.5c.3.3.3.8 0 1.1s-.8.3-1.1 0l-4.4-4.5-4.5 4.5c-.3.3-.8.3-1.1 0s-.3-.8 0-1.1l4.5-4.5-4.4-4.5c-.3-.3-.3-.8 0-1.1s.8-.3 1.1 0l4.4 4.5 4.5-4.5c.3-.3.8-.3 1.1 0s .3.8 0 1.1l-4.5 4.5z" fill-rule="evenodd"></path></svg>
						<span><b>닫기</b></span>
					</div>
					<div><span class="img_num">1</span> <span>/ 5</span></div>
				</div>
				<div id="iav_img">
					<div id="imgz">
						<img src="<%= vo.getExpImg1() %>"/>
						<img src="<%= vo.getExpImg2() %>"/>
						<img src="<%= vo.getExpImg3() %>"/>
						<img src="<%= vo.getExpImg4() %>"/>
						<img src="<%= vo.getExpImg5() %>"/>
					</div>
					<div>
						<div id="img_prev">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" transform="rotate(180)" style="color: #FFF; display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
						</div>
						<div id="img_next">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="color: #FFF; display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="m12 4 11.3 11.3a1 1 0 0 1 0 1.4L12 28"></path></svg>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="report_body">
			<div id="report_display">
				<div id="report_top">
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; cursor: pointer; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg>
					</div>
					<div>
						<div>
							<div><b>이 체험을 신고하시는 이유를 알려주세요.</b></div>
							<div>이 내용은 호스트가 볼 수 없습니다.</div>
						</div>
						<div id="report_content">
							<div class="rc_content">
								<div>부정확하거나 틀린 정보가 있어요</div>
								<input type="radio" name="report">
							</div>
							<div class="rc_content">
								<div>사기입니다</div>
								<input type="radio" name="report">
							</div>
							<div class="rc_content">
								<div>불쾌합니다</div>
								<input type="radio" name="report">
							</div>
							<div class="rc_content">
								<div>기타</div>
								<input type="radio" name="report">
							</div>
						</div>
					</div>
				</div>
				
				<div id="report_bottom">
					<div class="fr"><b>다음</b></div>
				</div>
			</div>
		</div>
		
		<div id="share_outer"></div>
		<div id="share">
			<div class="share_header">
				<button class="head_button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;margin:0 auto;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
				체험 공유하기
			</div>
			
			<div class="share_inner1">
				<img src="<%= vo.getExpImg1() %>"/>
				<div class="share_content1">
					<%= vo.getExpName() %> · <%= vo.getExpLocation() %> · ★<%= rVo == null ? 0 : rVo.getAvg() %>
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
			<div style="clear:both;"></div>
		</div>
		
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
					<% for(WishlistListVo wVo : listWish) { %> 
						<div class="wish_content_outer">
							<div class="wish_content1">
								<img src="<%=wVo.getImg()%>"/>
								<span class="wish_sp1"><%=wVo.getBiglistName() %></span><br>
								<span class="wish_sp2"><%=wVo.getCnt() %>개 저장됨</span>
							</div>
						</div>
					<% } %>
				<% } %>
		      <!-- <div class="wish_content_outer">
		         <div class="wish_content1">
		            <img src="https://a0.muscache.com/im/pictures/032392ef-892e-4e85-bad1-2881905f67f0.jpg?im_w=1200"/>
		            <span class="wish_sp1">경기도 안양시</span><br>
		            <span class="wish_sp2">0개 저장됨</span>
		         </div>
		      </div> -->
		   
		   </div> <!-- inner1끝 -->
		   <div class="wish_inner2">
		      <div class="wish_content2">새로운 위시리스트 만들기</div>
		   </div>
		</div>
		<!-- 위시 카테고리 만들기 -->
		<div id="make_wish_back"></div>
		<div id="make_wish">
			<div class="make_wish_header">
				<button>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;position:absolute;top: 20px;"><path d="m6 6 20 20M26 6 6 26"></path></svg>
				</button>
				<span>위시리스트 만들기</span>
			</div>
			<form method="get">
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
		
		<div id="bg_popup"></div>
        	<div id="pop_review">
		      <div class="pop_header">
		         <button><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button>
		      </div>
		      
		      <div class="pop_section">
		      
		         <div class="pop_section1">
		            <div class="pop_section1-1">
		               <img class="i9if2t0 atm_e2_idpfg4 atm_vy_idpfg4 atm_mk_stnw88 atm_e2_1osqo2v__1lzdix4 atm_vy_1osqo2v__1lzdix4 atm_mk_pfqszd__1lzdix4 i1cqnm0r atm_jp_pyzg9w atm_jr_nyqth1 i1de1kle atm_vh_yfq0k3 dir dir-ltr" aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/pictures/ec500a26-609d-440f-b5d0-9e5f92afd478.jpg" data-original-uri="https://a0.muscache.com/pictures/ec500a26-609d-440f-b5d0-9e5f92afd478.jpg" style="--dls-liteimage-object-fit: cover;">
		               <div style="color: rgb(51, 56, 59);"><%= rVo == null ? 0 : rVo.getAvg() %></div>
		               <img class="i9if2t0 atm_e2_idpfg4 atm_vy_idpfg4 atm_mk_stnw88 atm_e2_1osqo2v__1lzdix4 atm_vy_1osqo2v__1lzdix4 atm_mk_pfqszd__1lzdix4 i1cqnm0r atm_jp_pyzg9w atm_jr_nyqth1 i1de1kle atm_vh_yfq0k3 dir dir-ltr" aria-hidden="true" decoding="async" elementtiming="LCP-target" src="https://a0.muscache.com/pictures/65bb2a6c-0bdf-42fc-8e1c-38cec04b2fa5.jpg" data-original-uri="https://a0.muscache.com/pictures/65bb2a6c-0bdf-42fc-8e1c-38cec04b2fa5.jpg" style="--dls-liteimage-object-fit: cover;">
		            </div>
		            <div class="pop_section1-2">게스트 선호</div>
		            <div class="pop_section1-3">평점, 후기, 신뢰도 기준<br>에어비앤비에서 가장 사랑받는 체험</div>
			        <div>
		              <form method="post" action="/reply/write">
		                 <p>
		                    <textarea rows="5" cols="50" name="content"></textarea>
		                 </p>
		                 <p>
		                    <button type="submit">후기 작성</button>
		                 </p>
		              </form>
		           </div>
		         </div>
		         
		         
		         <div class="pop_section2">
		            <div>
		               
		               <div class="pop_section2-1">
		                  <div>후기 <%= rVo == null ? 0 : rVo.getCnt() %>개</div>
		               </div>
		               
		               <div class="pop_section2-2">
		                  <input type="text" placeholder="후기검색">
		                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path fill="none" d="M13 24a11 11 0 1 0 0-22 11 11 0 0 0 0 22zm8-3 9 9"></path></svg>
		               </div>
		            </div>
		            
		            <div>
		            	<% for(ExpReviewVo erVo : listReviewVo) { %>
			               <div class="pop_section2-3">
			                  <div>
			                     <img src="<%= erVo.getUserImage() %>"/>
			                     <div>
			                        <span class="re-sp1"><%= erVo.getUserName() %><br></span>
			                        <span class="re-sp2"><%= erVo.getWrittenDate() %></span>
			                     </div>
			                  </div>
			                  
			                  <div>
			                  	<%= erVo.getReview() %>
			                  </div>
			               </div>
		               <% } %>
		            </div>
		            
		         </div><!-- pink끝 -->
		      </div>
		      
		</div><!-- 리뷰팝업끝 -->
		
		<script src="JS/jquery-3.7.1.min.js"></script>
		<script src="slick/slick.js"></script>
		<script>
			$(function() {
				$("#er_expz").slick({
					slidesToShow: 6,
					slidesToScroll: 6,
					infinite: false,
					prevArrow: $("#ert_point > #ert_left"),
					nextArrow: $("#ert_point > #ert_right")
				});
				
				$("#imgz").slick({
					slidesToShow: 1,
					slidesToScroll: 1,
					infinite: false,
					prevArrow: $("#img_prev"),
					nextArrow: $("#img_next"),
				});
			})
		</script>
	</body>
</html>