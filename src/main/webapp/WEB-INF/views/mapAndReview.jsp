<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<div id="map" style="width: 500px; height: 400px;">
				지도 데이터를 불러오고 있습니다.
			</div>
			<%-- 길 찾기 바로가기 --%>
			<div>
				<a href="https://map.kakao.com/link/to/${tdi.title }, ${tdi.mapy }, ${tdi.mapx}">길 찾기</a>
			</div>
		</div>
		<%-- 후기 작성 영역 --%>
		<div>
			<div>
				<form action="/reply-task?contentId=${contentid }&cityname=${cityname}" method="POST">
					 content :
					<textarea name="content" style="width: 80%; resize: none"></textarea>
					<button type="submit">댓글 등록</button>
				</form>
			</div>
			<a href="/summary?area=${cityname }">관광지 리스트</a>
			<h4>
				후기 ( <span id="cnt">${fn:length(list) }</span>   건) <span id="refresh" style="cursor: pointer;">5</span>초 후 갱신
			</h4>
			<div id="messages">
				<c:forEach items="${list}" var="m">
					<div class="msg">${m.content }</div>
				</c:forEach>
			</div>
   		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb20b73c8a35a25057f0dd1efe5d635d"></script>
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
	 <script>
		const getMessages = function() {
			const xhr = new XMLHttpRequest();
			xhr.open("get", "/message?contentId=${contentid }", true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(this.readyState===4) {
					const json = JSON.parse(this.responseText);	// 아마 객체 배열일 듯
					if(json) {
						const messages = document.querySelector("#messages");
						messages.innerHTML = "";
						console.log(json);
						for(let o of json) {
							console.log(o);
							messages.innerHTML += "<div class='msg'>"+o.content+"</div>";
						}
					}
				}
			}
		};
		setInterval(function(){
			let value = parseInt(document.querySelector("#refresh").innerHTML);
			value--;
			if(value == 0) {
				getMessages();
				value = 5;
			}
			document.querySelector("#refresh").innerHTML = value;
		}, 1000);
	</script>
</body>
</html>