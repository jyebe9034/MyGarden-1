<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap|Black+Han+Sans|Gothic+A1|Nanum+Gothic|Nanum+Gothic+Coding|Noto+Sans+KR&display=swap')
	;
	.loginPage{font-family:'Nanum Gothic', "맑은 고딕";}
</style>
</head>
<body>
<!-- script -->
	<script>
	</script>
<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"/>
<!-- 	images -->
	<div class="container-fluid m-0 p-0 my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
				<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="resources/img/login1.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/login2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/login3.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
<!-- 	contents -->
	<div class="container my">
		<div id="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
				<h2 class="font-weight-bold loginPage">나의 정원 로그인</h2><hr>
			</div>	
		</div>
	</div>
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>