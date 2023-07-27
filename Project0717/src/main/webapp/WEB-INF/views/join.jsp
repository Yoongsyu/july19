<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-con">
</head>
<body>
	<%@ include file="menu.jsp"%>
	이름
	<div class="name">
		<label for="name"></label> <input type="text" name="name"
			style="width: 200px; height: 20px;">
	</div>

	아이디
	<div class="id">
		<label for="id"></label> <input type="text" name="id"
			style="width: 200x; height: 20px;">
	</div>

	비밀번호
	<div class="pw">
		<label for="pw"></label> <input type="text" name="pw"
			style="width: 200x; height: 20px;">
	</div>

	비밀번호 확인
	<div class="pw">
		<label for="pw"></label> <input type="text" name="pw"
			style="width: 200x; height: 20px;">
	</div>

	주소
	<div class="adr">
		<label for="adr"></label> <input type="text" name="adr"
			style="width: 300x; height: 20px;">
	</div>
	<div class="adr2">
		<label for="adr2"></label> <input type="text" name="adr2"
			style="width: 300x; height: 20px;">
	</div>

	성별
	<div class="fm">
		<label for="fm"></label> <input type="text" name="fm"
			style="width: 300x; height: 20px;">
	</div>

	생년월일
	<div class="date">
		<label for="date"></label> <input type="date" name="date"
			max="2023-07-27" min="1900-01-01" value="2023-07-27">
	</div>

	mbti
	<div class="fm">
		<label for="fm"></label> <input type="text" name="fm"
			style="width: 300x; height: 20px;">
	</div>


</body>
</html>