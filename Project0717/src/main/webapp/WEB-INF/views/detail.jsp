<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
function edit(){
	if(confirm("고칠끼가?")) {
		location.href="./edit?bno=${dto.bno }";
		//http://172.30.1.19/edit?bno=150
	}
}
	
	function del(){
		let chk = confirm("삭제할끼가?"); // 참 거짓으로 나옵니다
		//alert(chk);
		if(chk) {
			location.href="./delete?bno=${dto.bno }";
			//http://172.30.1.19/delete?bno=150
		}
	}
	
	function showCommentSection() {
	    var currentURL = window.location.href;
	    if (currentURL === "http://172.30.1.90/detail?bno=7") {
	        document.getElementById("comment-section").style.display = "block";
	    } else {
	        document.getElementById("comment-section").style.display = "none";
	    }
	}
	
	function showCommentSection2() {
	    var currentURL = window.location.href;
	    if (currentURL === "http://172.30.1.90/detail?bno=10") {
	        document.getElementById("comment-section2").style.display = "block";
	    } else {
	        document.getElementById("comment-section2").style.display = "none";
	    }
	}
	
	function showCommentSection3() {
	    var currentURL = window.location.href;
	    if (currentURL === "http://172.30.1.90/detail?bno=11") {
	        document.getElementById("comment-section3").style.display = "block";
	    } else {
	        document.getElementById("comment-section3").style.display = "none";
	    }
	}
	
	function showCommentSection4() {
	    var currentURL = window.location.href;
	    if (currentURL === "http://172.30.1.90/detail?bno=12") {
	        document.getElementById("comment-section4").style.display = "block";
	    } else {
	        document.getElementById("comment-section4").style.display = "none";
	    }
	}
	
	function showCommentSection5() {
	    var currentURL = window.location.href;
	    if (currentURL === "http://172.30.1.90/detail?bno=13") {
	        document.getElementById("comment-section5").style.display = "block";
	    } else {
	        document.getElementById("comment-section5").style.display = "none";
	    }
	}
	
	function showCommentSection6() {
	    var currentURL = window.location.href;
	    if (currentURL === "http://172.30.1.90/detail?bno=16") {
	        document.getElementById("comment-section6").style.display = "block";
	    } else {
	        document.getElementById("comment-section6").style.display = "none";
	    }
	}
	

	// 댓글 섹션 표시 여부 확인
	document.addEventListener("DOMContentLoaded", function() {
	    showCommentSection();
	});
	// 댓글 섹션 표시 여부 확인
	document.addEventListener("DOMContentLoaded", function() {
	    showCommentSection2();
	});
	// 댓글 섹션 표시 여부 확인
	document.addEventListener("DOMContentLoaded", function() {
	    showCommentSection3();
	});
	// 댓글 섹션 표시 여부 확인
	document.addEventListener("DOMContentLoaded", function() {
	    showCommentSection4();
	});	
	// 댓글 섹션 표시 여부 확인
	document.addEventListener("DOMContentLoaded", function() {
	    showCommentSection5();
	});	
	// 댓글 섹션 표시 여부 확인
	document.addEventListener("DOMContentLoaded", function() {
	    showCommentSection6();
	});	
	
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
			<div class="name">${dto.m_name }님</div>
			<div class="like">${dto.blike }</div>
			<div class="date">${dto.bdate }</div>
			<div class="ip">${dto.bip }</div>
		</div>
		<div class="content">${dto.bcontent }</div>
	</div>
	
	<div style="text-align : center;" >
	<c:if test="${sessionScope.mid eq dto.m_id}">
	<img alt="" src="./img/edit.png" onclick="edit()">&nbsp;
	<img alt="" src="./img/delete.png" onclick="del()">
	</c:if>
	</div>
	
	<div style="text-align : center;" >	
	  <section class = 'input-comment'>
        <div style="font-size: 20px; font-weight : bold;">댓글 1</div>
        <br>
        <div> 
            <input type="text" style="height : 20px; width: 700px;"  id="" placeholder="댓글을 입력해주세요" >
            <button>등록</button>
        </div>
    </section>

      		
       <section id="comment-section" style="display: none;">
            <ul style="display: inline;">
                <li>
                    <div class="name2" style="font-weight : bold;" >융슈타인</div> 
                    <div class="content2">무너 부심이 있으시군요</div>
                    <span><div class="date2">${dto.bdate }</div></span>
                    <div class="ip2"></div>
                    <button class="good">좋아요</button>
                    <button class="bad">싫어요</button>
                </li>
            </ul>
        </section>
        
        
       <section id="comment-section2" style="display: none;">
            <ul style="display: inline;">
                <li>
                    <div class="name2" style="font-weight : bold;" >융슈타인</div> 
                    <div class="content2">감사합니당 열심히 할게요ㅠ</div>
                    <span><div class="date2">${dto.bdate }</div></span>
                    <div class="ip2"></div>
                    <button class="good">좋아요</button>
                    <button class="bad">싫어요</button>
                </li>
            </ul>
        </section>
        
       <section id="comment-section3" style="display: none;">
            <ul style="display: inline;">
                <li>
                    <div class="name2" style="font-weight : bold;" >융슈타인</div> 
                    <div class="content2">☆귀염뽀짝 박반장님 어서오세요☆</div>
                    <span><div class="date2">${dto.bdate }</div></span>
                    <div class="ip2"></div>
                    <button class="good">좋아요</button>
                    <button class="bad">싫어요</button>
                </li>
            </ul>
        </section>
        
       <section id="comment-section4" style="display: none;">
            <ul style="display: inline;">
                <li>
                    <div class="name2" style="font-weight : bold;" >융슈타인</div> 
                    <div class="content2">지은짱의 남자 김.도.영..☆</div>
                    <span><div class="date2">${dto.bdate }</div></span>
                    <div class="ip2"></div>
                    <button class="good">좋아요</button>
                    <button class="bad">싫어요</button>
                </li>
            </ul>
        </section>
        
       <section id="comment-section5" style="display: none;">
            <ul style="display: inline;">
                <li>
                    <div class="name2" style="font-weight : bold;" >융슈타인</div> 
                    <div class="content2">안돼 대규야 비겁하게 오니가 되면 안돼,,!!</div>
                    <span><div class="date2">${dto.bdate }</div></span>
                    <div class="ip2"></div>
                    <button class="good">좋아요</button>
                    <button class="bad">싫어요</button>
                </li>
            </ul>
        </section>
        
       <section id="comment-section6" style="display: none;">
            <ul style="display: inline;">
                <li>
                    <div class="name2" style="font-weight : bold;" >융슈타인</div> 
                    <div class="content2">감사해용</div>
                    <span><div class="date2">${dto.bdate }</div></span>
                    <div class="ip2"></div>
                    <button class="good">좋아요</button>
                    <button class="bad">싫어요</button>
                </li>
            </ul>
        </section>
 



</body>
</html>