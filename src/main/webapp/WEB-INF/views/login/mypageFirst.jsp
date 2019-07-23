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

</style>
</head>
<body>
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
		
		
			<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12 pt-5 my">
				<div class="list-group">
				  <a href="#" class="list-group-item list-group-item-action currentActive">Overview</a>
				  <a href="/mypageInfo" class="list-group-item list-group-item-action">내 정보 수정</a>
				  <a href="orderList" class="list-group-item list-group-item-action">구매 내역</a>
				  <a href="subsList" class="list-group-item list-group-item-action">정기 구독</a>
				</div>
			</div>
			<div class="col-lg-9 col-md-8 col-sm-12 col-xs-12 pt-5 my">	
				<div class="row pt-3 my">
					<div class="col-lg-8 col-md-8 col-sm-7 col-xs-12 text-right mb-2 pr-5 my">
						<h3><span class="font-weight-bold">[${memDTO.m_garden}]</span>의 기록</h3>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 text-left my">
						<form>
						  <div class="form-group pr-3 pl-3">
						    <select class="form-control" id="exampleFormControlSelect1">
						      <option>1</option>
						      <option>2</option>
						      <option>3</option>
						      <option>4</option>
						      <option>5</option>
						    </select>
						  </div>
						</form>	
					</div>	
				</div>	
				<div class="row my">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-2 my">
						<span class="border m-1">&nbsp;&nbsp;</span>
						<span class="border m-1">&nbsp;&nbsp;</span>
						<span class="border m-1">&nbsp;&nbsp;</span>
						<span class="border m-1">&nbsp;&nbsp;</span>
						<span class="border m-1">&nbsp;&nbsp;</span>
					</div>
				</div>	
			</div>
		</div>
	</div>	
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>