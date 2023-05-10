<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
<link rel="stylesheet" href="/resource/css/join.css" />
</head>
<body>
	<div class="container right-panel-active">
		<!-- Sign In -->
		<div class="container__form container--signin">
			<form action="/join-task" class="form" id="form2">
				<h2 class="form__title">Sign Up</h2>
				<input type="text" placeholder="UserId" class="input" name="id" required /> <input
					type="password" placeholder="Password" class="input" name="pass" required />
				<button class="btn" type="submit">Sign Up</button>
			</form>
		</div>
		<!-- Overlay -->
		<div class="container__overlay">
			<div class="overlay">
				<div class="overlay__panel overlay--left">
					<button class="btn" id="signIn">SignUp is required</button>
				</div>
				<div class="overlay__panel overlay--right">
					<c:if test="${param.cause eq existId }">
						<div>
						존재하는 아이디 입니다
						</div>
					</c:if>
					<button class="btn" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>