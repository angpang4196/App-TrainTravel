<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 관광지 상세 정보 페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

* {
	box-sizing: border-box;
	font-family: 'Jua', sans-serif;
}

a {
    text-decoration: none;
}

.menu {
    display: flex;
    width: 100%;
    margin-bottom: 10px;
    padding: 40px;
    justify-content: space-between;
}

.menu a {
    color: white;
    font-size: 20px;
    margin-right: 20px;
}

.menu button {
    background-color: white;
    color: #42444e;
    border: none;
    padding: 10px;
    font-size: 18px;
    cursor: pointer;
}

/* Added styles below */
.container {
    margin: 0 auto;
    max-width: 1200px;
    padding: 20px;
}

.menu {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px 20px;
    margin-bottom: 20px;
}

.menu a {
    color: #fff;
    font-size: 18px;
    font-weight: bold;
    text-transform: uppercase;
    height: 40px;
}

.menu a.button {
  display: inline-block;
  background-color: #B9E9FC;
  color: #576CBC;
  font-size: 14px;
  padding: 6px 12px;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  border-radius: 6px;
  transition: all 0.3s ease;
  
}

a.button:hover {
  background-color: #B9E9FC;
}

.menu button {
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
}

.menu button:hover {
}

h1, h2, h3, h4, h5, h6 {
    margin: 0;
    font-weight: normal;
}

h1 {
    font-size: 36px;
    margin-bottom: 10px;
}

h2 {
    font-size: 24px;
    margin-bottom: 10px;
}

h3 {
    font-size: 20px;
    margin-bottom: 5px;
}

p {
    font-size: 16px;
    line-height: 1.5;
    margin-bottom: 10px;
}

img {
    max-width: 100%;
    height: auto;
}

</style>
</head>
<body>
	<%-- 전체 영역 --%>
	<div style="margin-left: 200px; margin-right: 200px; border-radius: 10px">
		<div class="menu" style="display: flex; width: 100%; margin-bottom: 10px; padding: 40px;">
			<div>
				<form action="/mapAndReview?contentId=${requestScope.contentid }&cityname=${cityname}" method="post">
					<input type="hidden" name="mapx" value="${detail.mapx }" /> 
						<input type="hidden" name="mapy" value="${detail.mapy }" />
					<button type="submit" style="background-color: #B9E9FC; border-radius: 10px; color: #576CBC;">지도 및 후기 작성하기</button>
				</form>
			</div>
			<div>
				<c:choose>
					<c:when test="${status eq '0' }">
						<form action="/like?contentid=${requestScope.contentid }&area=${cityname }" method="post">
							<button type="submit" style="background-color: #B9E9FC; border-radius: 10px; color: #576CBC">좋아요</button>
						</form>
					</c:when>
					<c:otherwise>
			      		<p style="color: #576CBC; background-color: #B9E9FC; border-radius: 10px; width: 200px; text-align: center">추천은 한번만 가능합니다</p>
			    	</c:otherwise>
				</c:choose>
			</div>
			<div>
				<a href="/summary?area=${cityname }" class="button">관광지 리스트로 돌아가기</a>
			</div>
		</div>
		<%-- 관광지명 + 이미지 영역 --%>
		<div>
			<div>
				<div style="text-align: center;" >
					<h1>${detail.title }</h1>
				</div>
				<div style="text-align: center;" >
					<img src="${empty detail.firstimage ? '/resource/img/noimg.gif' : detail.firstimage }" style="width:40%; height: 30%" />
				</div>
			</div>
			<%-- 상세 정보 영역 --%>
			<div style="padding: 10px">
				<div>
					<h3>주소</h3>
					<hr/>
					<p>${detail.addr1 }</p>
					<hr/>
				</div>
				<div>
					<h3>상세 정보</h3>
					<hr/>
					<p>${detail.overview }</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>