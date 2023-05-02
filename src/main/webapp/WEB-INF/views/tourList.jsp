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
	<div style="display: flex">
		<h1>관광 명소 리스트</h1>
		<c:forEach items="${tsi}" var="t">
			<div>
				<h3>
					<a href="/detail?contentId=${t.contentid}">${t.title}</a>
				</h3>
				<div>
					<img src="${t.firstimage}" />
				</div>
				<div>
					<p>주소 : ${t.addr1 }</p>
				</div>
			</div>
		</c:forEach>
		
		
	</div>
</body>
</html>
