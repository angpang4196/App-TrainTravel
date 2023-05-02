<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 관광지 상세 정보 페이지</title>
</head>
<body>

	${detail.title }
	
    <img src="${detail.firstimage }"/>
    
    <form action="/mapAndReview?contentid=${requestScope.contentid }" method="POST">
    	<input type="hidden" name="mapx" value="${detail.mapx }"/>
    	<input type="hidden" name="mapy" value="${detail.mapy }"/>
    	<button type="submit">지도 및 후기 작성하기</button>
    </form>

</body>
</html>