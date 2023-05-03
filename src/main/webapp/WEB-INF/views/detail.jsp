<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 관광지 상세 정보 페이지</title>
</head>
<body>
	<%-- 전체 영역 --%>
	<div>
		<%-- 관광지명 + 이미지 영역 --%>
		<div>
			<div style="text-align: center;" >
				<h1>${detail.title }</h1>
			</div>
			<div style="text-align: center;" >
				<img src="${detail.firstimage }" />
			</div>
		</div>
		<%-- 상세 정보 영역 --%>
		<div>
			<p>주소 : ${detail.addr1 }</p>
			<p>상세 정보 : ${detail.overview }</p>
		</div>
		<form action="/mapAndReview?contentId=${requestScope.contentid }&cityname=${cityname}" method="post">
			<input type="hidden" name="mapx" value="${detail.mapx }" /> 
				<input type="hidden" name="mapy" value="${detail.mapy }" />
			<button type="submit">지도 및 후기 작성하기</button>
		</form>
		<a href="/summary?area=${cityname }">관광지 리스트</a>
		<c:choose>
			<c:when test="${status eq '0' }">
				<form action="/like?contentid=${requestScope.contentid }" method="post">
					<button type="submit">좋아요</button>
				</form>
			</c:when>
			<c:otherwise>
	      		<p>추천은 한번만 가능합니다</p>
	    	</c:otherwise>
		</c:choose>
	</div>
</body>
</html>