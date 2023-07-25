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
<script type = "text/javascript">
//스크립트 영역
let text = "<p>올바른 아이디를 입력하세요</p>"; //전역변수
// 호이스팅이 뭐예요? let vs var? json? const ajax

function checkID(){
	// alert("!");
	let msg = document.getElementById("msg");
	msg.innerHTML = "<p>" + document.getElementById("id").value + "아이디를 변경했습니다.</p>";
}

function check() {
	//alert("!");
	let msg = document.getElementById("msg");
	let id = document.getElementById("id");
	//alert(id);
	//alert(id.value.length);
	
	if(id.value.length < 3) {
		alert("아이디는 3글자 이상이어야 합니다");
		msg.innerHTML = "text;
		id.focus();
		return false;
	}
	
	let pw = document.getElementById("pw");
	if(pw.value.length < 5) {
		alert("비밀번호는 5글자 이상이어야 합니다");
		pw.focus();
		return false;
	}	
}


</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<form action="./login" method="post" onsubmit="return check()">
		<div id="loginlogout">
			<div class="form-floating1">
				<label for="floatingInput"></label> <input id="id" type="text"
					class="form-control" name="id" onchange="checkID()" style="width: 400px; height: 60px;"
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
			<button type="submit" value="submit" onclick="check()" style = "color : white; background-color:#29B6F6; width: 70px; height: 30px">로그인</button>
			<span id="msg"></span>
		</div>
		<div class = "button">
			<button type="button" style = "background-color:#AED581; width: 70px; height: 30px;
			">회원가입</button>
		</div>
		
	</form>
	<img alt="" src="./img/login2.png" style="width: 1000px; height: auto;">



</body>
</html>