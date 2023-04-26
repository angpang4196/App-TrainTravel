<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>
	<div>
		<form class="form-group" action="/join-task" method="POST">
			아이디 <input class="form-input"type="text" name="id" /> 
			비밀번호 <input class="form-input"type="password" name="pass" />
			<button class="form-submit" type="submit">전송</button>
		</form>
	</div>
</body>
</html>