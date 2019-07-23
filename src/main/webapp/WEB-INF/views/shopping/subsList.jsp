<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 구매 내역</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp" />
<style>
.orderWrapper {
	border: 1px solid #dddddd;
	border-top: none;
	width: 100%;
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

table.list_table_style {
	border: 0px;
	border-top: 2px solid #559c75;
}

table.list_table_style thead th {
	font-size: 12px;
	height: 35px;
	font-family: 'Spoqa Han Sans', sans-serif;
	border-right: 0px;
	border-left: 0px;
}

.cell {
	font-size: 12px;
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

.orderLists {
	height: 100px;
}

.productsImg {
	border-radius: 10px;
}

#listSearchBox {
	padding: 40px;
	font-size: 13px;
}

.durBtns {
	font-size: 13px;
	margin-right: 3px;
	padding: 3px;
	padding-left: 4px;
	padding-right: 4px;
}

.subsCancel {
	background-color: dimgray;
	border: dimgray;
	font-size: 13px;
	margin-right: 3px;
	padding: 3px;
	padding-left: 4px;
	padding-right: 4px;
}

#empty {
	font-size: 13px;
}
</style>


<script>
	$(function() {
		
	});
</script>



</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp" />
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
						정보 수정</a> <a href="orderList"
						class="list-group-item list-group-item-action">구매 내역</a> <a
						href="#"
						class="list-group-item list-group-item-action currentActive">정기
						구독</a>
				</div>
			</div>


			<div class="col-lg-9 col-md-8 col-sm-12 col-xs-12 pt-5 pb-5 my">
				<div class="row my">
					<div class="common-container-right-section col-12">

						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active" href="#">구매
									내역</a></li>
						</ul>
						<div class="orderWrapper">
							<div id="listSearchBox">
								<form action="orderSearch" id="orderSearch" method="post">
									<span id="orderStatus" class="mr-3">주문상태 </span> <select
										name="orderStatus" class="p-1">
										<option>전체</option>
										<option>입금 대기</option>
										<option>결제 완료</option>
										<option>배송중</option>
										<option>배송 완료</option>
										<option>구매 완료</option>
										<option>구매 취소</option>
									</select> <span id="orderDuration" class="ml-5 mr-3">조회기간 </span> <span>
										<input type="button" value="1주일" id="week"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="1개월" id="month"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="3개월" id="months"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="6개월" id="halfyear"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="전체" id="all"
										class="btn btn-outline-secondary durBtns"> <input
										type="hidden" id="btnValue" name="orderDuration">
									</span>
								</form>
							</div>

							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="list_table_style">
								<thead class="bottom_line">
									<tr>
										<th width="60">상품 번호</th>
										<th width="70">구독 상품</th>
										<th width="90">배송 시작일</th>
										<th width="70">배송 주기</th>
										<th width="70">주문 금액</th>
										<th width="70" class="goods_delivery_info">구독 현황</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test='${list=="[]"}'>
											<tr>
												<td class="td_bottom_line" align="center" colspan="9"
													height="80" id="empty">구매 내역이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="dto" items="${list}">
												<tr class="pt-3 pb-3 orderLists bottom_line">
													<td class="cell">${dto.sb_orderno_seq }</td>
													<td class="cell">
														<table width="100%" border="0" cellpadding="0"
															cellspacing="0">
															<tr>
																<td valign="middle">
																	<div class="goods_name">
																		<a href="subscription" >${dto.sb_category }
																		<c:if test="${dto.sb_category=='나만의 박스'}">
																			(구성 : ${dto.sb_component1 }, ${dto.sb_component2 }, ${dto.sb_component3 })
																		</c:if>
																		</a>
																	</div>
																</td>
															</tr>
														</table>
													</td>
													<td class="cell">${dto.sb_startday }</td>
													<td class="cell">${dto.sb_period }</td>
													<td class="cell"><fmt:formatNumber value="${dto.sb_price }"
															type="number" />원</td>
													<c:choose>
														<c:when test="${dto.sb_statement =='구독중'}">
															<td class="cell"><span class="mr-1">${dto.sb_statement }</span><input
																type="button" value="구독취소
																class="subsCancel btn btn-dark"></td>
														</c:when>
														<c:when test="${dto.sb_statement =='입금 대기'}">
															<td class="cell"><span class="mr-1" style="color:dodgerblue;">${dto.sb_statement }</span></td>
														</c:when>
														<c:when test="${dto.sb_statement =='구독 취소'||dto.sb_statement =='주문 만료'}">
															<td class="cell"><span class="mr-1" style="color:red;">${dto.sb_statement }</span></td>
														</c:when>
														<c:otherwise>
															<td class="cell">${dto.sb_statement }</td>
														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
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