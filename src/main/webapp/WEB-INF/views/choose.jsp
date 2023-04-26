<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열차 출발 도착 선택 페이지</title>
</head>
<body>
	열차 출발 도착
	<div>
		<select>
			<c:forEach items="${ci }" var="one">
			<option>${one.cityname }</option>
			</c:forEach>
		</select>
		<select>
			<c:forEach items="${si }" var="one">
			<option>${one.nodename }</option>
			</c:forEach>
		</select>
	</div>
</body>
</html>