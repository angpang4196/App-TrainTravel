<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기차 요금 및 시간 정보제공 페이지</title>
</head>
<body>
	<div>
		출발역() >> <a href="/searchTour?area=${li.nodename }">도착역</a>
	</div>
	<div>
		<table>
			<tr>
				<th>출발지</th>
				<th>출발시간</th>
				<th>도착지</th>
				<th>도착시간</th>
				<th>요금</th>
				<th>열차종류</th>
			</tr>
			<c:forEach items="${ti }" var="one">
				<tr>
					<td>${one.depplacename }</td>
					<td>${one.depplandtime }</td>
					<td>${one.arrplacename }</td>
					<td>${one.arrplandtime }</td>
					<td>${one.adultcharge }</td>
					<td>${one.traingradename }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>