<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 구독 내역</title>
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
	font-size: 14px;
	height: 35px;
	border-right: 0px;
	border-left: 0px;
}

.cell {
	font-size: 14px;
}

table.list_table_style td.cell {
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
	font-size: 14px;
}

.durBtns {
	font-size: 14px;
	margin-right: 3px;
	padding: 3px;
	padding-left: 4px;
	padding-right: 4px;
}

.subsCancel {
	background-color: #4f9c87;
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

#cancelConfirm {
	display: none;
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 9999999;
}

#confirm_cancel {
	border-radius: 10px;
	float: left;
	width: 50%;
	font-size: 14px;
	color: #818181;
	padding: 18px 0px;
	cursor: pointer;
}

#confirm_yes {
	border-radius: 10px;
	float: left;
	width: 50%;
	font-size: 14px;
	color: #818181;
	padding: 18px 0px;
	cursor: pointer;
	border-left: 1px solid #eaeaea;
}

#confirm_cancel:hover {
	background-color: lightgray;
}

#confirm_yes:hover {
	background-color: lightgray;
}

#confirm_msg {
	padding: 30px 0px;
	border-bottom: 1px solid #eaeaea;
	font-size: 14px;
	font-weight: bold;
}

.emoji {
	width: 120px;
	height: 120px;
	margin: 15px 15px 40px;
	background: #FFDA6A;
	display: inline-block;
	border-radius: 50%;
	position: relative;
}

.emoji:after {
	position: absolute;
	bottom: -40px;
	font-size: 18px;
	width: 60px;
	left: calc(50% - 30px);
	color: #8A8A8A;
}

.emoji__face, .emoji__eyebrows, .emoji__eyes, .emoji__mouth,
	.emoji__tongue, .emoji__heart, .emoji__hand, .emoji__thumb {
	position: absolute;
}

.emoji__face:before, .emoji__face:after, .emoji__eyebrows:before,
	.emoji__eyebrows:after, .emoji__eyes:before, .emoji__eyes:after,
	.emoji__mouth:before, .emoji__mouth:after, .emoji__tongue:before,
	.emoji__tongue:after, .emoji__heart:before, .emoji__heart:after,
	.emoji__hand:before, .emoji__hand:after, .emoji__thumb:before,
	.emoji__thumb:after {
	position: absolute;
	content: '';
}

.emoji__face {
	width: inherit;
	height: inherit;
}

.emoji--sad:after {
	content: 'Sad';
}

.emoji--sad .emoji__face:hover {
	animation: sad-face 2s ease-in infinite;
}

#confirmWrapper:hover .emoji__face {
	animation: sad-face 2s ease-in infinite;
}

.emoji--sad .emoji__eyebrows {
	left: calc(50% - 3px);
	top: 35px;
	height: 6px;
	width: 6px;
	border-radius: 50%;
	background: transparent;
	box-shadow: -40px 9px 0 0 #000000, -25px 0 0 0 #000000, 25px 0 0 0
		#000000, 40px 9px 0 0 #000000;
}

.emoji--sad .emoji__eyebrows:before, .emoji--sad .emoji__eyebrows:after
	{
	width: 30px;
	height: 20px;
	border: 6px solid #000000;
	box-sizing: border-box;
	border-radius: 50%;
	border-bottom-color: transparent;
	border-left-color: transparent;
	border-right-color: transparent;
	top: 2px;
	left: calc(50% - 15px);
}

.emoji--sad .emoji__eyebrows:before {
	margin-left: -30px;
	transform: rotate(-30deg);
}

.emoji--sad .emoji__eyebrows:after {
	margin-left: 30px;
	transform: rotate(30deg);
}

.emoji--sad .emoji__eyes {
	width: 14px;
	height: 16px;
	left: calc(50% - 7px);
	top: 50px;
	border-radius: 50%;
	background: transparent;
	box-shadow: 25px 0 0 0 #000000, -25px 0 0 0 #000000;
}

.emoji--sad .emoji__eyes:after {
	background: #548DFF;
	width: 12px;
	height: 12px;
	margin-left: 6px;
	border-radius: 0 100% 40% 50%/0 50% 40% 100%;
	transform-origin: 0% 0%;
	animation: tear-drop 2s ease-in infinite;
}

.emoji--sad .emoji__mouth {
	width: 60px;
	height: 80px;
	left: calc(50% - 30px);
	top: 80px;
	box-sizing: border-box;
	border: 6px solid #000000;
	border-radius: 50%;
	border-bottom-color: transparent;
	border-left-color: transparent;
	border-right-color: transparent;
	background: transparent;
	animation: sad-mouth 2s ease-in infinite;
}

.emoji--sad .emoji__mouth:after {
	width: 6px;
	height: 6px;
	background: transparent;
	border-radius: 50%;
	top: 4px;
	left: calc(50% - 3px);
	box-shadow: -18px 0 0 0 #000000, 18px 0 0 0 #000000;
}

@keyframes sad-face { 
25%, 35% {
	top: -15px;
}

55%,95% {
top: 10px;
}

100%,0% {
top: 0;
}
}

@keyframes sad-mouth { 
25%, 35% {
	transform: scale(0.85);
	top: 70px;
}

55%,100%,0%{
transform: scale(1);
top:80px;
}
}

@keyframes tear-drop { 
0%, 100% {
	display: block;
	left: 35px;
	top: 15px;
	transform: rotate(45deg) scale(0);
}
25%{
display: block;
left:35px;
transform: rotate(45deg) scale(2);
}

49.9% {
display: block;
left: 35px;
top: 65px;
transform: rotate(45deg) scale(0);
}

50%{
display: block;
left: -35px;
top: 15px;
transform: rotate(45deg) scale(0);
}

75%{
display: block;
left: -35px;
transform: rotate(45deg) scale(2);
}

99.9%{
display: block;
left: -35px;
top: 65px;
transform: rotate(45deg) scale(0);
}
}

.titleLinks{
	color: #4f9c97;
}

.titleLinks:hover {
	color: rgb(53, 105, 91);
}
</style>


<script>
	$(function() {
		$(".subsCancel").on("click", function() {
			$("#sb_orderno_seq").val($(this).parent().find("input:nth-child(3)").val());
			$("#cancelConfirm").fadeIn();
		})

		$("#confirm_cancel").on("click", function() {
			$("#sb_orderno_seq").val("");
			$("#cancelConfirm").hide();
		})

		$("#confirm_yes").on("click", function() {
			var ok = confirm("구독을 취소합니다.");
			if (ok) {
				$("#cancelForm").submit();
			} else {
				$("#cancelConfirm").hide();
				$("#sb_orderno_seq").val("");
			}
		})
		
		$(".durBtns").on("click",function(){
			if($(this).val()=="전체"){
				$(location).attr("href","subsList");
			}else{
				$(location).attr("href","subsSearch?sb_statement="+$(this).val());
			}
		})
		
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
						class="list-group-item list-group-item-action">Overview</a> <a
						href="/mypageInfo" class="list-group-item list-group-item-action">내
						정보 수정</a> <a href="orderList"
						class="list-group-item list-group-item-action">구매 내역</a> <a
						href="subsList"
						class="list-group-item list-group-item-action currentActive">정기
						구독</a>
					<c:if test="${grade == 'admin'}">
						<a href="productsAdd"
							class="list-group-item list-group-item-action">상품 등록</a>
							<a href="chatManage" class="list-group-item list-group-item-action">채팅 문의 관리</a>
					</c:if>
					<a href="/mypageDelete"
						class="list-group-item list-group-item-action">탈퇴하기</a>
				</div>
			</div>


			<div class="col-lg-9 col-md-8 col-sm-12 col-xs-12 pt-5 pb-5 my">
				<div class="row my">
					<div class="common-container-right-section col-12">

						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active" href="#">구독
									내역</a></li>
						</ul>
						<div class="orderWrapper">
							<div id="listSearchBox">
								<form action="orderSearch" id="orderSearch" method="post">
									<span id="orderDuration" class="mr-2">현황 별 조회 : </span> 
									<span>
										<input type="button" value="구독중" id="onGoing"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="구독 취소" id="onCancel"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="입금 대기" id="onWait"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="주문 만료" id="onExpired"
										class="btn btn-outline-secondary durBtns"> <input
										type="button" value="전체" id="all"
										class="btn btn-outline-secondary durBtns">
									</span>
								</form>
							</div>

							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="list_table_style">
								<thead class="bottom_line">
									<tr>
										<th width="60">상품 번호</th>
										<th width="70">구독 상품</th>
										<th width="70">배송 시작일</th>
										<th width="70">배송 주기</th>
										<th width="70">주문 금액</th>
										<th width="90" class="goods_delivery_info pr-1">구독 현황</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test='${list=="[]"}'>
											<tr>
												<td class="td_bottom_line" align="center" colspan="9"
													height="80" id="empty">구독 내역이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<form action="subsCancel" method="post" id="cancelForm">
												<c:forEach var="dto" items="${list}">

													<tr class="pt-3 pb-3 orderLists bottom_line">
														<td class="cell">${dto.sb_orderno_seq }</td>
														<td class="cell">
															<table width="100%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td valign="middle">
																		<div class="goods_name">
																			<a href="subscription" class="titleLinks"><strong>${dto.sb_category }</strong> 
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
														<td class="cell pr-1"><fmt:formatNumber
																value="${dto.sb_price }" type="number" />원</td>
														<c:choose>
															<c:when test="${dto.sb_statement =='구독중'}">
																<td class="cell"><span class="mr-1">${dto.sb_statement }</span><input
																	type="button" value="구독취소"
																	class="subsCancel btn btn-dark"><input type="hidden" value="${dto.sb_orderno_seq }"></td>
															</c:when>
															<c:when test="${dto.sb_statement =='입금 대기'}">
																<td class="cell"><span class="mr-1"
																	style="color: dodgerblue;">${dto.sb_statement }</span></td>
															</c:when>
															<c:when
																test="${dto.sb_statement =='구독 취소'||dto.sb_statement =='주문 만료'}">
																<td class="cell"><span class="mr-1"
																	style="color: red;">${dto.sb_statement }</span></td>
															</c:when>
															<c:otherwise>
																<td class="cell">${dto.sb_statement }</td>
															</c:otherwise>
														</c:choose>
													</tr>
												</c:forEach>
												<input type="hidden" id="sb_orderno_seq" name="sb_orderno_seq">
											</form>
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
	<div id="cancelConfirm">
		<table width="100%" height="100%" cellpadding="0" cellspacing="0"
			border="0">
			<tr>
				<td align="center" valign="middle" style="padding: 0px 30px;">
					<div
						style="background-color: #ffffff; border-radius: 10px; width: 350px;"
						id="confirmWrapper">
						<div class="emoji  emoji--sad mt-4" id="emoji">
							<div class="emoji__face">
								<div class="emoji__eyebrows"></div>
								<div class="emoji__eyes"></div>
								<div class="emoji__mouth"></div>
							</div>
						</div>
						<div id="confirm_msg" class="p-4">
							정말 구독을 취소하시겠습니까?<br> <span style="font-size: 12px;">(월
								단위로 결제가 진행되며, 결제가 이미 완료된 경우 해당하는 달의 배송은 완료됩니다.)</span>
						</div>
						<div>
							<div id="confirm_cancel">계속 구독하기</div>
							<div id="confirm_yes">구독 취소하기</div>
							<div style="clear: both;"></div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp" />
</body>
</html>