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
	<div id="map" style="width: 500px; height: 400px;">지도 데이터를 불러오고
		있습니다.</div>
	<%-- 후기 작성 영역 --%>
	<div>
		<form action="/reply-task?contentid=${contentid }" method="POST">
			title : <input type="text" name="title" /> content :
			<textarea name="content" style="width: 80%; resize: none"></textarea>
			<button type="submit">댓글 등록</button>
		</form>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=22c8baafdc9ecfd56bb68920f8b15e6d"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(${tdi.mapy}, ${tdi.mapx}),
			level: 4
		};

		var map = new kakao.maps.Map(container, options);
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${tdi.mapy},${tdi.mapx}); 
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
</body>
</html>