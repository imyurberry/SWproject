<%@page import="esDao.LoginDao"%>
<%@page import="esVo.UserInfoVo"%>
<%@page import="esVo.LanguageVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="esDao.LanguageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    LanguageDao langDao = new LanguageDao();
	ArrayList<LanguageVo> listLanguageVo = langDao.getLanguage();
	LoginDao LoginDao = new LoginDao();
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
	<title>에어비앤비: 휴가용 임대 숙소, 통나무집, 비치 하우스, 독특한 숙소 및 체험</title>
		<link rel="shortcut icon" href="images/logo2.png">
	    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700' rel='stylesheet' type='text/css'>
	    <link rel="stylesheet" href="css/privacy.css"/>
	    <script src="js/jquery-3.7.1.min.js"></script>
	    <script src="js/privacy.js"></script>
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
									</div><!--currency_center-->
								</div>
					</div><!--currency_-->
					<div id="language_"></div><!--language_-->
				</div><!--currency_language_-->
		<div id="header">
			<div id="header_left" class="fl">
				<a href="Main2"><img src="images/logo.png" class="fr"/></a>
			</div><!--header_left-->
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
	         	   <input type="hidden" name="url" value="privacy.jsp"/>
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
      		<form method="post" class="join_user_form" action="SesController?command=join">
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
		<div id="line"></div>
		
		<div id= section1>
		   <div id="section1-1">계정
		   	  <svg viewBox="0 0 18 18" role="presentation" aria-hidden="true" focusable="false" style="height: 10px; width: 10px; fill: rgb(118, 118, 118);"><path d="m4.29 1.71a1 1 0 1 1 1.42-1.41l8 8a1 1 0 0 1 0 1.41l-8 8a1 1 0 1 1 -1.42-1.41l7.29-7.29z" fill-rule="evenodd"></path></svg>
		      <span>개인정보</span>
		      <h2>개인정보</h2>
		   </div>
		</div>
		
		<div id="section2">
		   <div id="section2-1">
		      <div class="section_content1">
		      
		         <div class="section_content1-1">
		            <span class="sp1">실명</span><br>
		            <span class="sp2">허가증이나 여권 등 여행 서류에 기재되어 있는 이름을 말합니다.</span>
		            <button class="cancel_button1">취소</button>
		            <button class="edit_button1">수정</button>
		         </div>
		         
		         <form action="SesController" style="display: none;" method="get">
		            <div class="section_content1-2">
		            <% if(userList != null) {%>
		               <div class="section_content_input">
		                  <span>이름</span>
		                  <input type="text" id="fist_name" name="first_name"/>
		               </div>
		               <div class="section_content_input">
		                  <span>성</span>
		                  <input type="text" id="last_name" name="last_name"/>
		               </div>
		             <% } else { %> 
		          	<script>
						$(function(){
							$(".edit_button1").click(function(){
								alert("로그인부터 해주세요");
							});
						});	          		
		          	</script>
		          <%	} %>
		            </div>
		         <div class="section1-3" style="display: none;">
		            <input type="submit" value="저장하기" class="submit"/>
		            <input type="hidden" name="command" value="updateName"/>
		         </div>
		         </form>
		         
		      </div>
		      
		      <!-- ì´ë©ì¼ -->
		      <div class="section_content1"><!-- ì»¨íì¸ ë´ëê³³ -->
		         <div class="section_content1-1">
		            <span class="sp1">이메일 주소</span><br>
		            <span class="sp2">언제든지 확인하실 수 있는 주소를 사용하세요</span>
		            <button class="cancel_button2">취소</button>
		            <button class="edit_button2">수정</button>
		         </div>
		          <% if(userList != null) {%>
		          <form class="fom1" action="SesController" style="display: none;" method="get">
		            <input type="text" id="email" class="ani_box" name="email" required />
		            <label for="email" class="title2"><span>이메일 주소</span></label>
		         </form>
		         <% } else { %> 
		          	<script>
						$(function(){
							$(".edit_button2").click(function(){
								alert("로그인부터 해주세요");
							});
						});	          		
		          	</script>
		          <%	} %>
		         
		         <div class="section1-3" style="display: none;">
		         	<input type="hidden" name="command" value="updateEmail"/>
		            <input type="submit" value="저장하기"/>
		         </div>
		      </div>
		   
		      <!-- ì ë²  -->
		      <div class="section_content2">
		         <div class="section_content1-1">
		            <span class="sp1">전화번호</span><br>
		            <span class="sp2">알림, 미리 알림 및 로그인에 도움이 됩니다.</span>
		            <button class="cancel_button3">닫기</button>
		            <button class="edit_button3">수정</button>
		         </div>
		         <div class="section_content1-3" style="display: none;">
		            <% if(userList != null) {%>
		            <span><%=userList.getPhone_number() %></span>
		            <button>수정</button>
		            <% } %>
		         </div>
		      </div>
		      	<form class="edit_phone_num" action="SesController" style="display: none;" method="get">
		      	<% if(userList != null) {%>
		            <input type="text" name="phone_num" id="phone_num" class="ani_box" value="<%=userList.getPhone_number() %>" required />
		            <label for="phone_num" class="title2"><span>전화번호</span></label><br/>
		            <input type="submit" value="수정하기" class="submit"/>
		            <input type="hidden" name="command" value="updatePhoneNum"/> 
		        <% } %>
		        </form>
		      <!-- ì ë¶ì¦ì­ì   -->
		      <div class="section_content3">
		         <div class="section_content1-1">
		            <span class="sp1">정부 발급 신분증</span><br>
		            <span class="sp2">제공됨</span>
		            <button>삭제</button>
		         </div>
		      </div>
		      <div id="id_popup">
		         
		      </div>
		      <!-- ì£¼ì -->
		      <div class="section_content4">
		         <div class="section_content1-1">
		            <span class="sp1">주소</span><br>
		            <span class="sp2">우편물을 수령할 수 있는 정식 주소를 입력하세요.</span>
		            <button class="cancel_button4">취소</button>
		            <button class="edit_button4">수정</button>
		         </div>
		         
		         <div class="section_content1-5" style="display: none;"><!--ë¹¨ê°  -->
		            <form id="form2" action="SesController?command=updateAddress" method="get">
		               <div>
		               		<input type="hidden" name="command" value="updateAddress"/>
		                    <select name="languages" id="lang">
		                      <option>국가 / 지역</option>
		                      <%
			                        	for( int i = 0; i <= 90; i++ ) {
			                  %>
			                              <option><%=listLanguageVo.get(i).getLocation() %></option>
			                  <%
			                       		} 
			                  %>
		                    </select>
		                </div>
		                 
		             <div class="section_content1-6">
		               <div class="section_space">
		                    <div class="section_content_input2 fl" >
		                       <input type="text" id="box1" class="ani_box" name="state" required />
		                        <label for="box1" class="title2"><span>주/도</span></label>
		                    </div>
		                    <div class="section_content_input2 fl" >
		                       <input type="text" id="box2" class="ani_box" name="city" required />
		                        <label for="box2" class="title2"><span>시/군/구</span></label>
		                    </div>
		               </div>
		               <div>
		                   <div class="section_content_input2" >
		                      <input type="text" id="email" class="ani_box" name="street_address" required />
		                      <label for="email" class="title2"><span>도로명 주소</span></label>
		                    </div>
		               </div>
		               <div>
		                    <div class="section_content_input2" >
		                       <input type="text" id=" address" class="ani_box" required />
		                      <label for=" address" class="title2"><span>동호수(선택 사항)</span></label>
		                    </div>
		                </div>
		                <div>
		                     <div class="section_content_input2 fl" >
		                       <input type="text" id="post" class="ani_box" required />
		                        <label for="post" class="title2"><span>우편번호</span></label>
		                    </div>
		                </div>
		             </div>  
		                 
		         </div>
		         <input type="hidden" name="url" value="privacy.jsp"/>
		         <div class="section1-3" style="margin-top:8px; display: none;">
		            <input type="submit" value="저장하기" class="submit"/>
		         </div>   
		              </form>
		            
		      </div><!-- ì£¼ìë  -->
		      
		      <!-- ë¹ìì°ë½ì² -->
		      <div class="section_content5">
		         <div class="section_content1-1">
		            <span class="sp1">비상 연락처</span><br>
		            <span class="sp2">긴급 상황 발생 시 연락할 수 있도록 가까운 사람의 연락처를 알려주세요.</span>
		            <button class="cancel_button5">취소</button>
		            <button class="edit_button5">수정</button>
		         </div>
		         <form id="form3" action="SesController?command=updateSecondNum" style="display: none;" method="get">
		            <div>
		               <div class="section_content_input2" >
		               	  <input type="hidden" name="command" value="updateSecondNum"/>
		                  <input type="text" id="friend_name" class="ani_box" required />
		                  <label for="firend_name" class="title2"><span>이름</span></label>
		               </div>
		             </div>
		             <div>
		               <div class="section_content_input2" >
		                  <input type="text" id="relation" class="ani_box" required />
		                  <label for="relation" class="title2"><span>관계</span></label>
		               </div>
		             </div>
		             
		             <div>
		                  <label for="form3" id="lang2" ></label>
		                  <select name="languages2" class="seclect_box">
		                   <option>선호하는 언어</option>
		                   <%
			                        	for( int i = 0; i <= 90; i++ ) {
			                  %>
			                              <option><%=listLanguageVo.get(i).getLanguage() %></option>
			                  <%
			                       		} 
			                  %>
		                 </select>
		             </div>
		             
		             <div>
		               <div class="section_content_input2" >
		                  <input type="text" id="email" class="ani_box" required />
		                  <label for="email" class="title2"><span>이메일</span></label>
		               </div>
		             </div>
		             
		            <div class="section_space">
		                 <div class="section_content_input2" >
		                  <input type="text" id="phone_num" class="ani_box" name="secondNum"required />
		                  <label for="phone_num" class="title2"><span>전화번호</span></label>
		                 </div>
		            </div>
		                
		         	 <input type="hidden" name="url" value="privacy.jsp"/>
		             <div class="section1-3" style="display: none;">
		            <input type="submit" value="저장하기" class="submit"/>
		            </div>
		         </form>
		      </div>
		      
		   </div>
		   
		   <div id="section2-2"><!-- ì¤ë¥¸ìª½ -->
		      <div class="section_content2-1">
		         <svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 48px; width: 48px; fill: rgb(227, 28, 95); stroke: currentcolor;"><g><g stroke="none"><path d="M27 5l.585.005c4.29.076 8.837.984 13.645 2.737l.77.288V35.4l-.008.13a1 1 0 0 1-.47.724l-.116.06L27 42.716V25a1 1 0 0 0-.883-.993L26 24H12V8.029l.77-.286c4.797-1.75 9.336-2.658 13.62-2.737L27 5z" fill-opacity=".2"></path><path d="M27 1c5.599 0 11.518 1.275 17.755 3.816a2 2 0 0 1 1.239 1.691L46 6.67V35.4a5 5 0 0 1-2.764 4.472l-.205.097-15.594 6.93L27 47l-2.461-1h2.451a.01.01 0 0 0 .007-.003L27 45.99v-1.085l15.218-6.763a3 3 0 0 0 1.757-2.351l.019-.194.006-.196V6.669l-.692-.278C37.557 4.128 32.121 3 27 3S16.443 4.128 10.692 6.391L10 6.67 9.999 24H8V6.669a2 2 0 0 1 1.098-1.786l.147-.067C15.483 2.275 21.401 1 27 1z"></path></g><g fill="none" stroke-width="2"><path d="M4 24h22a1 1 0 0 1 1 1v20.99a.01.01 0 0 1-.01.01H4a1 1 0 0 1-1-1V25a1 1 0 0 1 1-1z"></path><path d="M21 25v-5a6 6 0 1 0-12 0v5"></path><circle cx="15" cy="35" r="2"></circle></g></g></svg>
		         <span class="section2_sp1">여기에 내 개인정보가 표시되지 않는 이유가 무엇인가요?</span>
		         <span class="section2_sp2">신분이 노출되지 않도록 일부 계정<br/> 정보가 숨김 처리되었습니다.</span>
		      </div>
		      
		      <div class="section_content2-1">
		         <svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 48px; width: 48px; fill: rgb(227, 28, 95); stroke: currentcolor;margin-top: 32px;"><g stroke="none"><path d="m39 15.999v28.001h-30v-28.001z" fill-opacity=".2"></path><path d="m24 0c5.4292399 0 9.8479317 4.32667079 9.9961582 9.72009516l.0038418.27990484v2h7c1.0543618 0 1.9181651.8158778 1.9945143 1.8507377l.0054857.1492623v32c0 1.0543618-.8158778 1.9181651-1.8507377 1.9945143l-.1492623.0054857h-34c-1.0543618 0-1.91816512-.8158778-1.99451426-1.8507377l-.00548574-.1492623v-32c0-1.0543618.81587779-1.9181651 1.85073766-1.9945143l.14926234-.0054857h7v-2c0-5.5228475 4.4771525-10 10-10zm17 14h-34v32h34zm-17 14c1.6568542 0 3 1.3431458 3 3s-1.3431458 3-3 3-3-1.3431458-3-3 1.3431458-3 3-3zm0 2c-.5522847 0-1 .4477153-1 1s.4477153 1 1 1 1-.4477153 1-1-.4477153-1-1-1zm0-28c-4.3349143 0-7.8645429 3.44783777-7.9961932 7.75082067l-.0038068.24917933v2h16v-2c0-4.418278-3.581722-8-8-8z"></path></g></svg>
		         <span class="section2_sp1">수정할 수 있는 세부 정보는<br/> 무엇인가요?</span>
		         <span class="section2_sp2">연락처 정보와 개인정보를 수정하실 수<br/> 있습니다. 본인 인증 시 이 정보를<br/> 사용했다면 호스팅을 계속하기 위해<br/> 또는 다음번 예약 진행 시 다시 인증을<br/> 받으셔야 합니다.</span>
		      </div>
		      
		      <div class="section_content2-1" style="border-bottom:none;">
		         <svg viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; height: 48px; width: 48px; fill: rgb(227, 28, 95); stroke: currentcolor;margin-top: 32px;"><g stroke="none"><path d="M24 9C14.946 9 7.125 15.065 4.74 23.591L4.63 24l.013.054c2.235 8.596 9.968 14.78 18.99 14.943L24 39c9.053 0 16.875-6.064 19.26-14.59l.11-.411-.013-.052c-2.234-8.597-9.968-14.78-18.99-14.944L24 9z" fill-opacity=".2"></path><path d="M24 5c11.18 0 20.794 7.705 23.346 18.413l.133.587-.133.587C44.794 35.295 35.181 43 24 43 12.82 43 3.206 35.295.654 24.588l-.133-.587.048-.216C2.985 12.884 12.69 5 24 5zm0 2C13.88 7 5.16 13.887 2.691 23.509l-.12.492.032.14c2.288 9.564 10.728 16.513 20.65 16.846l.377.01L24 41c10.243 0 19.052-7.056 21.397-16.861l.031-.14-.031-.138c-2.288-9.566-10.728-16.515-20.65-16.848l-.377-.01L24 7zm0 10a7 7 0 1 1 0 14 7 7 0 0 1 0-14zm0 2a5 5 0 1 0 0 10 5 5 0 0 0 0-10z"></path></g></svg>
		         <span class="section2_sp1">다른 사람에게 어떤 정보가<br/> 공개되나요?</span>
		         <span class="section2_sp2">에어비앤비는 예약이 확정된 후에만<br/> 호스트 및 게스트의 연락처 정보를<br/> 공개합니다.</span>
		      </div>
		   </div>
		</div>
		
	</body>
</html>