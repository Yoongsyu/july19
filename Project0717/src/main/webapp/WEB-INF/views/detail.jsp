<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/detail.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-con">
<script type="text/javascript">
	function del(){
		let chk = confirm("삭제할끼가?"); // 참 거짓으로 나옵니다
		//alert(chk);
		if(chk) {
			location.href="./delete?bno=${dto.bno }";
			//http://172.30.1.19/delete?bno=150
		}
	}
</script>
</head>
<body>
<%@ include file = "menu.jsp" %>
<div style="padding:10px 10px 10px 25px;"> 
		<h1>디테일이디</h1>
		</div>
		<!--  20230718 / 데이터베이스 구현 / 메뉴만들기, 글쓰기 -->
		<div class="detail-content">
			<div class="title">${dto.bno }/ ${dto.btitle }</div>
			<div class="name-bar">
			<div class="name">${dto.bwrite }님</div>
			<div class="like">${dto.blike }</div>
			<div class="date">${dto.bdate }</div>
			<div class="ip">${dto.bip }</div>
		</div>
		<div class="content">${dto.bcontent }</div>
	</div>
	<div style="text-align : center;" >	
	<img alt="" src="./img/edit.png">&nbsp;
	<img alt="" src="./img/delete.png" onclick="del()">
	</div>
</body>
</html>