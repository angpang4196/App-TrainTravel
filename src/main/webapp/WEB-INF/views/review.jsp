<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도 제공 및 후기 작성 페이지</title>
</head>
<body>
	<div>
		<%-- 지도 영역 --%>
		<div id="map" style="width:500px;height:400px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb20b73c8a35a25057f0dd1efe5d635d"></script>
		<div>
		<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(${mapy},${mapx}), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		
		</script>
			
   </div>
		
		<%-- 후기 작성 영역 --%>
		<div>
			<form action="/review-task">
			 
			 
			  <textarea name="content">
			  
			  </textarea>
			
			<button type="submit">확인</button>
			</form>
		</div>
	</div>
</body>
</body>
</html>