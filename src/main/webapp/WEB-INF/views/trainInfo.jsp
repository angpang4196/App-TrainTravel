<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기차 요금 및 시간 정보제공 페이지</title>
<link rel="stylesheet" href="/resource/css/trainTable.css" />
</head>
<body>
	<div>
		<div style="display: flex; flex-direction: row; background-color: #42444e; margin-bottom: 10px; padding: 40px;">
			<div>
				<a href="/trainList" class="menu">열차 재선택</a>
			</div>
			<div>
				<a href="/summary?area=${arrName}" class="menu">${arrName } 관광정보 보기</a>
			</div>
			<div>
				<a href="https://www.letskorail.com/" class="menu">예매하기</a>
			</div>
			<div>
				<a href="/lost" class="menu">유실물 찾기</a>
			</div>
		</div>
		<div>
			<table>
				<thead>
				<tr>
					<th>출발지</th>
					<th>출발시간</th>
					<th>도착지</th>
					<th>도착시간</th>
					<th>요금(어른 1인 기준)</th>
					<th>열차종류</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${ti }" var="one">
					<tr>
						<td>${one.depplacename }역</td>
						<td><fmt:parseDate value="${one.depplandtime}" var="registered" pattern="yyyyMMddHHmmss" /><fmt:formatDate value="${registered}" pattern="HH시 mm분" /></td>
						<td>${one.arrplacename }역</td>
						<td><fmt:parseDate value="${one.arrplandtime}" var="registered" pattern="yyyyMMddHHmmss" /><fmt:formatDate value="${registered}" pattern="HH시 mm분" /></td>
						<td>${one.adultcharge }원</td>
						<td>${one.traingradename }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>