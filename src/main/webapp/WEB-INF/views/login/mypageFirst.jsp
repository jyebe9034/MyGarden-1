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
// 		function formatDate(date) { 
// 			var d = new Date(date), 
// 			month = '' + (d.getMonth() + 1), 
// 			day = '' + d.getDate(), year = d.getFullYear(); 
// 			if (month.length < 2) month = '0' + month; 
// 			if (day.length < 2) day = '0' + day; 
// 			return [year, month, day].join('-'); 
// 		}

	//json
// for(var i=0; i<${lists}.length; i++){
// 	console.log(${lists}[i].date);
// }
		
for(var i=0; i<$('.calDay').length+13; i++){
	for(var j=0; j<${lists}.length; j++){
		if($('.calDay:nth-child('+i+')').attr('data-original-title')==${lists}[j].date){
			$('.calDay:nth-child('+i+')').css({'background': ${lists}[j].color, 'border':'none'});
		}
	}
}

// for(var i=0; i<$('.calDay').length+13; i++){
// if($('.calDay:nth-child('+i+')').attr('data-original-title')=='2019-01-05'){
// 	$('.calDay:nth-child('+i+')').css('background', 'red');
// }else if($('.calDay:nth-child('+i+')').attr('data-original-title')=='2019-12-31'){
// 	$('.calDay:nth-child('+i+')').css('background', 'red');
// }
// }

		$('.btn-group button').on('click', function(){
			$('input[name=key]').val($(this).text());
			$('#mypageGardenChange').submit();
		});
		
		$('.calDay').on('click', function(){
// 			$.ajax({
// 				url:"",
// 				type:"post",
// 				data:{key:$(this).attr('data-original-title')}
// 			}).done(function(resp){
				$('.orderList').slideDown();
// 			});
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
				  <a href="#" class="list-group-item list-group-item-action currentActive">Overview</a>
				  <a href="/mypageInfo" class="list-group-item list-group-item-action">내 정보 수정</a>
				  <a href="orderList" class="list-group-item list-group-item-action">구매 내역</a>
				  <a href="#" class="list-group-item list-group-item-action">Dapibus ac facilisis in</a>
				</div>
			</div>
			<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 pt-5 my">	
				<div class="row pt-3 my">
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
				<div class="row my">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt-3 bg-primary orderList my">
						<button type="button" class="close" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
						dddddd<br>
						dddddd<br>
						dddddd<br>
						dddddd<br>
						dddddd<br>
						dddddd<br>
						dddddd<br>
						dddddd<br>
						dddddd<br>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>