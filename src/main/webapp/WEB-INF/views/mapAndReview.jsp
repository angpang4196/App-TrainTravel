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
		
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa50ba81310359fa007dce1d4eb86753"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(${tdi.mapy}, ${tdi.mapx}),
			level: 4
		};

		var map = new kakao.maps.Map(container, options);
		
		var markerPosition  = new kakao.maps.LatLng(${tdi.mapy}, ${tdi.mapx}); 

		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
	</script>
</body>
</html>