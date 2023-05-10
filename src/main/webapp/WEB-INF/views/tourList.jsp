<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List of Tourist Attractions</title>
<style>
@font-face {
    font-family: 'neon';
    src: url('/resource/font/Katuri.ttf') format('truetype');
}

* {
	box-sizing: border-box;
	font-family: 'neon';
}

a {
	text-decoration: none;
}

.cate {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 16px 0;
	border-bottom: 2px solid white;
}

.cate a {
	font-size: 16px;
	font-weight: bold;
	margin-right: 16px;
}

.cate a:hover {
	color: #666;
}

.search {
	display: flex;
	justify-content: center;
	margin-top: 16px;
	margin-bottom: 16px;
}

.search form {
	display: flex;
	align-items: center;
}

.search input[type="text"] {
	padding: 8px;
	width: 220px;
	border-radius: 4px;
	border: 1px solid #ccc;
	font-size: 16px;
	margin-right: 8px;
}

.search button[type="submit"] {
	padding: 8px 16px;
	border-radius: 4px;
	border: none;
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
}

.search button[type="submit"]:hover {
	background-color: #0062cc;
}
.page {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
.page a {
	display: inline-block;
	padding: 5px 10px;
	margin: 0 5px;
	background-color: #f2f2f2;
	color: #333;
	border: 1px solid #ccc;
	border-radius: 3px;
	text-decoration: none;
}
.page a:hover {
	background-color: #ddd;
}
body{
	width: 100vw;
	height: 100vh; 
	position: relative;
	background-size: cover;
	background-attachment: fixed;
}
body::before{
	content: "";
	opacity: 0.4;
	position: fixed;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
}
body div{
	color: black;
	text-align: center;
	position: relative;
}
</style>
</head>
<body style="background-color: #B9E9FC">
	<div style="width: 960px; margin: auto;">
		<div class="cate">
			<c:forEach items="${cateAll }" var="one">
				<a href="/summary?cate=${one.type }&area=${area}" style="color: #576CBC; font-size: 15px"><b>${one.type }</b></a>
			</c:forEach>
			<a href="/trainList" style="color: #576CBC; font-size: 15px"><b>열차 선택</b></a>
		</div>
		<div class="search">
			<form action="/searchDetail?cityname=${cityname }" method="POST">
				<input type="text" style="padding:4px; width: 220px;" id="search" list="qlist" autocomplete="off" name="contentName" placeholder="두 글자 이상 입력 필요"/><span id="rst"></span>
				<datalist id="qlist">
				</datalist>
				<button type="submit">Search</button>
			</form>
		</div>
		<div>
			<div>
				<h1 style="text-align: center;color: #576CBC">${area } ${requestScope.cate } 리스트</h1>
			</div>
			<div style="display: flex; flex-direction: row-reverse;">
				<div style="margin-right: 20px; margin-bottom: 10px; width: 170px; border-radius: 10px">
					<a href="/summary?flag=asc&area=${area }&cate=${cate}" style="color: #576CBC; margin: 4px"><b>가나다</b></a>
					<a href="/summary?flag=views&area=${area }&cate=${cate}" style="color: #576CBC; margin: 4px"><b>조회순</b></a>
					<a href="/summary?flag=likes&area=${area }&cate=${cate}" style="color: #576CBC; margin: 4px"><b>추천순</b></a>
				</div>
			</div>
		</div>
		<div style="display: flex; width: 100%; flex-wrap: wrap; background-color: #DAF5FF; border-radius: 10px; padding-left: 9px; padding-top: 9px; padding-bottom: 9px;">
			<c:forEach items="${tsi}" var="t">
				<div style="width: 33%; display: flex; flex-direction: column; padding: 4px; border: 1px solid #B9E9FC;">
					<h2>
						<a href="/detail?contentId=${t.contentid}&cityname=${cityname }" style="text-decoration: none; color: #576CBC">${t.title}</a>
					</h2>
					<div style="height: 200px;">
						<img style="width: 100%; height: 100%; object-fit: cover" src="${empty t.firstimage ? '/resource/img/noimg.gif' : t.firstimage }" />
					</div>
					<div>
						<small style="font-size: 12px; color: #576CBC;">조회수 (${t.views })건 / 추천수(${t.likes })건</small>					
					</div>
					<div>
						<p style="text-overflow: ellipsis; color: #576CBC;"><b>주소</b></p><hr/><small style="color: #576CBC">${t.addr1 }</small>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="text-align: center;" class='page'>
			<c:url value="/summary?area=${area }&" var="target">
			</c:url>
			<c:if test="${existPrev }">
				<a href="${target }page=${start-1 }&cate=${param.cate}">이전 페이지</a>
			</c:if>
			<c:forEach var="p" begin="${start }" end="${last }">
				<c:choose>
					<c:when test="${p eq param.page }">
						<a style="background-color: blue;color: white;">${p }</a>
					</c:when>
					<c:otherwise>
						<a href="${target }page=${p }&cate=${param.cate}">${p }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${existNext }">
				<a href="${target }page=${last+1 }&cate=${param.cate}">다음 페이지</a>
			</c:if>
		</div>
	</div>
	
	<script>
		document.querySelector("#search").onkeyup = function(evt) {
			const xhr = new XMLHttpRequest();
			xhr.open("get","/api/search?cityname=${area}&q=" + evt.target.value, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if(this.readyState === 4) {
					const txt = this.responseText;
					console.log(txt);
					const obj = JSON.parse(txt);
					const cvt = obj.map(function(e) { 
						return "<option>" + e + "</option>";
					});
					document.querySelector("#qlist").innerHTML = cvt.join("");
				}
			}
		}
	</script>
</body>
</html>