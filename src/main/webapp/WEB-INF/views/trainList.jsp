<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열차 출발 및 도착 뷰페이지</title>
</head>
<body>
	<form action="/trainInfo" method="get">
		<div>
			<select name="depPlaceId" id="depCity">
				<option>출발지를 선택해주세요</option>
					<c:forEach items="${ci }" var="one">
						<option value="${one.citycode }">${one.cityname }</option>
					</c:forEach>
			</select> <select name="dep" id="depstation">

				<c:forEach items="${si }" var="i">
					<option value="${i.nodename }">${i.nodename }</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<select name="arrPlaceId" id="arrCity">
				<option value="">도착지를 선택해주세요</option>
				<c:forEach items="${ci }" var="one">
					<option value="${one.citycode }">${one.cityname }</option>
				</c:forEach>
			</select> <select name="arr" id="arrstation">
				<c:forEach items="${si }" var="i">
					<option value="${i.nodename }">${i.nodename }</option>
				</c:forEach>
			</select> <input type="date" name="depPlandTime" />

		</div>
		<button type="submit">열차조회</button>

	</form>
	
	<div>
		<c:if test="${param.cause eq error }">
			<p>해당 날짜의 배차된 열차 정보가 없습니다.</p>
		</c:if>
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