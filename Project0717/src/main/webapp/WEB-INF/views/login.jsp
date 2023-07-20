<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/menu.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon.ico" type="image/x-con">

 <!-- Bootstrap -->
    <th:block th:replace="board2/fragments/config :: configFragment"> </th:block>

    <!-- Style CSS -->
    <link rel="stylesheet" th:href="@{/css/login.css}"/>
    
</head>
<body>
<%@ include file = "menu.jsp" %>
<class="text-center d-flex">
    <main class="form-signin w-100 m-auto">
        <form method="post">
            <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

            <div class="form-floating">
                <input id="floatingInput" type="text" class="form-control" name="userId">
                <label for="floatingInput">ID</label>
            </div>
            <div class="form-floating">
                <input id="floatingPassword" type="password" class="form-control" name="password" autocomplete="off">
                <label for="floatingPassword">Password</label>
            </div>

            <div class="checkbox mb-3">
                <input id="rememberId" type="checkbox"/>
                <label for="rememberId">아이디 저장</label>
            </div>
            <button type="submit" class="w-100 btn btn-lg btn-primary">로그인</button>
        </form>
        <div>
               <a th:href="@{/signup}">
                   <button type="button" class="w-100 mt-1 btn btn-lg btn-secondary">회원가입</button>
               </a>
        </div>
    </main>

</body>
</html>