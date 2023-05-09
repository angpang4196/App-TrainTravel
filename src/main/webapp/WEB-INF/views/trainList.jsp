<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열차 출발 및 도착 뷰페이지</title>
<style>
* {
	box-sizing: border-box;
}

form {
	max-width: 600px;
	margin: 0 auto; /* 중앙 정렬 */
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

input, select {
	padding: 4px;
}

button[type="submit"] {
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #3e8e41;
}

.page-heading {
	margin-top: 50px;
	margin-bottom: 20px;
	text-align: center;
	font-size: 24px;
	font-weight: bold;
}
</style>
<link rel="stylesheet" href="/resource/css/style.css" />
</head>
<body>
	<div style="display: flex; justify-content: center; align-items: center; height: 100vh">
		<form action="/trainInfo" method="get" style="width: 50vw; height: 280px; display: flex; flex-direction: column; justify-content: space-between;">
			<h2>출발지와 도착지, 날짜를 선택 해 주세요.</h2>
			<div style="display: flex; justify-content: space-around; padding: 4px; gap: 4px">
				<select name="depPlaceId" id="depCity" style="flex: 1">
					<option>출발지를 선택해주세요</option>
					<c:forEach items="${ci }" var="one">
						<option value="${one.citycode }">${one.cityname }</option>
					</c:forEach>
				</select> 
				<select name="dep" id="depstation" style="flex: 1">
					<c:forEach items="${si }" var="i">
						<option value="${i.nodename }">${i.nodename }역</option>
					</c:forEach>
				</select>
			</div>
			<div style="display: flex; justify-content: space-around; padding: 4px; gap: 4px">
				<select name="arrPlaceId" id="arrCity" style="flex: 1">
					<option value="">도착지를 선택해주세요</option>
					<c:forEach items="${ci }" var="one">
						<option value="${one.citycode }&${one.cityname}">${one.cityname }</option>
					</c:forEach>
				</select> 
				<select name="arr" id="arrstation" style="flex: 1">
					<c:forEach items="${si }" var="i">
						<option value="${i.nodename }">${i.nodename }역</option>
					</c:forEach>
				</select>
			</div>
			<div style="display: flex; justify-content: space-around; padding: 4px; gap: 4px;">
				<input type="date" name="depPlandTime" style="flex: 1"  id="change"/>
				<button type="submit" style="flex: 1">열차조회</button>
			</div>
			<p>
				<c:if test="${cause eq 'notData' }">
					해당 날짜에 배차된 열차 정보가 없습니다.
				</c:if>
				<c:if test="${param.error eq 1 }">
				    모든 항목을 기입해주세요
				</c:if>
			</p>
		</form>
	</div>
	<script>
		document.querySelector("#depCity").onchange = function(evt) {
			if (this.value === "")
				return;

			const xhr = new XMLHttpRequest();
			xhr.open("GET", "/api/search/station?citycode=" + this.value, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (this.readyState === 4) {
					const txt = this.responseText;
					console.log(typeof txt, txt);
					const obj = JSON.parse(txt);
					console.log(obj.map);
					const cvt = obj.map(function(e) {
						return '<option value="'+ e.nodeid+'">' + e.nodename
								+ '</option>';
					});
					document.querySelector("#depstation").innerHTML = cvt
							.join("");
				}
			}
		}

		document.querySelector("#arrCity").onchange = function(evt) {
			if (this.value === "")
				return;

			const xhr = new XMLHttpRequest();
			xhr.open("GET", "/api/search/station?citycode=" + this.value, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (this.readyState === 4) {
					const txt = this.responseText;
					console.log(typeof txt, txt);
					const obj = JSON.parse(txt);
					console.log(obj.map);
					const cvt = obj.map(function(e) {
						return '<option value="'+ e.nodeid+'">' + e.nodename
								+ '</option>';
					});
					document.querySelector("#arrstation").innerHTML = cvt
							.join("");
				}
			}
		}
	</script>
</body>
</html>