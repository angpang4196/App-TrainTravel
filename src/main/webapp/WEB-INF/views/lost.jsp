<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유실물 찾기(지역별 전화번호)</title>
<style>
body {
	background-color: #f7f7f7;
}
.return {
	text-align: right;
	margin: 10px;
	justify-content: center;
	align-items: center;
}
.return a {
	text-decoration: none;
	color: #333;
	font-size: 16px;
	margin: 10px;
	padding: 5px 10px;
	border: 1px solid #333;
	border-radius: 5px;
	background-color: #fff;
}
.return a:hover {
	background-color: #333;
	color: #fff;
}
.title {
    display: flex;
    align-items: center;
    font-size: 30px;
    color: #333;
    text-align: center;
    justify-content: center;
    text-align: center;
}

.spell {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #eee;
	padding: 10px;
}

.spell a {
	text-decoration: none;
	color: black;
	font-size: 20px;
	margin: 10px;
	padding: 5px 10px;
	border: 1px solid black;
	border-radius: 5px;
}

.spell a:hover {
	background-color: black;
	color: white;
}

.img {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 20px;
}
.return img:hover {
	cursor: pointer;
}

.img img {
	max-width: 1000px;
	max-height: 1000px;
}
</style>
</head>
<body>
	<div>
		<div class="return">
			<img src="/resource/img/뒤로가기1.jpg" style="height:70px; width: 70px;" onclick="history.back()"/>
		</div>
		<div class="title">
			<h3>유실물 찾기</h3>
		</div>
		<div class="spell">
			<c:forEach items="${lostItem}" var="one">
				<a href="/lost?spell=${one.spell }">${one.spell}</a>
			</c:forEach>
		</div>
		<div class="img">
			<img src="${item.img }" />
		</div>
	</div>
</body>
</html>
