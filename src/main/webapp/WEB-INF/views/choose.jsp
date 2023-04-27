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
		<form action="/trainInfo">
			출발
			<select>
				<c:forEach items="${ci }" var="one">
				<option>${one.cityname }</option>
				</c:forEach>
			</select>
			<select name="dep">
				<c:forEach items="${si }" var="one">
				<option value="${one.nodeid }">${one.nodename }</option>
				</c:forEach>
			</select>
			도착
			<select>
				<c:forEach items="${ci }" var="one">
				<option>${one.cityname }</option>
				</c:forEach>
			</select>
			<select name="arr">
				<c:forEach items="${si }" var="one">
				<option value="${one.nodeid }">${one.nodename }</option>
				</c:forEach>
			</select>
			<input type="date" name="depPlandTime"/>
			<button type="submit">조회</button>
		</form>
	</div>
</body>
</html>