<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당 관광지 상세 정보 페이지</title>
<style>
* {
    box-sizing: border-box;
}

a {
    text-decoration: none;
}

.menu {
    display: flex;
    width: 100%;
    background-color: #42444e;
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
body {
    background-color: #f0f0f0;
    font-family: Arial, sans-serif;
    color: #333;
}

.container {
    margin: 0 auto;
    max-width: 1200px;
    padding: 20px;
}

.menu {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background-color: #42444e;
    padding: 10px 20px;
    margin-bottom: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.menu a {
    color: #fff;
    font-size: 18px;
    font-weight: bold;
    text-transform: uppercase;
}

.menu a.button {
  display: inline-block;
  border: 1px solid #ccc;
  background-color: #fff;
  color: #333;
  font-size: 14px;
  padding: 6px 12px;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  border-radius: 4px;
  transition: all 0.3s ease;
}

a.button:hover {
  background-color: #333;
  color: #fff;
  border-color: #333;
}

.menu button {
    background-color: #fff;
    color: #42444e;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.2s ease-in-out;
}

.menu button:hover {
    background-color: #f0f0f0;
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
	<div style="margin-left: 200px; margin-right: 200px;">
		<div class="menu" style="display: flex; width: 100%; background-color: #42444e; margin-bottom: 10px; padding: 40px;">
			<div>
				<form action="/mapAndReview?contentId=${requestScope.contentid }&cityname=${cityname}" method="post">
					<input type="hidden" name="mapx" value="${detail.mapx }" /> 
						<input type="hidden" name="mapy" value="${detail.mapy }" />
					<button type="submit">지도 및 후기 작성하기</button>
				</form>
			</div>
			<div>
				<c:choose>
					<c:when test="${status eq '0' }">
						<form action="/like?contentid=${requestScope.contentid }&area=${cityname }" method="post">
							<button type="submit">좋아요</button>
						</form>
					</c:when>
					<c:otherwise>
			      		<p style="color: white">추천은 한번만 가능합니다</p>
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
			<div>
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
					<hr/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>