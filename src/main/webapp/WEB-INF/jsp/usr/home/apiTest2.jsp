<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
    
<c:set var="pageTitle" value="API TEST 2" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div>지도 API 테스트</div>

<div id="map" style="width:500px;height:400px;"></div>
<div id="roadview" style="width:100%;height:300px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=624f8434168c8330635dc252fad40b7e"></script>
<script>
	var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
	var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
	var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
	
	var position = new kakao.maps.LatLng(33.450701, 126.570667);
	
	// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
	roadviewClient.getNearestPanoId(position, 50, function(panoId) {
	    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
	});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(36.351017093501504, 127.37972652154949), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	//마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(36.351017093501504, 127.37972652154949);

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
	position: markerPosition
	});

	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	//아래 코드는 지도 위의 마커를 제거하는 코드입니다
	//marker.setMap(null);    
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>