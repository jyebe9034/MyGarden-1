<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
<!--      style -->
<style>
	.imageContainer{height:300px; overflow:hidden;}
	.carousel-inner{margin-top:-120px;}
	.overview{padding:20px 30px 20px 30px;}
	.gardenImg{width:95%px; height:150px; overflow:hidden;}
	.gardenImg img{background-size:cover;}
	.currentActive{background:#4f9c87; color:#fff;}
	.bg-f5{background: #f5f5f5;}
</style>     

<!--      html -->
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left my">
	<h2>마이페이지</h2><hr>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
	<div class="row my">
		<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 border border-white bg-f5 my">
			<div class="row pt-2 my">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 overview my">
					<div class="mb-2"><img src="resources/img/public.jpg" width="90" height="90"></div>
					<h4>님의</h4> 
					<h4 class="font-weight-bold">gardenName</h4>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 overview mb-4 my">
					<div class="gardenImg"><img src="resources/img/mypage2.jpg"></div>
				</div>
			</div>	
		</div>
		<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 bg-f5 border border-white overview my">
			<h3 class="text-left mt-4">구독현황 &raquo;</h3>
			<h4 class="text-center mt-2">3/week</h4>
			<p class="text-right mt-2"><a href="#" class="badge badge-primary">more</a></p>
		</div>
		<div class="col-lg-3 col-md- col-sm-6 col-xs-12 bg-f5 border border-white overview my">
			<h3 class="text-left mt-4">보유씨앗 &raquo;</h3>
			<h4 class="text-center mt-2">seed개</h4>
			<p class="text-right mt-2"><a href="#" class="badge badge-primary">more</a></p>
		</div>
	</div>	
</div>