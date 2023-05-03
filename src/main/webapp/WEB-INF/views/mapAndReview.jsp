<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도 제공 및 후기 작성 페이지</title>
</head>
<body>
	<div style="display: flex">
		<div style="flex: 7; justify-content: center; align-items: center; display: grid;">
			<%-- 주소 및 지도 영역 --%>
			<div>
				<p>관광지 ID : ${contentid }
				<p>주소 : ${tdi.addr1 }</p>
			</div>
			<div id="map" style="width: 500px; height: 400px;">지도 데이터를 불러오고
				있습니다.
			</div>
			<%-- 길 찾기 바로가기 --%>
			<div>
				<a href="https://map.kakao.com/link/to/${tdi.title }, ${tdi.mapy }, ${tdi.mapx}">길 찾기</a>
			</div>
		</div>
		<%-- 후기 작성 영역 --%>
		<div style="flex:3">
			<form action="/reply-task?contentid=${contentid }" method="POST">
				content :
				<textarea name="content" style="width: 80%; resize: none"></textarea>
				<button type="submit">댓글 등록</button>
			</form>
		</div>
	</div>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa50ba81310359fa007dce1d4eb86753"></script>
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