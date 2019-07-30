<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 마이페이지</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>
.wrapper{
	margin-bottom : 150px;
}
.calMonth{font-size:11px; width:25px; height:25px; float:left; padding-top:7px;}
.calDay{width:25px; height:25px; text-indent:-9999px; float:left; cursor:pointer;}
.calDay:hover{background:#eee;}
.orderList{display:none;}
tr th:nth-child(1){max-width:70px; word-break:break-all;}
h4 .badge{background:#eee;}

/* loading */
.locontent {
  width: 100%;
  height: 100%;
/*   background: rgba(0,0,0,0.4); */
	background: rgba(255,255,255,0.3);
  position:fixed;
  z-index:9999;
}
.lowrap{
  position:absolute;
  top:35%;
  left:50%;
  margin-left:-20px;
}
.lowrapper {
   display: flex; 
	align-self: center; 
  width: 5rem;
  height: 5rem;
	justify-content: space-around; 
  -webkit-transform: rotate(180deg);
          transform: rotate(180deg);
}

.load {
  width: 1.5rem;
  height: .75rem;
  margin-right: .4rem;
  background: #EAF7D9;
  position: relative;
  box-shadow: 0 -2px 10px rgba(40, 58, 16, 0.5);
}
.load:before {
  width: 0;
  height: 0;
  border-left: 1rem solid transparent;
  border-right: 1rem solid transparent;
  border-top: 1.5rem solid #EAF7D9;
  position: absolute;
  top: .5rem;
  left: -.75rem;
  content: '';
}
.load:after {
  width: 0;
  height: 0;
  border-left: .75rem solid transparent;
  border-right: .75rem solid transparent;
  border-top: 0.5rem solid #EAF7D9;
  position: absolute;
  top: 1.5rem;
  left: -.5rem;
  content: '';
}
.load.load-pesto {
  background: #8EA86C;
  -webkit-animation: wind 1s infinite;
          animation: wind 1s infinite;
  -webkit-animation-delay: 1s;
          animation-delay: 1s;
  z-index: 2;
}
.load.load-pesto:before, .load.load-pesto:after {
  border-top: 2rem solid #8EA86C;
}
.load.load-water {
  background: #283A10;
  -webkit-animation: wind 1.5s infinite;
          animation: wind 1.5s infinite;
}
.load.load-water:before, .load.load-water:after {
  border-top: 2rem solid #283A10;
}
.load.load-mint {
  background: #C3D6AA;
  -webkit-animation: wind 1s infinite;
          animation: wind 1s infinite;
  -webkit-animation-delay: .5s;
          animation-delay: .5s;
}
.load.load-mint:before, .load.load-mint:after {
  border-top: 2rem solid #C3D6AA;
}
.load.load-cilantro {
  background: #EAF7D9;
  -webkit-animation: wind 1.5s infinite;
          animation: wind 1.5s infinite;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  z-index: 3;
}
.load.load-cilantro:before, .load.load-cilantro:after {
  border-top: 2rem solid #EAF7D9;
}
.load.load-green {
  background: #4D642D;
  -webkit-animation: wind 1s infinite;
          animation: wind 1s infinite;
}
.load.load-green:before, .load.load-green:after {
  border-top: 2rem solid #4D642D;
}

@-webkit-keyframes wind {
  0% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  50% {
    -webkit-transform: rotate(3deg);
            transform: rotate(3deg);
    -webkit-transform-origin: center top;
            transform-origin: center top;
  }
  100% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
}

@keyframes wind {
  0% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  50% {
    -webkit-transform: rotate(3deg);
            transform: rotate(3deg);
    -webkit-transform-origin: center top;
            transform-origin: center top;
  }
  100% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
}
</style>
</head>
<body>
<!-- js -->
<script>
	$(function(){
		$('.carousel').carousel({
			  interval: 5000
			});
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
				if(rst[0]=="" && rst[1]==""){
				}else{
					$('.orderList').slideDown();
					for(var i=0; i<rst[0].length; i++){
						var mth=rst[0][i].sb_orderday.substring(0,1);
						var dy=rst[0][i].sb_orderday.substring(3,5);
						var yr=rst[0][i].sb_orderday.substring(7,12);
						$('#orderList').append(
						    '<tr>'
						    + '<th scope="row" class="pt-4">'+rst[0][i].sb_orderno_seq+'</th>'
						    + '<td rowspan="3" class="pt-3 pb-3"><img src="resources/img/organic.png" width="200" height="150"></td>'
						    + '<td colspan="2" class="pt-4 text-left">'+rst[0][i].sb_category+'</td>'
						    + '</tr>'
						    + '<tr>'
						    + '<th scope="row" class="pt-1 border-0">('+rst[0][i].sb_statement+')</th>'
						    + '<td colspan="2" style="border:none;" class="text-left">'+rst[0][i].sb_price+'원</td>'
						    + '</tr>'
						    + '<tr>'
						    + '<th scope="row" style="border:none;"></th>'
						    + '<td colspan="2" style="border:none;" class="text-left">'+yr+"-0"+mth+"-"+dy+'</td>'
						    + '</tr>'		
						);
					}
					for(var i=0; i<rst[1].length; i++){
						$('#orderList').append(
						    '<tr>'
						    + '<th scope="row" class="pt-4">'+rst[1][i].s_orderno+'</th>'
						    + '<td rowspan="3" class="pt-3 pb-3"><img src="'+rst[1][i].s_p_imagepath+'" width="200" height="150"></td>'
						    + '<td colspan="2" class="pt-4 text-left">'+rst[1][i].s_p_title+'</td>'
						    + '</tr>'
						    + '<tr>'
						    + '<th scope="row" class="pt-1 border-0">('+rst[1][i].s_statement+')</th>'
						    + '<td colspan="2" style="border:none;" class="text-left">'+rst[1][i].s_p_price+'원</td>'
						    + '</tr>'
						    + '<tr>'
						    + '<th scope="row" style="border:none;"></th>'
						    + '<td colspan="2" style="border:none;" class="text-left">'+formatDate(rst[1][i].s_orderdate)+'</td>'
						    + '</tr>'		
						);
					}
				}
			});
		});
		$('.locontent').css({'width':$(window).width(),'height':$(document).height()});
		$('.locontent').delay(3000).hide();
	});
</script>
	
<!-- 	loading -->
<!-- partial:index.partial.html -->
<div class="locontent">
	<div class="lowrap animated infinite flipOutY">
	    <div class="lowrapper">
	      <div class="load load-cilantro"></div>
	      <div class="load load-green"></div>
	      <div class="load load-pesto"></div>
	      <div class="load load-water"></div>
	      <div class="load load-mint"></div>
	    </div>
	    <div>
	      <p>Loading...</p>
	    </div>
    </div>
</div>

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
				  		<a href="chatManage" class="list-group-item list-group-item-action">채팅 문의 관리</a>
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
				<div class="row pt-2 pr-5 pl-5 pb-2 orderList my">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pr-5 pl-5 my">
					<button type="button" class="close m-4" aria-label="Close">
					  <span aria-hidden="true">&times;</span>
					</button>
					</div>
					<table class="table table-sm" style="border-bottom:1px solid #dee2e6;">
					  <thead>
					    <tr>
					      <th scope="col" class="pt-2 pb-2" style=width:150px;>No</th>
					      <th scope="col" class="pt-2 pb-2">상품</th>
					      <th scope="col" colspan=2 class="pt-2 pb-2 text-left">주문정보</th>
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