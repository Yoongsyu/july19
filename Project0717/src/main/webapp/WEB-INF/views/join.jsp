<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/join.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-con">
</head>
<body>
	<%@ include file="menu.jsp"%>
	
	<div style="text-align: right;">
		<img alt="" src="./img/with.png" class="absolute";>
	</div>
	
	<div style="padding: 10px 10px 10px 25px;">
	<form action = "./join" method="post">
		<h1>회원가입</h1>
	</div>
	<br>
	<br>


	<div class="all">
		<div class="name">
			<label for="name">이름</label>
			<br>
			<input type="text" name="name"
				style="width: 200px; height: 30px">
		</div>

<br>
		<div class="fm">
			<label for="fm">성별</label>
			<br>
			<input type="radio" name="gender" value="0" id="m">
			<label for = "m">남</label>
<input type="radio" name="gender"value="1" id="f">
<label for = "f">여</label>
		</div>

<br>
		<div class="birth">
			<label for="birth">생년월일</label>
			<br>
			<input type="date" name="birth" value="birth"
				max="2023-07-27" min="1900-01-01" value="2023-07-27"
				style="width: 200px; height: 30px">
		</div>


		<br>
		<div class="addr">
			<label for="addr">주소</label>
			<p>
				<input type="text" id="zip-code" style="height: 30px"
					placeholder="우편번호"> <input type="button"
					onclick="execDaumPostcode()" style="height: 30px" value="우편번호 찾기">
			<p></p>
			<input type="text" id="address-1" placeholder="도로명주소"
				style="width: 500px; height: 30px">
			<p></p>
			<input type="text" name = addr id="address-2" placeholder="상세주소"
				style="width: 500px; height: 30px">
			</p>
		</div>

		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								document.getElementById('zip-code').value = data.zonecode;
								document.getElementById('address-1').value = data.address;
							}
						}).open();
			}
		</script>

		

		

		<br>
		<div class="fm">
			<label for="mbti">MBTI</label>
<br>
<select name="mbti" id="mbti"
				style="width: 200px; height: 30px">
				<option value="ISFP">ISFP</option>
				<option value="ISFJ">ISFJ</option>
				<option value="ISTJ">ISTJ</option>
				<option value="INFJ">INFJ</option>
				<option value="INTJ">INTJ</option>
				<option value="ISTP">ISTP</option>
				<option value="INFP">INFP</option>
				<option value="INTP">INTP</option>
				<option value="ESTP">ESTP</option>
				<option value="ESFP">ESFP</option>
				<option value="ENFP">ENFP</option>
				<option value="ENTP">ENTP</option>
				<option value="ESTJ">ESTJ</option>
				<option value="ESFJ">ESFJ</option>
				<option value="ENFJ">ENFJ</option>
				<option value="ENTJ">ENTJ</option>
			</select>
		</div>

		<br>
		<div class="id">
			<label for="id">아이디</label>
<br>
<input type="text" name="id"
				style="width: 200px; height: 30px">
			<h5>아이디는 최소 3글자 이상으로 설정해 주세요</h5>
		</div>


		<br>
		<div class="pw">
			<label for="pw1">비밀번호</label>
<br>
<input type="text" name="pw1"
				style="width: 200px; height: 30px">
			<h5>비밀번호는 최소 4글자 이상으로 설정해 주세요</h5>
		</div>


		<br>
		<div class="pw-check">
			<label for="pw-check">비밀번호 확인</label>
<br>
<input type="text" name="pw2"
				style="width: 200px; height: 30px">
		</div>

		<br>
		<br>
		<div class="complete">
			<button type="submit" value="complete">☆작성 완료☆</button>
		</div>
		<br>
		<br>
		</form>
	</div>


</body>
</html>