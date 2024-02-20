<%@page import="com.sw.dto.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDto dto = (BoardDto)request.getAttribute("BoardDto");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="${pageContext.request.contextPath}//resources/js/jquery-3.7.1.min.js"></script>
		<script>
			$(function() {
				$("#btn_to_list").click(function() {
					location.href = "${pageContext.request.contextPath}/board/list?page=1"; // (단순화) 1페이지 목록 보기로 이동
				})
				$("#btn_modify").click(function() {
					location.href = "${pageContext.request.contextPath}/board/modify?bno=${BoardDto.bno}";
				})
				$("#btn_delete").click(function() {
					location.href = "${pageContext.request.contextPath}/board/delete/action?bno=${BoardDto.bno}";
				})
			})
		</script>
		<style>
			table { border-collapse: collapse; border: 1px solid grey; }
			td, th { font-size: 14px; border: 1px solid grey; }
			th { width: 150px; }
			td { width: 650px; }
		</style>
	</head>
	
	<body>
		<h1>게시글 상세보기</h1>
		<table>
			<tr>
				<th>글번호</th>
				<td>${BoardDto.bno}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%= dto.getWriter() %></td>
			</tr>
			<tr>
				<th>작성일시</th>
				<td><%= dto.getWritedate() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%= dto.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%= dto.getContent() %></td>
			</tr>
		</table>
		<button id="btn_to_list">목록보기</button>
		<button id="btn_modify">수정하기</button>
		<button id="btn_delete">삭제하기</button>
	</body>
</html>