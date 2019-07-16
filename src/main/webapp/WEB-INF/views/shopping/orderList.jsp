<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 구매 내역</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp" />
<style>
.orderWrapper {
	border: 1px solid #dddddd;
	width: 100%;
	height: 100%;
}

#header_v5_wrap_height {
	height: 200px;
}

.goods_name {
	line-height: 15px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis
}

.cell {
	border-left: 1px solid #ddd
}

input {
	padding-left: 5px;
	padding-top: 3px;
	padding-bottom: 3px;
}

.body_sub_area {
	width: 1160px;
	margin: auto;
}

.body_sub_area table {
	font-size: 13px;
}

.body_sub_area table th {
	padding-top: 3px;
	padding-bottom: 3px;
}

#pay {
	width: 180px;
	text-align: center;
	font-family: 'Spoqa Han Sans', sans-serif;
	display: inline-block;
	padding: 15px 0px;
	font-size: 16px;
	background-color: #44b27d;
	border: 1px solid #559c75;
	color: #ffffff;
	margin-left: 3px;
	cursor: pointer;
}

table.list_table_style {
	border: 0px;
	border-top: 2px solid #559c75;
}

table.list_table_style thead th {
	font-size: 15px;
	height: 35px;
	font-family: 'Spoqa Han Sans', sans-serif;
	border-right: 0px;
	border-left: 0px;
}

table.list_table_style td.cell {
	font-family: 'Spoqa Han Sans', sans-serif;
	border-right: 0px;
	border-left: 0px;
}

.white {
	color: white;
}

.bottom_line {
	border-bottom: 1px solid #dddddd;
}

.orderImg {
	border-radius: 10px;
	width: 100%;
}

</style>


<script>
	$(function() {

	});
</script>



</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/module/loginHeader.jsp" />
	<!-- 	images -->
	<div class="container-fluid imageContainer m-0 p-0 my">
		<div class="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="resources/img/mypage1.jpg" align="bottom"
								class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="resources/img/mypage2.jpg" class="d-block w-100"
								alt="...">
						</div>
						<div class="carousel-item">
							<img src="resources/img/mypage3.jpg" class="d-block w-100"
								alt="...">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 	contents -->
	<div class="container my wrapper">
		<div class="row text-center mt-5 my">

			<jsp:include page="/WEB-INF/views/module/mypage.jsp" />


			<div class="col-lg-3 col-md-4 col-sm-12 col-xs-12 pt-5 my">
				<div class="list-group">
					<a href="/mypageFirst"
						class="list-group-item list-group-item-action ">Overview</a> <a
						href="/mypageInfo" class="list-group-item list-group-item-action">내
						정보 수정</a> <a href="#"
						class="list-group-item list-group-item-action currentActive">구매
						내역</a> <a href="#" class="list-group-item list-group-item-action">Dapibus
						ac facilisis in</a>
				</div>
			</div>
			<div class="col-lg-9 col-md-8 col-sm-12 col-xs-12 pt-5 my">
				<div class="row pt-3 my"></div>
				<div class="row my">
					<div class="common-container-right-section">
						<div class="orderWrapper">
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="list_table_style">
								<thead>
									<tr>
										<th width="30">주문번호</th>
										<th width="130">상품명</th>
										<th width="90">주문일</th>

										<th width="100" class="hide">주문금액</th>
										<th width="90" class="goods_delivery_info hide">상태</th>
									</tr>
								</thead>
								<c:forEach var="list" items="${listWrapper}">
									<tbody>
										<c:forEach var="dto" items="${list}">

											<tr>
												<td class="cell right">${dto.s_orderno }</td>
												<td class="cell left rline">
													<table width="100%" border="0" cellpadding="0"
														cellspacing="0">
														<tr>
															<td class="center" width="60" height="60" valign="middle">
																<img src="/resources/${dto.s_p_imagepath }"
																class="productsImg" width="70px" height="70px">
															</td>
															<td class="left" valign="middle">
																<div class="goods_name" style="margin-left: 10px;">
																	<a href="#" title="${dto.s_p_title }">${dto.s_p_title }
																	</a>
																</div>
															</td>
														</tr>
													</table>
												</td>
												<td class="cell rline">${dto.s_orderdate }</td>
												<td class="cell right">${dto.s_p_price }</td>
												<td class="cell right">${dto.s_statement }</td>
											</tr>
										</c:forEach>
									</tbody>
									<tbody>
										<tr height="50">
									</tbody>
									
								</c:forEach>
							</table>
						</div>



					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp" />
</body>
</html>