<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웰컴 페이지</title>
</head>
<body>
	
	<form action="/login-task" method="POST">
		아이디 >> <input type="text" name="id"> 
		비밀번호 >> <input type="password" name="pass">
		<button type="submit">로그인</button>
	</form>
	
	<div>
		아직 계정이 없으신가요? <a href="/join">회원가입</a>
	</div>


</body>
</html>