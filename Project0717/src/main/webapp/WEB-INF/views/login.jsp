<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/login.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-con">

</head>
<body>
	<%@ include file="menu.jsp"%>
	<form action="./login" method="post">
		<div id="loginlogout">
			<div class="form-floating1">
				<label for="floatingInput"></label> <input id="id" type="text"
					class="form-control" name="id" style="width: 400px; height: 60px;"
					class="absolute">
			</div>

			<div class="form-floating2">
				<label for="floatingPassword"></label> <input id="pw"
					type="password" class="form-control" name="pw" autocomplete="off"
					style="width: 400px; height: 60px;" class="absolute">
			</div>
		</div>
		
			<div class="checkbox3">
		<input id="rememberId" type="checkbox"/><label for="rememberId">
			아이디 저장</label>
	</div>
		<div class = "submit">
			<button type="submit" value="submit" style = "color : white; background-color:#29B6F6; width: 70px; height: 30px">로그인</button>
		</div>
		<div class = "button">
			<button type="button" style = "background-color:#AED581; width: 70px; height: 30px;
			">회원가입</button>
		</div>
		
	</form>
	<img alt="" src="./img/login2.png" style="width: 1000px; height: auto;">



</body>
</html>