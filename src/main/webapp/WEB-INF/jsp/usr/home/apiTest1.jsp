<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
    
<c:set var="pageTitle" value="API TEST 1" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<script>
	const API_KEY = '${apiTest1Key }';
	const url = 'http://apis.data.go.kr/B552584/UlfptcaAlarmInqireSvc/getUlfptcaAlarmInfo';

	function apiTestAjax() {
		$.ajax({
			url : url,
			type : 'GET',
			data : {
				serviceKey : API_KEY,
				returnType : 'json',
				nomOfRows : 100,
				pageNo : 1,
				year : 2024
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
		 		$('#apiTestContent').html(data.response.body.items[0].districtName);
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})
	}
	
	apiTestAjax();

// 	async function apiTest() {
// 		const API_KEY = 'sd2%2Fw1FPMP7dCiLT1r8GNJatfwBCKhZfFVQAA3lNV55hr4o2tNP9B0NpNBn7iAGvAN8QwKTBfli73H%2Fdq7xZBw%3D%3D';
// 		const url = 'http://apis.data.go.kr/B552584/UlfptcaAlarmInqireSvc/getUlfptcaAlarmInfo?serviceKey=' + API_KEY + '&returnType=json&numOfRows=100&pageNo=1&year=2024';
		
// 		const response = await fetch(url);
// 		const data = await response.json();
		
// 		console.log(data);
// 		$('#apiTestContent').html(data.response.body.items[0].districtName);
// 	}
	
// 	apiTest();
</script>

<div>API 테스트</div>
<div id="apiTestContent"></div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>