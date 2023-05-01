<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도 제공 및 후기 작성 페이지</title>
</head>
<body>
	<%-- 주소 및 지도 영역 --%>
	<div>
		<p>관광지 ID : ${contentid }
		<p>주소 : ${tdi.addr1 }</p>
	</div>
	<div id="map" style="width:500px;height:400px;">
		지도 데이터를 불러오고 있습니다.
	</div>
	<%-- 후기 작성 영역 --%>
	<div>
		<form action="reply?contentid=${contentid }" method="POST">
			title : <input type="text" name="title"/>
			content : <textarea name="content" style="width : 80%; resize : none"></textarea>
			<button type="submit">댓글 등록</button>
		</form>
	</div>
	<%-- 댓글 랜더링 영역 --%>
	<div>
		<c:choose>
			<c:when test="${empty replys }">
				<div>등록된 댓글이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th width="10%">작성자</th>
						<th>내용</th>
						<th width="10%">작성일</th>
					</tr>
					<c:forEach var="r" items="${replys }">
						<tr>
							<td>${r.writer }</td>
							<td>${r.ment }</td>
							<td><fmt:formatDate value="${r.writed }" pattern="yyyy.MM.dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8b021b28b9f59d481b964d672a2c52b7"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(${tdi.mapy}, ${tdi.mapx}),
			level: 4
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>