<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="./css/menu.css">
<link rel = "stylesheet" href="./css/notice.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-con">

 <!-- Bootstrap -->
    <th:block th:replace="board2/fragments/config :: configFragment"> </th:block>

    <!-- Style CSS -->
    <link rel="stylesheet" th:href="@{/css/notice.css}"/>
    

</head>
<body>
<%@ include file="menu.jsp"%>


<div style="padding:10px 10px 10px 25px;">
<h1>Sullivan</h1>
</div>
<div class="text">
James P. Sullivan
</div>
		<div style="text-align : left";>	
	<img alt = "" src="./img/sullivan.png" >
	</div>
	

	
	<!--  <a href="./board">보드로 가기</a>  -->
</body>
</html>