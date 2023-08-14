<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
 .mapHeader{
 	height: 70px;
 	background:#193D76;
 	position: relative;
 }
 .spaceType{
	color : white;
	float:left; 
	justify-content: center;
	position: absolute;
  	top: 30%;
  	margin-left : 1%;
 }
 .closeBtn{
 	color : white;
 	float:right;
	justify-content: center;
	position: absolute;
  	top: 30%;
  	margin-left:97%;
 }
 	.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<header>
	<div class = "mapHeader">
		<div class = "spaceType">
			파티룸
		</div>
		<div class = "closeBtn">
			파티룸
		</div>
	</div>
	
	<c:if test="${!empty spaceMap}">
		<c:set var="space" value="${spaceMap}" />
	</c:if>
</header>
<body>
<div id="map" style="width:100%;height:1400px;"></div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=daa469d4ff476714bf26432374f5ebff"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도의 중심좌표
mapOption = { 
    center: new kakao.maps.LatLng(37.498095, 127.027610), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
}; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var overlays = [];
var contents = [];
//33.450701+ (i/10)
//126.570667 + (i/10)
var a = 0;
<c:forEach var ="i" items="${spaceMap}">	//지도에 마커를 표시합니다 
	var marker = new kakao.maps.Marker({
	map: map, 
	position: new kakao.maps.LatLng(${i.key.latitude} , ${i.key.longitude})
	});
	
	//커스텀 오버레이에 표시할 컨텐츠 입니다
	//커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	//별도의 이벤트 메소드를 제공하지 않습니다 
	content = '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + 
	        '			${i.key.spaceName} '+ 
	        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
	        '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
	        '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="ellipsis">${i.key.spaceAddress} ${i.key.spaceAddressDetail} ${i.key.spaceLocation}</div>' + 
	        '                <div class="jibun ellipsis">(우) ${i.key.spaceZipcode} (지번) 영평동 2181</div>' + 
	        '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';
	//마커 위에 커스텀오버레이를 표시합니다
	//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	var overlay = new kakao.maps.CustomOverlay({
	content: content,
	map: map,
	position: marker.getPosition()       
	});
	
	contents.push(content);
	overlays.push(overlay);
	
	var overlayToggle = createOverlayToggleFunction(overlay);

    kakao.maps.event.addListener(marker, 'click', overlayToggle);
</c:forEach>

closeOverlay();

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function createOverlayToggleFunction(overlay) {
    var visible = false; // 오버레이가 처음에는 보이지 않도록 설정

    return function () {
        if (visible) {
            overlay.setMap(null); // 오버레이가 보이면 닫음
        } else {
            overlay.setMap(map); // 오버레이가 보이지 않으면 열음
        }
        visible = !visible; // 보이기/숨기기 상태 변경
    };
}

function closeOverlay() {
    for (var i = 0; i < overlays.length; i++) {
        overlays[i].setMap(null); // 모든 overlay를 닫음
    }
}

</script>
</html>