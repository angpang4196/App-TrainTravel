<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Tourist Attractions</title>
<style>
* {
	box-sizing: border-box;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div style="width: 960px; margin: auto;">
		<c:forEach items="${cateAll }" var="one">
			<a href="/summary?cate=${one.type }&area=${area}">${one.type }</a>
		</c:forEach>
		<h1 style="text-align: center;">${requestScope.cate } 리스트</h1>
		<div style="display: flex; width: 100%; flex-wrap: wrap;">
			<c:forEach items="${tsi}" var="t">
				<div
					style="width: 33.33%; display: flex; flex-direction: column; padding: 4px;">
					<h2>
						<a href="/detail?contentId=${t.contentid}&cityname=${cityname }">${t.title}</a>
					</h2>
					<div style="height: 200px;">
						<img style="width: 100%; height: 100%; object-fit: cover"
							src="${empty t.firstimage ? '/resource/img/noimg.gif' : t.firstimage }" />
					</div>
					<div>
						<p style="text-overflow: ellipsis;">주소 : ${t.addr1 }</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="text-align: center;">
			<c:url value="/summary?area=${area }&" var="target">
			</c:url>
			<c:if test="${existPrev }">
				<a href="${target }page=${start-1 }">←</a>
			</c:if>
			<c:forEach var="p" begin="${start }" end="${last }">
				<c:choose>
					<c:when test="${p eq param.page }">
						<span style="color: green; font-size: 18px">${p }</span>
					</c:when>
					<c:otherwise>
						<a href="${target }page=${p }">${p }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${existNext }">
				<a href="${target }page=${last+1 }">→</a>
			</c:if>
		</div>
	</div>
</body>
</html>
