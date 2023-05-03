
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웰컴 페이지</title>
<link rel="stylesheet" href="/resource/css/login.css" />
</head>
<body>
	<div class="container right-panel-active">
		<div class="container__form container--signin">
			<form action="/login-task" method="post" class="form" id="form2">
				<h2 class="form__title">Sign In</h2>
				<input type="text" placeholder="UserId" class="input" name="id" />
				<input type="password" placeholder="Password" class="input"
					name="pass" /> <a href="/join" class="link">Sign up</a>
				<button class="btn">Sign In</button>
				<p style="color: red;">
			    	<c:if test="${param.cause eq 'error' }">
			        아이디 또는 비밀번호가 틀렸습니다
			 		</c:if>
			 	</p>
			</form>
		</div>
		<div class="container__overlay">
			<div class="overlay">
				<div class="overlay__panel overlay--left">
					<button class="btn" id="signIn">Login is required</button>
				</div>
				<div class="overlay__panel overlay--right">
					<button class="btn" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>