<%@ page import="com.sw.dto.BoardDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
	ArrayList<BoardDto> list1 = (ArrayList<BoardDto>)request.getAttribute("listBoard");
	
	int pageNum = (Integer)request.getAttribute("pageNum");
	int startPNum = (Integer)request.getAttribute("startPNum");
	int endPNum = (Integer)request.getAttribute("endPNum");
	int lastPageNum = (Integer)request.getAttribute("lastPageNum");
	
	String msg = (String)request.getAttribute("msg");
	request.setAttribute("msg", null);
%>

<%
	if(msg!=null) {
%>
		<script>alert("<%= msg %>");</script>
<%		
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 목록</title>
		<script src="${contextPath}/resources/js/jquery-3.7.1.min.js"></script>
		<script>
			$(function() {
				$("tr").click(function() {
					let bno = $(this).find(".bno").text();
					location.href = "${pageContext.request.contextPath}/board/detail?bno=" + bno;
				});
				$("#btn_write").click(function() {
					location.href = "${pageContext.request.contextPath}/board/write";
				})
				/*
				$("#btn_logout").click(function() {
					location.href = "${pageContext.request.contextPath}/logout";
				})
				*/
			})
		</script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
		<style>
			.fl { float: left; }
			.fr { float: right; }
			table { border-collapse: collapse; border: 1px solid grey; }
			td, th { font-size: 14px; }
			
			#pagination { 
				font-size: 30px; 
				width: 300px; 
				margin: 0 auto; 
			}
			#pagination a {
				text-decoration: none;
			}
		</style>
	</head>
	
	<body>
		<div class="container">
			<h1>게시글 전체 보기</h1>
			<button id="btn_logout" class="fr">로그아웃</button>
			<div style="clear: both;"></div>
			<table class="table table-striped">
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일시</th>
					<th>조회수</th>
				</tr>
				<%
							for(BoardDto dto : list1) {
				%>
						<tr>
							<td class="bno"><%= dto.getBno() %></td>
							<td><%= dto.getTitle() %></td>
							<td><%= dto.getWriter() %></td>
							<td><%= dto.getWritedate() %></td>
							<td><%= dto.getHitcount() %></td>
						</tr>
				<%
					}
				%>
			</table>
			
			<button id="btn_write">글쓰기</button>
			
			<div id="pagination">
				<% if(startPNum>1) { %>
					<a href="${pageContext.request.contextPath}/board/list?page=<%= startPNum-1 %>">&lt;&lt;</a>
				<% } %>
				<% for(int i=startPNum; i<=endPNum; i++) { %>
					<% if(i>lastPageNum) break; %>
					<% if(i==pageNum) { %>
						<span><%= i %></span>
					<% } else { %>
						<a href="${pageContext.request.contextPath}/board/list?page=<%= i %>"><%= i %></a>
					<% } %>
				<% } %>
				<% if(endPNum+1 <= lastPageNum) { %>
					<a href="${pageContext.request.contextPath}/board/list?page=<%=endPNum+1%>">&gt;&gt;</a>
				<% } %>
			</div>
		</div>
	</body>
</html>