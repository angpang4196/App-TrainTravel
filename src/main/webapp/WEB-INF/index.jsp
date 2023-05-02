<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웰컴 페이지</title>
<link rel="stylesheet" href="/resource/css/style.css" />
</head>
<body>
	<div class="root">
		<h1>여행은 탁 떠나는거야!</h1>
		
		<h3>열차 및 관광지 정보 조회하시려면 로그인을 해 주세요.</h3>
		<form action="/login-task" method="POST" class="sign-form">
			<div style="margin: 0.4em">
				<input type="text" placeholder="아이디를 입력 해 주세요" name="id" class="join-input" required autocomplete="off"/>
			</div>
			<div style="margin: 0.4em">
				<input type="password" placeholder="비밀번호를 입력 해 주세요" name="pass" class="join-input" required/>
			</div>
			<div style="margin: 0.4em">
				<button type="submit" class="join-btn">로그인</button>
			</div>
			<p>
				<c:if test="${param.cause eq 'error' }">
					아이디 또는 비밀번호가 틀렸습니다
				</c:if>
			</p>
			<p style="flex: 0.1; color: white">
			<b>아직 계정이 없으신가요? <a href="/join">회원가입</a></b>
			</p>
		</form>	
	</div>
</body>
</html>