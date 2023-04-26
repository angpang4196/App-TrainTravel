<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열차 출발 및 도착 뷰페이지</title>
</head>
<body>
	<div>

		<select>
			<c:forEach items="${list }" var="one">
				<option>${one.cityname }</option>

			</c:forEach>
		</select> <select>
			<c:forEach items="${li }" var="i">
				<option>${i.nodename }</option>
			</c:forEach>
		</select>

		<c:forEach items="${list }" var="one">
			<a href="/trainList?city=${one.cityname }">${one.cityname }</a>
		</c:forEach>


	</div>
</body>
</html>