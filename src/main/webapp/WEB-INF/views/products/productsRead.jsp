<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>Products Read</title>
<style>
	#bcolor{
		width : 100%;
		height : 175px;
		background-color : #deca92;		
	}
	#titleImg{
		margin-top : 30px;
		width : 100%;
		height : 350px;
	}
	.trow{
		border-bottom : 1px solid #9c9c9c;
		height : 35px;
	}
	#table{
		width : 100%;
	}
	table{
		margin : 50px auto;
		border-top : 2px solid #9c9c9c;
		border-bottom : 2px solid #9c9c9c;
	}
	.tTitle{
		width : 200px;
		padding-left : 10px;
	}
	#main{
		margin-top : 50px;
		text-align : center;
	}
	#title{
		font-size : 34px;
		font-weight : 600px;
		margin-top : 50px;
		margin-bottom : 20px;
		color: #222422;
	}
	#text1{
		font-size : 20px;
		font-weight : 400px;
		margin-bottom : 15px;
		color: #222422;
	}
	#text2{
		font-size : 18px;
		font-weight : 400px;
		color: #222422;
	}
	#smCart{
		border : 1px solid #c9c5c5;
		width : 300px;
		position : fixed;
		left : 25px;
		bottom : 5px;
		background-color : white;
		border-top-left-radius : 5%;
		border-top-right-radius : 5%;
		box-sizing : border-box;
	}
	#smTitle{
		font-size : 24px;
		font-weight : bold;
		margin : 5px;
		color : #188752;
	}
	#smUnitTitle{
		font-size : 13px;
	}
	#msg{
		font-size : 11px;
		text-align : right;
		margin-top : 5px;
	}
	#smPriceTitle, #smCount{
		font-size : 15px;
	}
	#smTotal{
		font-size : 18px;
		font-weight : bold;
	}
	#smAmount{
		text-align : right;
		margin-bottom : 5px;
	}
	#total{
		font-size : 17px;
		font-weight : bold;
	}
	#getProduct{
		width : 100%;
		height : 50px;
		background-color : #44b27d;
		color : white;
		text-align : center;
		line-height : 50px;
	}
	#getProduct:hover{
		cursor : pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	<div id="wrapper">
		<div id="bcolor"></div>
		<div class="container">
			<div class="row">
				<div id="main" class="col-12">
					<img id="titleImg" src="${result.p_imagepath}">
					<div id="title" class="col-12">${result.p_title}</div>
					<div id="text1" class="col-12">${result.p_subtitle}</div>
					<div id="text2" class="col-12">${result.p_content}
								매일 다채롭게 활용되는 채소팩, 레디믹스 데일리입니다.<br>
								만나농장에서 정성껏 키워낸 베이비리프 채소를<br>
								배송 당일 수확 후 세척해 신선하게 보내드립니다.<br><br>
								
								언제 어디서나 간편하게 즐기는 샐러드로,<br>
								스테이크나 파스타 등의 요리에 멋을 더하는 아름다운 가니쉬 채소로,<br>
								각종 요리에 향긋한 풍미를 더하는 기본 채소로,<br>
								늘 우리 일상에 함께하는 베이비리프 채소 팩, 레디믹스 데일리를 만나보세요.<br>
					</div>
				</div>
				<div id="table" class="col-12">
					<table>
						<tr class="trow">
							<td class="tTitle"> 포장 단위 별 중량(g)</td>
							<td class="tContent">${result.p_unit}</td>
						</tr>
						<tr class="trow">
							<td class="tTitle"> 제조사 및 생산자</td>
							<td class="tContent">${result.p_seller}</td>
						</tr>
						<tr class="trow">
							<td class="tTitle"> 원산지</td>
							<td class="tContent">${result.p_origin}</td>
						</tr>
						<tr class="trow">
							<td class="tTitle"> 제조연원일</td>
							<td class="tContent">제품 별도 표기</td>
						</tr>
						<tr class="trow">
							<td class="tTitle"> 유통기한</td>
							<td class="tContent">별도의 유통기한은 없으나 신선식품이므로 가급적 빨리 드시기 바랍니다</td>
						</tr>
						<tr class="trow">
							<td class="tTitle"> 보관방법 및 취급방법</td>
							<td class="tContent">냉장 보관</td>
						</tr>
					</table>
				</div>
			</div>
			
			<jsp:include page="../module/boardReviewAndQnA.jsp"></jsp:include>
			
			<div id="smCart" class="row">
				<div id="smTitle" class="col-12">${result.p_title}</div>
				<label id="smUnitTitle" class="col-5">중량/판매단위</label><div id="smUnit" class="col-7">${result.p_unit}</div>
				<label id="smPriceTitle" class="col-5">상품 가격</label><div id="smPrice" class="col-7">${result.p_price}</div>
				<label id="smCount" class="col-5">수량</label>
				<div id="countSelect" class="col-7">
					<select id="smSelect" name="count">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</div>
				<div id="msg" class="col-12">마이페이지에서 배송일을 확인 할 수 있어요</div>
				<div id="smAmount" class="col-12">
					<label id="smTotal" class="m-0">총 금액 </label>
					<div id="total">${result.p_price}</div>
				</div>
				<div id="getProduct" class="col-12">담 기</div>
			</div>	
		</div>
	</div>
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>
	
	<script>
		$("#smPrice").html(function(){
			var price = $(this).html();
			var result = numberWithCommas(price);
			$(this).html(result);
		})
		
		$("#total").html(function(){
			var price = $(this).html();
			var result = numberWithCommas(price);
			$(this).html(result);
		})
	
		$("#smSelect").on("change", function(){
			var price = ${result.p_price};
			var count = $(this).val();
			var calculate = price * count;
			var result = numberWithCommas(calculate);
			$("#total").html(result);
		})
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		}
	</script>
</body>
</html>