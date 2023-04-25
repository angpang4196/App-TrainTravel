<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웰컴 페이지</title>
</head>
<body>
	<form action="/login-task" method="POST">
		<input type="text" name="id">
		<input type="password" name="id">
		<button type="submit">로그인</button>
	</form>
	<button><a href="/searchTrain">비로그인 </a></button>
</body>
</html>