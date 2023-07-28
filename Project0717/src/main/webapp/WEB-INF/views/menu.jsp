<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav>
	<ul>
		<li onclick="link('')">메인</li>
		<li onclick="link('board')">Mike</li>
		<li onclick="link('notice')">Sullivan</li>
		<li onclick="link('mike')">Boo</li>
		<li onclick="link('monsters')">Monsters, inc.</li>
		<li onclick="link('mooni')">문의사항</li>
		<li onclick="link('members')">멤버☆</li>

		<c:choose>
			<c:when test="${sessionScope.mname eq null }">
				<li class = "lir" onclick="link('login')">login</li>
			</c:when>
			<c:otherwise>
				<li class = "lir" onclick="link('myInfo')">${sessionScope.mname }(${sessionScope.mid })님
					반갑습니당</li>
				<li class = "lir" onclick="link('logout')">logout</li>
			</c:otherwise>
		</c:choose>


	</ul>
</nav>





<div style="height: 50px; width: 100%;"></div>
<script>
	function link(url) {
		location.href = "./" + url;
	}
</script>