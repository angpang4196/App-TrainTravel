<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="text-align: center;">유실물 찾기</h1>
	<c:forEach items="${lostItem}" var="one">
	<a href="/lost?spell=${one.spell }">${one.spell}</a>
	</c:forEach>
	<img src="${item.img }"/>
</body>
</html>