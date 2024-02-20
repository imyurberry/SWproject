<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에어비앤비 숙소 호스트가 되어보세요</title>
		<link rel="shortcut icon" href="images/logo2.png">
		<link rel ="stylesheet" href="css/doairbnb.css"/>
		<script src="js/jquery-3.7.1.min.js"></script>
		<script src="js/doairbnb.js"></script>
	</head>
	
	<body id="body">
		<div id="header">
			<div id="header_left" class="fl">
				<a href="Main2"><img src="images/logo2.png" class="fr"/></a>
			</div><!--header_left-->
			<div id="header_center" class="fl">
			</div><!--header_center-->
			<div id="header_right" class="fl">
				<div id="doairbnb" class="fl">에어비앤비할 준비가 되셨나요?</div><!--doairbnb-->
				<a href="OutOfService.jsp">
					<div id="createbnb" class="fl">
						<img src="images/airbnb.png"/>
						<p>에어비앤비 스타트</p>
					</div><!--createbnb-->
				</a>
				<div style ="clear : both;"></div>
				<div style ="clear : both;"></div>
			</div><!--header_right--> <!--íë¡íê³¼ ì§êµ¬ë³¸, ìì´ë¹ì¤ë¹ë¥¼ ê°ì¸ë div-->
			<div style ="clear : both;"></div>
		</div><!--ë¨¸ë¦¿ë§-->
		
		<div id="content">
			<div id="content_fir">
				<div>
					<div class="fl">
						<h1><span>당신의 공간을</span><span>에어비앤비하세요.</span><span>예상 수입</span></h1>
						<div id="price">
							<span class="fl">₩</span>
							<span class="fl">
								<span id="total_price">731,745</span>
							</span>
						</div><!--price-->
						<p><button>3박</button>에 대한 예상 수입(1박 요금이 ₩211,001일 경우)</p>
						<div><input type="range" max="7" min="0" step="1" value="3" class="slide_but"/></div>
						<button id="select_htdi">에어비앤비가 예상 수입을 산정하는 방법</button>
						<div id="how_to_decide_import">
							<div id="htdi_header"><button class="close_button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 3; overflow: visible;"><path d="m6 6 20 20M26 6 6 26"></path></svg></button></div>
							<div id="htdi_footer"><h1>에어비앤비가 예상 수입을 산정하는 방법</h1><div>에어비앤비는 비슷한 에어비앤비 숙소의 지난 12개월간 예약 데이터를 검토하여 예상 수입을 계산합니다. 비슷한 숙소는 숙소에 대해 알려주신 정보를 바탕으로 선정됩니다. 숙소 주소를 입력하면 가까운 거리에 있는 숙소들을 기준으로 더 구체적인 예상 요금을 확인하실 수 있습니다. 지역을 입력하면 해당 지역 내 비슷한 숙소 중 수입 기준 상위 50% 숙소를 기준으로 한 예상 수입이 표시됩니다.<br><br>에어비앤비는 비슷한 숙소를 기준으로 평균 1박 수입을 예상한 후 여기에 호스트가 호스팅할 예정이라고 표시한 숙박 일수를 곱합니다. 또한, 그달에 모든 에어비앤비 숙소가 매일 예약 가능하다는 가정하에 해당 지역의 한 달 평균 예약 일수를 안내해드립니다. (1박당 호스팅 수입은 각 호스트가 정한 요금에서 에어비앤비 호스트 서비스 수수료를 제외한 금액으로, 세금 또는 호스팅 비용은 공제되지 않습니다.) <br><br>실제 수입은 숙소의 예약 가능일과 요금, 해당 지역 내 수요 등 여러 요인에 따라 달라질 수 있습니다. 또한, 현지 법규에 따라 호스팅 가능 여부 및 요건이 변경될 수 있습니다. 책임감 있는 호스팅에 관해 자세히 알아보세요.<br><br>예상 수입은 숙소 가치를 평가하거나 추정한 것이 아닙니다.</div></div>
						</div>
						<div id="htdi_background"></div>
						<button id="search">
							<div>
								<div class="fl"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: rgb(255, 56, 92); stroke-width: 4; overflow: visible;"><path fill="none" d="M13 24a11 11 0 1 0 0-22 11 11 0 0 0 0 22zm8-3 9 9"></path></svg></div>							
								<div>Goyang-si</div>
								<div class="fl">공간 전체</div>
								<span class="fl">·</span>
								<div class="fl">침실 2개</div>
							</div><!--ê²ìì°½ ìì ê¸ìë¤ì ë£ì div-->
						</button><!--search-->
					</div><!--ìì´ë¹ì¤ë¹ ë²í¼-->
					<div class="fl">
						<img src="images/map.png"/>
					</div>
				</div><!--ì²«ë²ì§¸ div-->
			</div><!--content_fir-->
			<div id="content_sec">
				<div>
					<h2>에어비앤비 스타트로 쉽게 에어비앤비하세요</h2>
					<img src="https://a0.muscache.com/im/pictures/5dcdc471-a645-4a34-b06d-3cb84e9c15c5.jpg?im_w=2560&im_q=highq"/>
					<div id="content_sec_bottom">
						<div class="fl">
							<h3>슈퍼호스트의 일대일 지원</h3>
							<div>에어비앤비가 숙소 운영 경험이 풍부한 슈퍼호스트와 연결해 드립니다. 전화, 화상 통화 또는 채팅을 통해 한국어로 호스팅에 대한 궁금증을 해결하고 첫 게스트를 맞이하는 방법도 배우실 수 있어요. 슈퍼호스트의 도움을 무료로 받아보세요.</div>
						</div>
						<div class="fl">
							<h3>첫 예약에서 경험이 풍부한 게스트를 맞이하는 옵션</h3>
							<div>에어비앤비에서 최소 3건의 숙박을 완료하고 평점이 좋은 게스트를 첫 게스트로 맞이하도록 선택할 수 있습니다.</div>
						</div>
						<div class="fl">
							<h3>에어비앤비의 특별 지원</h3>
							<div>신규 호스트는 터치 한 번으로 특별 교육을 받은 고객지원 상담원과 연결되어 계정 문제부터 대금 수령까지 모든 방면에서 도움을 받을 수 있습니다.</div>
						</div>
					</div><!--content_sec_bottom-->
				</div>
			</div><!--content_sec-->
			<div id="content_thr">
				<div>
					<img aria-hidden="true" alt="í¸ì¤í¸ë¥¼ ìí ìì´ì»¤ë² ë¡ê³ " decoding="async" elementtiming="LCP-target" fetchpriority="low" loading="lazy" src="https://a0.muscache.com/im/pictures/54575c71-0273-43be-938b-1a55cffe7c38.jpg?im_w=480&amp;im_q=highq" data-original-uri="https://a0.muscache.com/im/pictures/54575c71-0273-43be-938b-1a55cffe7c38.jpg?im_w=480&amp;im_q=highq" style="--dls-liteimage-object-fit: contain; --dls-liteimage-object-position: middle;">
					<h2>호스팅 전반에 걸친 보호를 받으며 에어비앤비하세요</h2>
					<div>
						<table>
							<thead>
								<tr>
									<th></th>
									<th>에어비앤비</th>
									<th>경쟁사</th>
								</tr>
							</thead>
							<tbody>
								<tr id="table1">
									<th><div>게스트 신원 확인</div></th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
								</tr><!--table1-->
								<tr id="table2">
									<td>에어비앤비는 포괄적인 인증 시스템을 통해 이름, 주소, 정부 발급 신분증 등의 상세 정보를 확인하여, 예약하는 게스트의 신원을 확인합니다.</td>
									<td></td>
									<td></td>
								</tr><!--table2-->
								<tr id="table3">
									<th>예약 심사</th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#E12C32;stroke-width:5.333333333333333;overflow:visible" aria-label="ê²½ìì¬ ë¯¸ì ê³µ ì¬í­" role="img" focusable="false"><path d="m6 6 20 20M26 6 6 26"></path></svg></div></td>
								</tr>
								<tr id="table4">
									<td>에어비앤비의 독자적 기술로 예약당 수백 가지 요인을 분석하여 소란스러운 파티 및 숙소 피해가 발생할 위험이 높은 특정 예약을 차단합니다.</td>
									<td></td>
									<td></td>
								</tr>
								<tr id="table5">
									<th>미화 3백만 달러까지 보장하는 손해보상</th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#E12C32;stroke-width:5.333333333333333;overflow:visible" aria-label="ê²½ìì¬ ë¯¸ì ê³µ ì¬í­" role="img" focusable="false"><path d="m6 6 20 20M26 6 6 26"></path></svg></div></td>
								</tr>
								<tr id="table6">
									<td>게스트로 인해 숙소나 물품에 피해가 발생할 경우 에어비앤비에서 보상해드리며, 여기에는 다음과 같은 특별 보호 항목이 포함됩니다.</td>
									<td></td>
									<td></td>
								</tr>
								<tr id="table7">
									<th>예술품∙귀중품</th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#E12C32;stroke-width:5.333333333333333;overflow:visible" aria-label="ê²½ìì¬ ë¯¸ì ê³µ ì¬í­" role="img" focusable="false"><path d="m6 6 20 20M26 6 6 26"></path></svg></div></td>
								</tr>
								<tr id="table8">
									<th>자동차∙보트</th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#E12C32;stroke-width:5.333333333333333;overflow:visible" aria-label="ê²½ìì¬ ë¯¸ì ê³µ ì¬í­" role="img" focusable="false"><path d="m6 6 20 20M26 6 6 26"></path></svg></div></td>
								</tr>
								<tr id="table9">
									<th>반려동물에 의한 피해</th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#E12C32;stroke-width:5.333333333333333;overflow:visible" aria-label="ê²½ìì¬ ë¯¸ì ê³µ ì¬í­" role="img" focusable="false"><path d="m6 6 20 20M26 6 6 26"></path></svg></div></td>
								</tr>
								<tr id="table10">
									<th>수입 손실</th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#E12C32;stroke-width:5.333333333333333;overflow:visible" aria-label="ê²½ìì¬ ë¯¸ì ê³µ ì¬í­" role="img" focusable="false"><path d="m6 6 20 20M26 6 6 26"></path></svg></div></td>
								</tr>
								<tr id="table11">
									<th>전문 청소</th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#E12C32;stroke-width:5.333333333333333;overflow:visible" aria-label="ê²½ìì¬ ë¯¸ì ê³µ ì¬í­" role="img" focusable="false"><path d="m6 6 20 20M26 6 6 26"></path></svg></div></td>
								</tr>
								<tr id="table12">
									<th>미화 1백만 달러까지 보장하는 책임보험</th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
								</tr>
								<tr id="table13">
									<td>게스트가 다치거나 재산 피해(물품 파손 또는 도난)를 입는 만일의 경우에도 호스트를 보호해드립니다.</td>
									<td></td>
									<td></td>
								</tr>
								<tr id="table14">
									<th>24시간 안전 지원 라인</th>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#00A506;stroke-width:5.333333333333333;overflow:visible" aria-label="ìì´ë¹ì¤ë¹ ì ê³µ ì¬í­" role="img" focusable="false"><path fill="none" d="m4 16.5 8 8 16-16"></path></svg></div></td>
									<td><div><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" style="display:block;fill:none;height:24px;width:24px;stroke:#E12C32;stroke-width:5.333333333333333;overflow:visible" aria-label="ê²½ìì¬ ë¯¸ì ê³µ ì¬í­" role="img" focusable="false"><path d="m6 6 20 20M26 6 6 26"></path></svg></div></td>
								</tr>
								<tr id="table15">
									<td>안전에 위협을 느낄 경우, 앱에서 터치 한 번이면 24시간 언제든 특별 교육을 받은 안전 전문 상담원의 신속한 지원을 받으실 수 있습니다.</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<p>2022년 10월 기준으로 주요 경쟁사에서 제공하는 무료 혜택 및 공개 정보를 바탕으로 비교한 것입니다. 상세 내용과 예외 사항은 <a style="color: black; text-decoration: underline;" href="OutOfService.html">여기</a>에서 확인하세요.</p>
					</div><!--table ë¤ì´ê° div-->
					<span><a href="OutOfService.jsp" style="color: black;"><div>자세히 알아보기</div></a></span>
				</div>
			</div><!--content_thr-->
			<div id="content_four">
				<div>
					<div class="fl" id="fourth_left">
						<h2>자주 묻는 질문과<br/>답변</h2>
					</div>
					<div class="fl" id="fourth_right">
						<div>
							<div>
								<div class="fl">제 공간이 에어비앤비 숙소로 적합할까요?</div>
								<div class="fl"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path></svg></div>
							</div>
						</div>
						<div>
							<div>
								<div class="fl">일 년 내내 호스팅해야 하나요?</div>
								<div class="fl"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path></svg></div class="fl">
							</div>
						</div>
						<div>
							<div>
								<div class="fl">게스트와 얼마나 소통해야 하나요?</div>
								<div class="fl"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path></svg></div>
							</div>
						</div>
						<div>
							<div>
								<div class="fl">훌륭한 에어비앤비 호스트가 되기 위한 팁이 있나요?</div>
								<div class="fl"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path></svg></div>
							</div>
						</div>
						<div>
							<div>
								<div class="fl">에어비앤비 수수료는 얼마인가요?</div>
								<div class="fl"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 16px; width: 16px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><path fill="none" d="M28 12 16.7 23.3a1 1 0 0 1-1.4 0L4 12"></path></svg></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="content_fif">
				<div>
					<div id="fif_left" class="fl"><img aria-hidden="true" decoding="async" elementtiming="LCP-target" fetchpriority="low" loading="lazy" src="https://a0.muscache.com/im/pictures/c19751e5-cd4f-41d0-898f-2580b60cae08.jpg?im_w=1200&amp;im_q=highq" data-original-uri="https://a0.muscache.com/im/pictures/c19751e5-cd4f-41d0-898f-2580b60cae08.jpg?im_w=1200&amp;im_q=highq" style="--dls-liteimage-object-fit: cover; --dls-liteimage-object-position: center center; --dls-liteimage-border-radius: 16px 0px 0px 16px;"></div>
					<div id="fif_right" class="fl">
						<h2>더 궁금하신 점이 있나요?</h2>
						<h3>같은 지역에 있는 경험이 풍부한 슈퍼호스트에게 물어보세요.</h3>
						<div><a href="OutOfService.jsp" style="color: black;"><button>슈퍼호스트 매칭 신청</button></a></div>
					</div>
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