<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웰컴 페이지</title>
</head>
<body>
	<c:choose>
		<c:when test="${!sessionScope.logon }">
			<form action="/login-task" method="POST">
				<input type="text" name="id">
				<input type="password" name="id">
				<button type="submit">로그인</button>
			</form>
		</c:when>
		<c:otherwise>
			<button><a href="/searchTrain">비로그인 </a></button>	
		</c:otherwise>
		
	</c:choose>
</body>
</html>