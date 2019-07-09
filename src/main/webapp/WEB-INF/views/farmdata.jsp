<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<title>DataBase</title>
	<style>
		body{margin:30px;}
		table{margin-top:20px;}
		hr{margin-top:40px;}
		button{margin-left:50px; margin-top:15px;}
		th{text-align:center;}
	</style>
</head>
<body>	
	<script>
		$(function(){
			$('button').on('click', function(){
				$(this).html($(this).text() + '&nbsp;&nbsp;<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>');
				$.ajax({
					url:$(this).attr('id')
				}).done(function(resp){
					alert(resp);
					$('.spinner-border').remove();
				});
			});
		});
	</script>
	
	<li>serviceKey : 7f811021e2144a8881c64f23e705fa1f</li>
	<hr>
<!------------------------------------------------------------------>
	<h3>가이드라인</h3>
	<table border="1">
		<tr>
			<th>오퍼레이션명(영문)</th>
			<th>오퍼레이션명(국문)</th>
		</tr>
		<tr>
			<td>getIdentityDataList
			<td>아이덴티티정보
		</tr>
		<tr>
			<td>getEnvDataList
			<td>환경정보
		</tr>
		<tr>
			<td>getEnvDataLsList
			<td>환경정보(양돈)
		</tr>
		<tr>
			<td>getCultivateDataList
			<td>생육정보(토마토/파프리카/오이/가지)
		</tr>
		<tr>
			<td>getStrbCultivateDataList
			<td>생육정보(딸기)
		</tr>
		<tr>
			<td>getMumCultivateDataList
			<td>생육정보(국화)
		</tr>
		<tr>
			<td>getFruitCultivateDataList
			<td>생육정보(참외)
		</tr>
		<tr>
			<td>getLsCultivateDataList
			<td>생육정보(양돈)
		</tr>
		<tr>
			<td>getManagementData
			<td>경영정보
		</tr>
	</table>
	<hr>
<!------------------------------------------------------------------>	
	<li>농림수산식품교육문화정보원에서 연계 수집하고 있는 스마트팜 보급 농가의 아이덴티티 정보(농가ID, 시설ID, 지역, 품목코드)를 조회하는 기능</li>
	<li>http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getIdentityDataList/{serviceKey}</li>
	<button type="button" id="getIdentityDataList" class="btn btn-outline-primary">아이덴티티 정보 DB삽입</button>

	<table border="1">
		<tr>
			<th>필드명</th>
			<th>내용</th>
			<th>필드 타입</th>
		</tr>
		<tr>
			<td>addressName
			<td>법정동명
			<td>String(100)
		</tr>
		<tr>
			<td>facilityId
			<td>시설 ID
			<td>String(20)
		</tr>
		<tr>
			<td>itemCode
			<td>품목코드
			<td>String(8)
		</tr>
		<tr>
			<td>statusCode
			<td>
			<td>String (4)
		</tr>
		<tr>
			<td>statusMessage
			<td>
			<td>String (100)
		</tr>
		<tr>
			<td>userId
			<td>농가 ID
			<td>String (20)
		</tr>
	</table>
	<hr>
<!------------------------------------------------------------------>	
	<li>농가 아이디에 해당하는 작기정보를 조회하는 기능</li>
	<li>http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getCroppingSeasonDataList/{serviceKey}/{userId}</li>
	<button type="button" id="getCroppingSeasonDataList" class="btn btn-outline-primary">작기정보 DB삽입</button>

	<table border="1">
		<tr>
			<th>필드명</th>
			<th>내용</th>
			<th>필드 타입</th>
		</tr>
		<tr>
			<td>croppingSerlNo
			<td>작기일련번호
			<td>Integer(10)
		</tr>
		<tr>
			<td>croppingSeasonName
			<td>작기이름
			<td>String(30)
		</tr>
		<tr>
			<td>croppingDate
			<td>정식일
			<td>String(25)
		</tr>
		<tr>
			<td>croppingEndDate
			<td>종료일
			<td>String(25) 
		</tr>
		<tr>
			<td>croppingSystem
			<td>재배방식
			<td>String (25)
		</tr>
		<tr>
			<td>itemCode
			<td>품목코드
			<td>String (20)
		</tr>
		<tr>
			<td>cultivationArea
			<td>재배면적(PY) 
			<td>Double (10)
		</tr>
		<tr>
			<td>calCultivationArea
			<td>재배면적(M2) 
			<td>Double (10)
		</tr>
		<tr>
			<td>plantNum
			<td>식재된 총 작물의 수
			<td>Double (10)
		</tr>
		<tr>
			<td>calPlantNum
			<td>m2당 식재된 작물의 수
			<td>Double (10)
		</tr>
		<tr>
			<td>stemSlabNum
			<td>배지 1개당 작물의 줄기 수
			<td>Double (10)
		</tr>
		<tr>
			<td>planSlabNum
			<td>배지 1개당 작물의 수
			<td>Double (10)
		</tr>
		<tr>
			<td>plantDensity
			<td>재식밀도
			<td>Double (10)
		</tr>
		<tr>
			<td>standardPlantDensity
			<td>기준 재식밀도
			<td>Double (10)
		</tr>
		<tr>
			<td>floodlightDec
			<td>투광율
			<td>Double (10)
		</tr>
		<tr>
			<td>leafArea
			<td>엽면적기준
			<td>Double (10)
		</tr>
		<tr>
			<td>stndTemp
			<td>기준온도
			<td>Double (10)
		</tr>
		<tr>
			<td>stndWeight
			<td>기준과중
			<td>Double (10)
		</tr>
		<tr>
			<td>stndSolar
			<td>기준광
			<td>Double (10)
		</tr>
		<tr>
			<td>stndMeta
			<td>기초대사
			<td>Double (10)
		</tr>
	</table>
	<hr>
<!------------------------------------------------------------------>	
	<li>농가 아이디, 작기일련번호 조건에 해당하는 경영정보를 조회하는 기능</li>
	<li>http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getManagementData/{serviceKey}/{userId}/{croppingSerlNo}</li>
	<button type="button" id="getManagementData" class="btn btn-outline-primary">경영정보 주소 출력</button>
	
	<table border="1">
		<tr>
			<th>필드명</th>
			<th>내용</th>
			<th>필드 타입</th>
		</tr>
		<tr>
			<td>manpowerPrice
			<td>인건비 (원)
			<td>Integer(10)
		</tr>
		<tr>
			<td>nutrientPrice
			<td>양액비 (원)
			<td>Integer(10)
		</tr>
		<tr>
			<td>preventionPrice
			<td>방제비 (원)
			<td>Integer(10)
		</tr>
		<tr>
			<td>shipmentAmt
			<td>총출하량(kg)
			<td>Integer(10)
		</tr>
		<tr>
			<td>shipmentPrice
			<td>총출하가격 (원)
			<td>Integer(10)
		</tr>
		<tr>
			<td>maintenancePrice
			<td>유지비 (원)
			<td>Integer(10)
		</tr>
		<tr>
			<td>materialsPrice
			<td>원자재비 (원)
			<td>Integer(10)
		</tr>
	</table>
	<hr>
<!------------------------------------------------------------------>	
	<li>시설 아이디, 측정일시, 분야코드, 분류코드, 항목코드, 품목코드 조건에 해당하는 시설원예 환경 정보를 조회하는 기능</li>
	<li>http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getEnvDataList/{serviceKey}/{facilityId}/{measDate}/{fldCode}/{sectCode}/{fatrCode}/{itemCode}</li>
	<hr>
<!------------------------------------------------------------------>	
	<li>시설 아이디, 측정일시, 항목코드 조건에 해당하는 양돈 환경 정보를 조회하는 기능</li>
	<li>http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getEnvDataLsList/{serviceKey}/{facilityId}/{measDate}/{fatrCode}</li>
	<hr>
<!------------------------------------------------------------------>	
	<li>농가 아이디, 작기일련번호, 시작일, 종료일 조건에 해당하는 시설원예 품목(토마토/파프리카/오이/가지)의 생육정보를 조회하는 기능</li>
	<li>http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getCultivateDataList/{serviceKey}/{userId}/{croppingSerlNo}/{startDate}/{endDate}</li>
<!-- 	<button type="button" id="getCultivateDataList" class="btn btn-outline-primary">토마토/파프리카/오이/가지 생육정보 DB삽입</button> -->

	<table border="1">
		<tr>
			<th>필드명</th>
			<th>내용</th>
			<th>필드 타입</th>
		</tr>
		<tr>
			<td>measDate
			<td>측정일
			<td>String(20)
		</tr>
		<tr>
			<td>userId
			<td>사용자ID
			<td>String(20)
		</tr>
		<tr>
			<td>itemCode
			<td>품목코드
			<td>String(20)
		</tr>
		<tr>
			<td>sampleNum
			<td>표본넘버
			<td>String(1)
		</tr>
		<tr>
			<td>growLength
			<td>생장길이(Cm)
			<td>Double(10)
		</tr>
		<tr>
			<td>flowerTop
			<td>화방높이(Cm)
			<td>Double(10)
		</tr>
		<tr>
			<td>stemDiameter
			<td>줄기직경(경경)( mm)
			<td>Double (10)
		</tr>
		<tr>
			<td>leavesLength
			<td>잎길이(옆장) (Cm)
			<td>Double (10)
		</tr>
		<tr>
			<td>leavesWidth
			<td>잎폭(옆폭) (Cm)
			<td>Double (10)
		</tr>
	</table>
	<hr>
<!------------------------------------------------------------------>	
	<li>농가 아이디, 작기일련번호, 시작일, 종료일 조건에 해당하는 시설원예 품목(딸기)의 생육정보를 조회하는 기능</li>
	<li>http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getStrbCultivateDataList/{serviceKey}/{userId}/{croppingSerlNo}/{startDate}/{endDate}</li>
<!-- 	<button type="button" id="getStrbCultivateDataList" class="btn btn-outline-primary">딸기 생육정보 DB삽입</button> -->
	<hr>
<!------------------------------------------------------------------>	
	<li>농가 아이디, 작기일련번호, 시작일, 종료일 조건에 해당하는 시설원예 품목(국화)의 생육정보를 조회하는 기능</li>
	<li>http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getMumCultivateDataList/{serviceKey}/{userId}/{croppingSerlNo}/{startDate}/{endDate}</li>
<!-- 	<button type="button" id="getMumCultivateDataList" class="btn btn-outline-primary">국화 생육정보 DB삽입</button> -->
	<hr>
<!------------------------------------------------------------------>	
	<li>시설 아이디, 측정일시, 항목코드 조건에 해당하는 축산 품목(양돈)의 생육정보를 조회하는 기능</li>
	<li>http://www.smartfarmkorea.net/Agree_WS/webservices/ProvideRestService/getLsCultivateDataList/{serviceKey}/{facilityId}/{measDate}/{fatrCode}</li>
<!-- 	<button type="button" id="getLsCultivateDataList" class="btn btn-outline-primary">양돈 생육정보 DB삽입</button> -->
	<hr>	
	
</body>
</html>