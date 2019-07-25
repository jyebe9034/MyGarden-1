<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 마이페이지</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
.wrapper{
	margin-bottom : 200px;
}
.calMonth{width:20px; height:20px; float:left;}
.calDay{width:20px; height:20px; text-indent:-9999px; float:left; cursor:pointer;}
.calDay:hover{background:#eee;}
.orderList{display:none;}
</style>
</head>
<body>
<!-- js -->
<script>
	$(function(){
		var today = new Date();
		var yyyy = today.getFullYear();
		var mt = ["Ja", "Fb", "Mr", "Ap", "Ma", "Ju", "Jl", "Ag", "Sp", "Ot", "Nv", "Dc"];
		$('.calDay').tooltip();
		$('.btn-group').html(
			  '<button type="button" class="btn btn-outline-secondary">'+(yyyy-4)+'</button>'
			 + '<button type="button" class="btn btn-outline-secondary">'+(yyyy-3)+'</button>'
			 + '<button type="button" class="btn btn-outline-secondary">'+(yyyy-2)+'</button>'
			 + '<button type="button" class="btn btn-outline-secondary">'+(yyyy-1)+'</button>'
			 + '<button type="button" class="btn btn-outline-secondary">'+(yyyy)+'</button>'
		);
	//date format		
		function formatDate(date) { 
			var d = new Date(date), 
			month = '' + (d.getMonth() + 1), 
			day = '' + d.getDate(), year = d.getFullYear(); 
			if (month.length < 2) month = '0' + month; 
			if (day.length < 2) day = '0' + day; 
			return [year, month, day].join('-'); 
		}
		
		for(var i=0; i<$('.calDay').length+13; i++){
			for(var j=0; j<${lists}.length; j++){
				if($('.calDay:nth-child('+i+')').attr('data-original-title')==${lists}[j].date){
					$('.calDay:nth-child('+i+')').css({'background': ${lists}[j].color, 'border':'none'});
				}
			}
		}
		$('.btn-group button').on('click', function(){
			$('input[name=key]').val($(this).text());
			$('#mypageGardenChange').submit();
		});
		$('.close').on('click', function(){
			$('#orderList').html("");
			$('.orderList').slideUp();
		});
		$('.calDay').on('click', function(){
			$('#orderList').html("");
			$('.orderList').slideUp();
			$.ajax({
				url:"/getShoppedList",
				type:"post",
				data:{date:$(this).attr('data-original-title')+" 00:00:00.000000000"}
			}).done(function(resp){
				var rst = JSON.parse(resp);
				if(rst==""){
				}else{
					$('.orderList').slideDown();
					for(var i=0; i<rst.length; i++){
						$('#orderList').append(
						    '<tr>'
						    + '<th scope="row">'+rst[i].s_orderno_seq+'</th>'
						    + '<td rowspan="2"><img src="'+rst[i].s_p_imagepath+'" width="200" height="150"></td>'
						    + '<td colspan="2" class="pt-4 text-left">'+rst[i].s_p_title+'</td>'
						    + '</tr>'
						    + '<tr>'
						    + '<th scope="row" style="border:none;"></th>'
						    + '<td style="border:none;" class="text-left">'+rst[i].s_p_price+'원</td>'
						    + '<td style="border:none;">'+formatDate(rst[i].s_orderdate)+'</td>'
						    + '</tr>'		
						);
					}
				}
			});
		});
	});
</script>
<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"/>
<!-- 	images -->
	<div class="container-fluid imageContainer m-0 p-0 my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
				<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="resources/img/mypage1.jpg" align="bottom" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/mypage2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/mypage3.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 	contents -->
	<div class="container my wrapper">
		<div class="row text-center mt-5 my">
			
		<jsp:include page="/WEB-INF/views/module/mypage.jsp"/>
		
		
			<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 pt-5 my">
				<div class="list-group">
				  <a href="/mypageFirst" class="list-group-item list-group-item-action currentActive">Overview</a>
				  <a href="/mypageInfo" class="list-group-item list-group-item-action">내 정보 수정</a>
				  <a href="orderList" class="list-group-item list-group-item-action">구매 내역</a>
				  <a href="subsList" class="list-group-item list-group-item-action">정기 구독</a>
				  <c:if test="${grade == 'admin'}">
				  		<a href="productsAdd" class="list-group-item list-group-item-action">상품 등록</a>
				  </c:if>
				  <a href="/mypageDelete" class="list-group-item list-group-item-action">탈퇴하기</a>
				</div>
			</div>
			<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 pt-5 my">	
				<div class="row my">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-2 my">
						<h3><span class="font-weight-bold">[${memDTO.m_garden}]</span>의 기록</h3>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
						<div class="btn-group" role="group" aria-label="Basic example">
						</div>
						<form action="/mypageGardenChange" method="post" id="mypageGardenChange">
							<input type="text" class="d-none" name="key">
						</form>
					</div>	
				</div>	
				<div class="row my">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pt-3 pr-5 pl-5 my">
						<div class="garden text-left">
							<c:forEach begin="0" end="11" step="1" var="i">
								<h6 class="m-1 calMonth text-center">${mm[i] }</h6>
									<c:forEach begin="1" end="${cal[i]}" step="1" var="x">
										<c:choose>
											<c:when test="${i<9 && x<10}">  
									  			<div class="border m-1 calDay" data-toggle="tooltip" data-placement="top" title="${year}-0${i+1}-0${x}">${ x }</div>
									  		</c:when>
											<c:when test="${i>8 && x<10}">  
									  			<div class="border m-1 calDay" data-toggle="tooltip" data-placement="top" title="${year}-${i+1}-0${x}">${ x }</div>
									  		</c:when>
											<c:when test="${i<9 && x>9}">  
									  			<div class="border m-1 calDay" data-toggle="tooltip" data-placement="top" title="${year}-0${i+1}-${x}">${ x }</div>
									  		</c:when>
									  		<c:otherwise>
									  			<div class="border m-1 calDay" data-toggle="tooltip" data-placement="top" title="${year}-${i+1}-${x}">${ x }</div>
											</c:otherwise>
									  	</c:choose>	
									</c:forEach>
							</c:forEach>
						</div>	
					</div>
				</div>	
				<div class="row pt-2 pr-5 pl-5 orderList my">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-5 pl-5 my">
					<button type="button" class="close m-4" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
					</div>
					<table class="table" style="border-bottom:1px solid #dee2e6;">
					  <thead>
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">상품명</th>
					      <th scope="col">주문금액</th>
					      <th scope="col">주문일</th>
					    </tr>
					  </thead>
					  <tbody id="orderList">
					  	
					  </tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>	
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>