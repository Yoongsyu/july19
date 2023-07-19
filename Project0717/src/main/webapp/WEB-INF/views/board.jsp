<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="./css/menu.css">
<link rel = "stylesheet" href="./css/board.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-con">
</head>
<body>
<%@ include file="menu.jsp" %>
<div style="padding:10px 10px 10px 25px;"> 
<h1>Mike Wazowski</h1>

</div>
	<div style="text-align : center;" >	
	<img alt = "" src="./img/image.jpg" >
	<button onclick="location.href='./write'"
	style = "background-color:#AED581;">글쓰기</button>
	</div>	
	<table>
		<tr>
		<th>번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>날짜</th>
		<th>좋아요</th>
		</tr>
		<c:forEach items="${list }" var="row">
		<!--  onclick 자바스크립트 페이지 이동, URL?파라미터=값 -->
		<tr onclick="location.href='./detail?bno=${row.bno }'">
			<td class="td1">${row.bno }</td>
			<td class="title">${row.btitle }</td>
			<td class="td1">${row.bwrite }</td>
			<td class="td2">${row.bdate }</td>
			<td class="td1">${row.blike }</td>
			</tr>
			</c:forEach>
	</table>
	

</body>
</html>