<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Tourist Attractions</title>
</head>
<body>
	<div class="container">
		<h1>관광 명소 리스트</h1>
		<c:forEach items="${tsi}" var="t">
			<div class="attraction">
				<h2>${t.title}</h2>
				<div class="photo">
					<a href="/detail?contentId=${t.contentid}"><img
						src="${t.firstimage}" /></a>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
