<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도 제공 및 후기 작성 페이지</title>
<style>
.return, .searchRoad {
      background-color: #F8F8F8;
      padding: 10px;
      margin-bottom: 10px;
    }

.searchRoad {
      margin-top: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 16px;
    }

.searchRoad a {
      background-color: #42444e;
      color: white;
      border-radius: 5px;
      padding: 10px 20px;
      text-decoration: none;
      transition: background-color 0.3s ease-in-out;
    }
.searchRoad a:hover {
      background-color: #42444e;
      color: lime;
    }

.return {
      margin-top: 20px;
      text-align: center;
      font-size: 16px;
      background-color:  #42444e;
    }

.return a {
      color: white;
      border-radius: 5px;
      padding: 10px 20px;
      text-decoration: none;
      transition: background-color 0.3s ease-in-out;
    }

.return a:hover {
      background-color: #333;
      color: #fff;
    }
</style>
</head>
<body>
	<div style="display: flex">
		<div style="flex: 7; justify-content: center; align-items: center; display: grid;">
			<div class="return">
				<a href="/summary?area=${cityname }">관광지 리스트로 돌아가기</a>
			</div>			
			<div class="searchRoad" style="border: 2px solid black">					
				<a href="https://map.kakao.com/link/to/${tdi.title }, ${tdi.mapy }, ${tdi.mapx}" style="margin-right: 30px">길 찾기</a>
				<p>※ 도착지는 설정되어 있으니 출발지만 입력 해 주시면 됩니다.</p>
			</div>
			<%-- 주소 및 지도 영역 --%>
			<div>
				<h4>주소</h4><hr/>
				<p>${tdi.addr1 }</p><hr/>
			</div>
			<div id="map" style="width: 900px; height: 600px;">
				지도 데이터를 불러오고 있습니다.
			</div>
		</div>
		<%-- 후기 작성 영역 --%>
		<div style="flex: 3;border: 1px solid black;">
			<div style="text-align: center; justify-content: center">
				<form action="/reply-task?contentId=${contentid }&cityname=${cityname}" method="POST">
					 <h3>후기 작성</h3>
					<textarea name="content" style="width: 80%; height:200px; resize: none"></textarea><br/>
					<button type="submit">댓글 등록</button>
				</form>
			</div>
			<h4>
				최근 후기 목록 (<span id="refresh" style="cursor: pointer;">5</span>초 후 갱신)<hr/>
			</h4>
			<div id="messages">
				<c:forEach items="${list}" var="m">
					<div class="msg"><small>(${m.formatWrited })</small>&nbsp;&nbsp;&nbsp;${m.content }</div><hr/>
				</c:forEach>
			</div>
   		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa50ba81310359fa007dce1d4eb86753"></script>
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
					const json = JSON.parse(this.responseText);
					if(json) {
						const messages = document.querySelector("#messages");
						messages.innerHTML = "";
						for(let o of json) {
							console.log(o);
							messages.innerHTML += "<div class='msg'><small>(" + o.formatWrited + ")</small>&nbsp;&nbsp;&nbsp;" +  o.content + "</div><hr/>";
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