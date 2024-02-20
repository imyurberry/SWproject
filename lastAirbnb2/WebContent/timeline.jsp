<%@page import="esVo.UserInfoVo"%>
<%@page import="esVo.LanguageVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="esDao.LanguageDao"%>
<%@page import="esDao.LoginDao"%>
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
		<title>타임라인 - 에어비앤비</title>
		<link rel="shortcut icon" href="images/logo2.png">
		<link rel ="stylesheet" href="css/timeline.css"/>
		<script src="js/jquery-3.7.1.min.js"></script>
		<script src="js/timeline.js"></script>
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
								<h3 style="font-size: 22px; font-weight: 600;">ì¸ì´ì ì§ì­ì ì ííì¸ì</h3>
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
	         	   <input type="hidden" name="url" value="timeline.jsp"/>
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
		
		<div class="new_post_background"></div>
		<div id="content">
			<div>
				<div id="timeline_" class="fl">
					<div id="timeline_top">
						<div>
							<img class="fl" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?im_w=240"/>
							<div class="fr">민영님, 무슨 생각을 하고 계신가요?</div>
						
						</div><!--ììª½-->
						<div class="new_post">
							<div class="new_post_top">게시글 만들기<button class="close_div1 fr"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button></div>
							<div class="new_post_center"><textarea class="write_new_post" placeholder="민영님, 무슨 생각을 하고 계신가요?" ></textarea></div>
							<div class="new_post_bottom"><input type="submit" id="submit_new_post" value="게시"/></div>
						</div>
						<div>
							<div class="fl">
								<svg aria-label="ìë¡ì´ ê²ìë¬¼" fill="currentColor" height="24" role="img" viewBox="0 0 24 24" width="24"><title>ìë¡ì´ ê²ìë¬¼</title><path d="M2 12v3.45c0 2.849.698 4.005 1.606 4.944.94.909 2.098 1.608 4.946 1.608h6.896c2.848 0 4.006-.7 4.946-1.608C21.302 19.455 22 18.3 22 15.45V8.552c0-2.849-.698-4.006-1.606-4.945C19.454 2.7 18.296 2 15.448 2H8.552c-2.848 0-4.006.699-4.946 1.607C2.698 4.547 2 5.703 2 8.552Z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="6.545" x2="17.455" y1="12.001" y2="12.001"></line><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="12.003" x2="12.003" y1="6.545" y2="17.455"></line></svg>
								게시글 작성하기
							</div>
							<div class="fl">
								<img height="24" width="24" alt="" referrerpolicy="origin-when-cross-origin" src="https://static.xx.fbcdn.net/rsrc.php/v3/y7/r/Ivw7nhRtXyo.png">
								사진/동영상
							</div>
							<div class="fl">
								<img height="24" width="24" alt="" referrerpolicy="origin-when-cross-origin" src="https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Y4mYLVOhTwq.png">
								기분/활동
							</div>
						</div><!--íë¨ë¶ë¶-->	
					</div><!--timeline_top-->
					<div class="timeline_center">
						<div><!--ì²«ë²ì§¸ ê²ìê¸-->
						<div class="post_top">
							<a href="profile_timeline.jsp?thisUserIdx=1"><img class="fl" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?im_w=240"/></a>
							<span class="fl"><strong><a href="profile_timeline.jsp?thisUserIdx=1">민영</a></strong>님이 프로필 사진을 변경했습니다.</span>
							<span>2020년 12월 29일</span>
						</div>
						<div class="post_center">
							<img height="569" width="526" referrerpolicy="origin-when-cross-origin" src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.6435-9/48087615_2331062653835114_3621587110558957568_n.jpg?stp=dst-jpg_p526x296&amp;_nc_cat=105&amp;ccb=1-7&amp;_nc_sid=dd63ad&amp;_nc_ohc=yQo0b7ezTE8AX9M1Rk0&amp;_nc_ht=scontent-ssn1-1.xx&amp;cb_e2o_trans=t&amp;oh=00_AfBj70OwPt6fx9m3qYmlE81Xo0uFXmT5gqlbpH1_yP-Xfw&amp;oe=658E52D0">
							<img class="fl" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?im_w=240"/>
						</div><!--post1_center-->
						<div class="post_footer">
							<div>
								<div class="fl" style="margin: 2px 0 0 17px;"><svg aria-label="ì¢ìì" style="margin-top: 10px; margin-left: 10px;" fill="currentColor" height="18" role="img" viewBox="0 0 24 24" width="18"><title>ì¢ìì</title><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg></div>
								<span class="fl">5개</span>
								<div class="fr">댓글 4개</div>
							</div>
							<div><!--ì¢ìì ëê¸ ê³µì  ë²í¼-->
								<div class="like_ fl">
									<div>
										<svg class="like_svg fl" aria-label="ì¢ìì" style="margin-top: 2px; margin-left: 10px; color: black;" fill="currentColor" height="22" role="img" viewBox="0 0 24 24" width="22"><title>ì¢ìì</title><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>
										<svg class="like_svg_filled" aria-label="ì¢ìì ì·¨ì"  fill="currentColor" height="24" role="img" viewBox="0 0 48 48" width="24"><title>ì¢ìì ì·¨ì</title><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>
										<div>좋아요</div>
									</div>
								</div><!--like_-->
								<div class="comment_ fl">
									<div>
										<i data-visualcompletion="css-img" class="fl" style="background-image: url(&quot;https://static.xx.fbcdn.net/rsrc.php/v3/yp/r/UqerxUYKLay.png&quot;); background-position: 0px -550px; background-size: auto; width: 22px; height: 22px; background-repeat: no-repeat; display: inline-block; margin-top: 2px; margin-left: 10px; color: #65676B;"></i>
										<div class="fl">댓글 달기</div>
									</div>
								</div><!--comment_-->
								<div class="share_ fl">
									<div>
										<i data-visualcompletion="css-img" class="fl" style="background-image: url(&quot;https://static.xx.fbcdn.net/rsrc.php/v3/yp/r/UqerxUYKLay.png&quot;); background-position: 0px -886px; background-size: auto; width: 22px; height: 22px; background-repeat: no-repeat; display: inline-block; margin-top: 2px; margin-left: 10px;"></i>
										<div class="fl">공유하기</div>
									</div>
								</div><!--share_-->
							</div><!--ì¢ìì ëê¸ ê³µì  ë²í¼-->
							<div class="see_more">
								<button class="see_more_but">댓글 더보기</button>
							</div><!--see_more-->
							<div class="see_more_div">
								<div>
									<div class="fl profile_pic_in_comment">
										<img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/>
									</div><!--ì´ë¯¸ì§ë¥¼ ê°ì¼ div-->
									<div class="fl detail_comment">
										<div class="fl">
											<span>김은아</span>
											<div>ㅋㅋ재밌게 생기셨네요</div>											
										</div>
									</div><!--ëê¸ë´ì©-->
									<div class="fl comment_date">
										<div class="fl">49주</div>
										<button class="fl">답글 달기</button>
									</div><!--ëê¸ ìê°ê³¼ ë²í¼ë¤-->
									<img class="fr hide_comment_div" src="images/delete.png" style="margin: -60px 300px 0 0; cursor: pointer;"/>
								</div><!--ì²«ë²ì§¸ ëê¸-->
								<div>
									<div class="fl profile_pic_in_comment">
										<img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/>
									</div><!--ì´ë¯¸ì§ë¥¼ ê°ì¼ div-->
									<div class="fl detail_comment">
										<div class="fl">
											<span>김은아</span>
											<div>ㅋㅋ진짜 재밌당</div>											
										</div>
									</div><!--ëê¸ë´ì©-->
									<div class="fl comment_date" >
										<div class="fl">49주</div>
										<button class="fl">답글 달기</button>
									</div><!--ëê¸ ìê°ê³¼ ë²í¼ë¤-->
								</div><!--ëë²ì§¸ ëê¸-->
								<div class="new_comment_in_comment_detail">
									<div class="fl"><img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/></div>
									<div class="fl">
										<textarea class="new_reply1" placeholder="댓글을 입력하세요..."></textarea>
										<button class="send_button fr"><img src="images/send.png"/></button>
									</div>
								</div>
							</div>
							<div class="comment_list">
								<div>
									<div class="fl">
										<img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/>
									</div><!--ì´ë¯¸ì§ë¥¼ ê°ì¼ div-->
									<div class="fl">
										<div class="fl">
											<span>김은아</span>
											<div>ㅋㅋ재밌게 생기셨네요</div>											
										</div>
									</div><!--ëê¸ë´ì©-->
									<div class="fl">
										<div class="fl">49주</div>
										<button class="fl">답글 달기</button>
									</div><!--ëê¸ ìê°ê³¼ ë²í¼ë¤-->
								</div><!--ì²«ë²ì§¸ ëê¸-->
								<div>
									<div class="fl">
										<img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/>
									</div><!--ì´ë¯¸ì§ë¥¼ ê°ì¼ div-->
									<div class="fl">
										<div class="fl">
											<span>김은아</span>
											<div>ㅋㅋ진짜 재밌당</div>											
										</div>
									</div><!--ëê¸ë´ì©-->
									<div class="fl">
										<div class="fl">49주</div>
										<button class="fl">답글 달기</button>
									</div><!--ëê¸ ìê°ê³¼ ë²í¼ë¤-->
								</div><!--ëë²ì§¸ ëê¸-->
								<div class="new_comment">
									<div class="fl"><img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/></div>
									<div class="fl">
										<textarea class="new_reply" placeholder="댓글을 입력하세요..."></textarea>
										<button class="send_button fr"><img src="images/send.png"/></button>
									</div>
								</div>
							</div><!--comment_list-->
						</div><!--post1_footer-->
					</div><!--ì²«ë²ì§¸ ê²ìê¸-->
					<div><!--ì²«ë²ì§¸ ê²ìê¸-->
					<div class="post_top">
							<a href="profile_timeline.jsp"><img class="fl" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?im_w=240"/></a>
							<span class="fl"><strong><a href="profile_timeline.html">민영</a></strong>님이 프로필 사진을 변경했습니다.</span>
							<span>2020년 12월 29일</span>
						</div>
						<div class="post_center">
							<img height="569" width="526" referrerpolicy="origin-when-cross-origin" src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.6435-9/48087615_2331062653835114_3621587110558957568_n.jpg?stp=dst-jpg_p526x296&amp;_nc_cat=105&amp;ccb=1-7&amp;_nc_sid=dd63ad&amp;_nc_ohc=yQo0b7ezTE8AX9M1Rk0&amp;_nc_ht=scontent-ssn1-1.xx&amp;cb_e2o_trans=t&amp;oh=00_AfBj70OwPt6fx9m3qYmlE81Xo0uFXmT5gqlbpH1_yP-Xfw&amp;oe=658E52D0">
							<img class="fl" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?im_w=240"/>
						</div><!--post1_center-->
						<div class="post_footer">
							<div>
								<div class="fl" style="margin: 2px 0 0 17px;"><svg aria-label="ì¢ìì" style="margin-top: 10px; margin-left: 10px;" fill="currentColor" height="18" role="img" viewBox="0 0 24 24" width="18"><title>ì¢ìì</title><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg></div>
								<span class="fl">5개</span>
								<div class="fr">댓글 4개</div>
							</div>
							<div><!--ì¢ìì ëê¸ ê³µì  ë²í¼-->
								<div class="like_ fl">
									<div>
										<svg class="like_svg fl" aria-label="ì¢ìì" style="margin-top: 2px; margin-left: 10px; color: black;" fill="currentColor" height="22" role="img" viewBox="0 0 24 24" width="22"><title>ì¢ìì</title><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>
										<svg class="like_svg_filled" aria-label="ì¢ìì ì·¨ì"  fill="currentColor" height="24" role="img" viewBox="0 0 48 48" width="24"><title>ì¢ìì ì·¨ì</title><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>
										<div>좋아요</div>
									</div>
								</div><!--like_-->
								<div class="comment_ fl">
									<div>
										<i data-visualcompletion="css-img" class="fl" style="background-image: url(&quot;https://static.xx.fbcdn.net/rsrc.php/v3/yp/r/UqerxUYKLay.png&quot;); background-position: 0px -550px; background-size: auto; width: 22px; height: 22px; background-repeat: no-repeat; display: inline-block; margin-top: 2px; margin-left: 10px; color: #65676B;"></i>
										<div class="fl">댓글 달기</div>
									</div>
								</div><!--comment_-->
								<div class="share_ fl">
									<div>
										<i data-visualcompletion="css-img" class="fl" style="background-image: url(&quot;https://static.xx.fbcdn.net/rsrc.php/v3/yp/r/UqerxUYKLay.png&quot;); background-position: 0px -886px; background-size: auto; width: 22px; height: 22px; background-repeat: no-repeat; display: inline-block; margin-top: 2px; margin-left: 10px;"></i>
										<div class="fl">공유하기</div>
									</div>
								</div><!--share_-->
							</div><!--ì¢ìì ëê¸ ê³µì  ë²í¼-->
							<div class="see_more">
								<button class="see_more_but">댓글 더보기</button>
							</div><!--see_more-->
							<div class="see_more_div">
							
							</div>
							<div class="comment_list">
								<div>
									<div class="fl">
										<img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/>
									</div><!--ì´ë¯¸ì§ë¥¼ ê°ì¼ div-->
									<div class="fl">
										<div class="fl">
											<span>김은아</span>
											<div>ㅋㅋ재밌게 생기셨네요</div>											
										</div>
									</div><!--ëê¸ë´ì©-->
									<div class="fl">
										<div class="fl">49주</div>
										<button class="fl">답글 달기</button>
									</div><!--ëê¸ ìê°ê³¼ ë²í¼ë¤-->
								</div><!--ì²«ë²ì§¸ ëê¸-->
								<div>
									<div class="fl">
										<img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/>
									</div><!--ì´ë¯¸ì§ë¥¼ ê°ì¼ div-->
									<div class="fl">
										<div class="fl">
											<span>김은아</span>
											<div>ㅋㅋ진짜 재밌당</div>											
										</div>
									</div><!--ëê¸ë´ì©-->
									<div class="fl">
										<div class="fl">49주</div>
										<button class="fl">답글 달기</button>
									</div><!--ëê¸ ìê°ê³¼ ë²í¼ë¤-->
								</div><!--ëë²ì§¸ ëê¸-->
								<div class="new_comment">
									<div class="fl"><img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/></div>
									<div class="fl">
										<textarea class="new_reply" placeholder="댓글을 입력하세요..."></textarea>
										<button class="send_button fr"><img src="images/send.png"/></button>
									</div>
								</div>
							</div><!--comment_list-->
						</div><!--post1_footer-->
					</div><!--ì²«ë²ì§¸ ê²ìê¸-->
					<div><!--ì²«ë²ì§¸ ê²ìê¸-->
					<div class="post_top">
							<a href="profile_timeline.jsp"><img class="fl" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?im_w=240"/></a>
							<span class="fl"><strong><a href="profile_timeline.html">민영</a></strong>님이 프로필 사진을 변경했습니다.</span>
							<span>2020년 12월 29일</span>
						</div>
						<div class="post_center">
							<img height="569" width="526" referrerpolicy="origin-when-cross-origin" src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.6435-9/48087615_2331062653835114_3621587110558957568_n.jpg?stp=dst-jpg_p526x296&amp;_nc_cat=105&amp;ccb=1-7&amp;_nc_sid=dd63ad&amp;_nc_ohc=yQo0b7ezTE8AX9M1Rk0&amp;_nc_ht=scontent-ssn1-1.xx&amp;cb_e2o_trans=t&amp;oh=00_AfBj70OwPt6fx9m3qYmlE81Xo0uFXmT5gqlbpH1_yP-Xfw&amp;oe=658E52D0">
							<img class="fl" src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?im_w=240"/>
						</div><!--post1_center-->
						<div class="post_footer">
							<div>
								<div class="fl" style="margin: 2px 0 0 17px;"><svg aria-label="ì¢ìì" style="margin-top: 10px; margin-left: 10px;" fill="currentColor" height="18" role="img" viewBox="0 0 24 24" width="18"><title>ì¢ìì</title><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg></div>
								<span class="fl">5개</span>
								<div class="fr">댓글 4개</div>
							</div>
							<div><!--ì¢ìì ëê¸ ê³µì  ë²í¼-->
								<div class="like_ fl">
									<div>
										<svg class="like_svg fl" aria-label="ì¢ìì" style="margin-top: 2px; margin-left: 10px; color: black;" fill="currentColor" height="22" role="img" viewBox="0 0 24 24" width="22"><title>ì¢ìì</title><path d="M16.792 3.904A4.989 4.989 0 0 1 21.5 9.122c0 3.072-2.652 4.959-5.197 7.222-2.512 2.243-3.865 3.469-4.303 3.752-.477-.309-2.143-1.823-4.303-3.752C5.141 14.072 2.5 12.167 2.5 9.122a4.989 4.989 0 0 1 4.708-5.218 4.21 4.21 0 0 1 3.675 1.941c.84 1.175.98 1.763 1.12 1.763s.278-.588 1.11-1.766a4.17 4.17 0 0 1 3.679-1.938m0-2a6.04 6.04 0 0 0-4.797 2.127 6.052 6.052 0 0 0-4.787-2.127A6.985 6.985 0 0 0 .5 9.122c0 3.61 2.55 5.827 5.015 7.97.283.246.569.494.853.747l1.027.918a44.998 44.998 0 0 0 3.518 3.018 2 2 0 0 0 2.174 0 45.263 45.263 0 0 0 3.626-3.115l.922-.824c.293-.26.59-.519.885-.774 2.334-2.025 4.98-4.32 4.98-7.94a6.985 6.985 0 0 0-6.708-7.218Z"></path></svg>
										<svg class="like_svg_filled" aria-label="ì¢ìì ì·¨ì"  fill="currentColor" height="24" role="img" viewBox="0 0 48 48" width="24"><title>ì¢ìì ì·¨ì</title><path d="M34.6 3.1c-4.5 0-7.9 1.8-10.6 5.6-2.7-3.7-6.1-5.5-10.6-5.5C6 3.1 0 9.6 0 17.6c0 7.3 5.4 12 10.6 16.5.6.5 1.3 1.1 1.9 1.7l2.3 2c4.4 3.9 6.6 5.9 7.6 6.5.5.3 1.1.5 1.6.5s1.1-.2 1.6-.5c1-.6 2.8-2.2 7.8-6.8l2-1.8c.7-.6 1.3-1.2 2-1.7C42.7 29.6 48 25 48 17.6c0-8-6-14.5-13.4-14.5z"></path></svg>
										<div>좋아요</div>
									</div>
								</div><!--like_-->
								<div class="comment_ fl">
									<div>
										<i data-visualcompletion="css-img" class="fl" style="background-image: url(&quot;https://static.xx.fbcdn.net/rsrc.php/v3/yp/r/UqerxUYKLay.png&quot;); background-position: 0px -550px; background-size: auto; width: 22px; height: 22px; background-repeat: no-repeat; display: inline-block; margin-top: 2px; margin-left: 10px; color: #65676B;"></i>
										<div class="fl">댓글 달기</div>
									</div>
								</div><!--comment_-->
								<div class="share_ fl">
									<div>
										<i data-visualcompletion="css-img" class="fl" style="background-image: url(&quot;https://static.xx.fbcdn.net/rsrc.php/v3/yp/r/UqerxUYKLay.png&quot;); background-position: 0px -886px; background-size: auto; width: 22px; height: 22px; background-repeat: no-repeat; display: inline-block; margin-top: 2px; margin-left: 10px;"></i>
										<div class="fl">공유하기</div>
									</div>
								</div><!--share_-->
							</div><!--ì¢ìì ëê¸ ê³µì  ë²í¼-->
							<div class="see_more">
								<button class="see_more_but">댓글 더보기</button>
							</div><!--see_more-->
							<div class="comment_list">
								<div>
									<div class="fl">
										<img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/>
									</div><!--ì´ë¯¸ì§ë¥¼ ê°ì¼ div-->
									<div class="fl">
										<div class="fl">
											<span>김은아</span>
											<div>ㅋㅋ재밌게 생기셨네요</div>											
										</div>
									</div><!--ëê¸ë´ì©-->
									<div class="fl">
										<div class="fl">49주</div>
										<button class="fl">답글 달기</button>
									</div><!--ëê¸ ìê°ê³¼ ë²í¼ë¤-->
								</div><!--ì²«ë²ì§¸ ëê¸-->
								<div>
									<div class="fl">
										<img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/>
									</div><!--ì´ë¯¸ì§ë¥¼ ê°ì¼ div-->
									<div class="fl">
										<div class="fl">
											<span>김은아</span>
											<div>ㅋㅋ진짜 재밌당</div>											
										</div>
									</div><!--ëê¸ë´ì©-->
									<div class="fl">
										<div class="fl">49주</div>
										<button class="fl">답글 달기</button>
									</div><!--ëê¸ ìê°ê³¼ ë²í¼ë¤-->
								</div><!--ëë²ì§¸ ëê¸-->
								<div class="new_comment">
									<div class="fl"><img src="https://a0.muscache.com/im/pictures/user/d5461e15-ac5f-4bd6-8295-e3bf6b6fc192.jpg?im_w=240"/></div>
									<div class="fl">
										<textarea class="new_reply" placeholder="댓글을 입력하세요..."></textarea>
										<button class="send_button fr"><img src="images/send.png"/></button>
									</div>
								</div>
							</div><!--comment_list-->
						</div><!--post1_footer-->
					</div><!--ì²«ë²ì§¸ ê²ìê¸-->
					</div><!--timeline_center-->
				</div><!--timeline-->
				<div id="recommend_follow_list" class="fr">
					<div id="user_profile">
						<div class="fl">
							<img src="https://a0.muscache.com/im/pictures/user/7e2794a8-3720-4469-b0d9-c134902ffd24.jpg?im_w=240"/>
						</div>
						<div class="fl">
							이민영
						</div>
					</div><!--user_profile-->
					<div id="second_div_inrecommend">
						<div class="fl">회원님을 위한 추천</div>
						<a href="#" class="fr">모두 보기</a>
					</div><!--second_div_inrecommend-->
					<div class="user_list">
						<div class="user_img_ fl">
							<a href="profile_timeline.jsp"><img src="https://a0.muscache.com/im/pictures/user/5bb3116b-163b-4c89-ae31-f52ad8a8a6bf.jpg?im_w=240"></a>
						</div><!--user_img_-->
						<div class="recommend_user_info_ fl">
							<a href="profile_timeline.jsp"><div>ilove_question</div></a>
							<div>_parkxo_님이 팔로우합니다</div>
						</div><!--recommend_user_info_-->
						<div class="following_button_ fl">
							<button>
								팔로우
							</button>
							<button>
								팔로잉
							</button>
						</div><!--following_button_-->
					</div><!--user_list-->
					<div class="user_list">
						<div class="user_img_ fl">
							<a href="profile_timeline.jsp"><img src="https://a0.muscache.com/im/pictures/user/5bb3116b-163b-4c89-ae31-f52ad8a8a6bf.jpg?im_w=240"></a>
						</div><!--user_img_-->
						<div class="recommend_user_info_ fl">
							<a href="profile_timeline.jsp"><div>ilove_question</div></a>
							<div>_parkxo_님이 팔로우합니다</div>
						</div><!--recommend_user_info_-->
						<div class="following_button_ fl">
							<button>
								팔로우
							</button>
							<button>
								팔로잉
							</button>
						</div><!--following_button_-->
					</div><!--user_list-->
					<div class="user_list">
						<div class="user_img_ fl">
							<a href="profile_timeline.jsp"><img src="https://a0.muscache.com/im/pictures/user/5bb3116b-163b-4c89-ae31-f52ad8a8a6bf.jpg?im_w=240"></a>
						</div><!--user_img_-->
						<div class="recommend_user_info_ fl">
							<a href="profile_timeline.html"><div>ilove_question</div></a>
							<div>_parkxo_님이 팔로우합니다</div>
						</div><!--recommend_user_info_-->
						<div class="following_button_ fl">
							<button>
								팔로우
							</button>
							<button>
								팔로잉
							</button>
						</div><!--following_button_-->
					</div><!--user_list-->
					<div class="user_list">
						<div class="user_img_ fl">
							<a href="profile_timeline.html"><img src="https://a0.muscache.com/im/pictures/user/5bb3116b-163b-4c89-ae31-f52ad8a8a6bf.jpg?im_w=240"></a>
						</div><!--user_img_-->
						<div class="recommend_user_info_ fl">
							<a href="profile_timeline.html"><div>ilove_question</div></a>
							<div>_parkxo_님이 팔로우합니다</div>
						</div><!--recommend_user_info_-->
						<div class="following_button_ fl">
							<button>
								팔로우
							</button>
							<button>
								팔로잉
							</button>
						</div><!--following_button_-->
					</div><!--user_list-->
					<div class="user_list">
						<div class="user_img_ fl">
							<a href="profile_timeline.html"><img src="https://a0.muscache.com/im/pictures/user/5bb3116b-163b-4c89-ae31-f52ad8a8a6bf.jpg?im_w=240"></a>
						</div><!--user_img_-->
						<div class="recommend_user_info_ fl">
							<a href="profile_timeline.html"><div>ilove_question</div></a>
							<div>_parkxo_님이 팔로우합니다</div>
						</div><!--recommend_user_info_-->
						<div class="following_button_ fl">
							<button>
								팔로우
							</button>
							<button>
								팔로잉
							</button>
						</div><!--following_button_-->
					</div><!--user_list-->
					<div class="user_list">
						<div class="user_img_ fl">
							<a href="profile_timeline.html"><img src="https://a0.muscache.com/im/pictures/user/5bb3116b-163b-4c89-ae31-f52ad8a8a6bf.jpg?im_w=240"></a>
						</div><!--user_img_-->
						<div class="recommend_user_info_ fl">
							<a href="profile_timeline.html"><div>ilove_question</div></a>
							<div>_parkxo_님이 팔로우합니다</div>
						</div><!--recommend_user_info_-->
						<div class="following_button_ fl">
							<button>
								팔로우
							</button>
							<button>
								팔로잉
							</button>
						</div><!--following_button_-->
					</div><!--user_list-->
					
					
				</div><!--recommend_follow_list-->
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