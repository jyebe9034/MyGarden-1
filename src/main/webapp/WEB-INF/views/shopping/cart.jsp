<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"
	xmlns:fb="http://ogp.me/ns/fb#" xmlns:og="http://ogp.me/ns#">
<head>
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<title>나의 정원 - 장바구니</title>
<style>
#header_v5_wrap_height {
	height: 190px;
}

button.btn_select_all, button.btn_select_del {
	border: 0
}

.body_sub_area {
	width: 70%;
	margin: auto;
}

.body_sub_area table {
	font-size: 12px;
}

.body_sub_area table th {
	font-size: 13px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.cart_list_table {
	font-family: 'Spoqa Han Sans', sans-serif;
	margin-bottom: 15px;
}

.cart_list_table tr th {
	border-top: 2px solid #44b27d;
	border-bottom: 1px solid #dddddd;
	font-size: 15px;
	font-weight: normal;
	color: #515151;
}

.cart_list_table tr td {
	padding: 5px 0;
}

.cart_list_table .td_bottom_line {
	border-bottom: 1px solid #dddddd;
}

.td_bottom_line {
	font-family: 'Spoqa Han Sans', sans-serif;
	font-size: 15px;
	font-weight: 600;
}

#cartStyle {
	font-size: 25px;
	color: #044437;
	font-weight: 500;
	font-family: 'Spoqa Han Sans', sans-serif;
	margin-top: 30px;
}

#selectAll {
	display: inline-block;
	padding: 8px 13px;
	font-size: 13px;
	color: #818181;
	text-align: center;
	vertical-align: middle;
	border: 1px solid #afafaf;
	cursor: pointer;
}

#selectDel {
	display: inline-block;
	padding: 8px 13px;
	font-size: 13px;
	color: #818181;
	text-align: center;
	vertical-align: middle;
	border: 1px solid #afafaf;
	cursor: pointer;
}

#selectDel:hover{
	background-color:#dddddd;
}

#selectAll:hover{
	background-color:#dddddd;
}

#totalPrice {
	font-size: 18px;
	color: #757575;
}

.totalprice {
	margin-left: 15px;
	font-size: 24px;
	font-weight: bold;
	color: #44b27d;
}

#won {
	font-family: 'Spoqa Han Sans', sans-serif;
	font-size: 18px;
	color: #757575;
}

#buyAll, #buySelect, #keepShopping {
	margin-bottom: 10px;
}

#buyAll {
	width: 180px;
	text-align: center;
	display: inline-block;
	padding: 15px 0px;
	font-size: 16px;
	background-color: #44b27d;
	border: 1px solid #559c75;
	color: #ffffff;
	margin-left: 3px;
	cursor: pointer;
}

#buySelect {
	width: 180px;
	text-align: center;
	display: inline-block;
	padding: 15px 0px;
	font-size: 16px;
	background-color: #515151;
	border: 1px solid #515151;
	color: #ffffff;
	margin-left: 3px;
	cursor: pointer;
}

#keepShopping {
	width: 180px;
	text-align: center;
	display: inline-block;
	padding: 15px 0px;
	font-size: 16px;
	background-color: #ffffff;
	border: 1px solid #515151;
	color: #515151;
	margin-left: 3px;
	cursor: pointer;
}

#remove_cart_confirm {
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
	float: left;
	width: 49%;
	font-size: 14px;
	color: #818181;
	padding: 18px 0px;
	cursor: pointer;
}

#confirm_del {
	float: left;
	width: 49%;
	font-size: 14px;
	color: #818181;
	padding: 18px 0px;
	cursor: pointer;
	border-left: 1px solid #eaeaea;
}

#confirm_msg {
	padding: 30px 0px;
	border-bottom: 1px solid #eaeaea;
	font-size: 14px;
	font-weight: bold;
	font-family: 'Spoqa Han Sans', sans-serif;
}

.choice_ea {
	display: table-cell;
	width: 30px;
	height: 30px;
	text-align: center;
	vertical-align: middle;
	font-family: 'Spoqa Han Sans', sans-serif;
	font-weight: 500;
	font-size: 15px;
	border-top: 1px solid #dedede;
	border-bottom: 1px solid #dedede;
}

.goods_title {
	font-family: 'Spoqa Han Sans', sans-serif;
	font-size: 16px;
	font-weight: 500;
	color: #515151;
	letter-spacing: -1px;
}

.goods_price {
	font-family: 'Spoqa Han Sans', sans-serif;
	font-size: 15px;
	font-weight: 600;
}

.goodsImg {
	width: 75px;
	height: 75px;
	border-radius: 20px;
	margin-top: 10px;
	margin-bottom: 15px;
	padding: 0px;
}

.updown {
	margin-bottom: 5px;
}

.goodsMenu {
	text-align: center;
}

.goodsName {
	width: 80%;
	font-size : 14px;
}

.nameWrapper {
	line-height: 90px;
	text-align: center;
}

.goodsCheckbox {
	margin-top: 40px;
}

.menu {
	text-align: center;
}

.titleWrapper {
	padding-right: 0px;
}
</style>
<script>
	$(function() {

		var totalWon = $("#totalWon").html();
		$("#totalWon").html(totalWon.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		
		$("#selectAll").on("click", function() {
			if ($(".goodsCheckbox").prop("checked")) {
				$(".goodsCheckbox").prop("checked", false);
				$("#totalWon").html(0);
				$("#totalWonPrice").val(0);
			} else {
				$(".goodsCheckbox").prop("checked", true);
				$("#totalWon").html(totalWon.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				$("#totalWonPrice").val(totalWon);
			}
		});

		$(".goodsCheckbox").on(
				"change",
				function() {
					if ($(this).prop("checked")) {
						var total = parseInt($("#totalWonPrice").val());
						var price = $(this).parent().parent().find(
								"div:nth-child(10)").find("input:nth-child(2)")
								.val();
						$("#totalWon").html(
								(total + parseInt(price)).toString().replace(
										/\B(?=(\d{3})+(?!\d))/g, ","));
						$("#totalWonPrice").val(total + parseInt(price));
					} else {
						var total = $("#totalWonPrice").val();
						var price = $(this).parent().parent().find(
								"div:nth-child(10)").find("input:nth-child(2)")
								.val();
						$("#totalWon").html(
								(total - price).toString().replace(
										/\B(?=(\d{3})+(?!\d))/g, ","));
						$("#totalWonPrice").val(total - parseInt(price));
					}
				})

		$(".btn_select_del").on("click", function() {
			$("#remove_cart_confirm").fadeIn();
		});

		$("#confirm_del").on(
				"click",
				function() {
					$('.goodsCheckbox').each(
							function() {
								if ($(this).prop("checked")) {
									$.ajax({
										url : "cartDel",
										type : "post",
										data : {
											c_p_no : $(this).parent().find(
													"input:nth-child(1)").val()
										}
									})
								}
							});
					$(location).attr("href", "cart");
				})

		// 선택 주문
		$("#buySelect").on(
				"click",
				function() {
					if(${loginId==null} || ${loginName==null}){
						alert("로그인이 필요한 메뉴입니다.")
						$(location).attr("href","/login");
					}else{
					var checked = 0;
					$(".goodsCheckbox").each(function() {
						if ($(this).prop("checked")) {
							checked++;
						}
					});
					if (checked == 0) {
						alert("선택된 상품이 없습니다.");
					} else {

						var jArray = new Array();
						//JsonArray를 위한 배열생성
						$(".products").each(
								function() {
									if ($(this).find("div:nth-child(1)").find(
											"div:nth-child(2)").find(
											"input:nth-child(2)").prop(
											"checked")) {
										var jobj = new Object();
										//JsonObject를 위한 객체생성

										jobj.c_p_no = $(this).find(
												"div:nth-child(1)").find(
												"div:nth-child(1)").find(
												"input:nth-child(1)").val();
										jobj.c_p_title = $(this).find(
												"div:nth-child(1)").find(
												"div:nth-child(1)").find(
												"input:nth-child(2)").val();
										jobj.c_p_price = $(this).find(
												"div:nth-child(1)").find(
												"div:nth-child(1)").find(
												"input:nth-child(3)").val();
										jobj.c_p_imagepath = $(this).find(
												"div:nth-child(1)").find(
												"div:nth-child(1)").find(
												"input:nth-child(4)").val();
										jobj.c_count = $(this).find(
												"div:nth-child(1)").find(
												"div:nth-child(9)").find(
												"table:nth-child(1)").find(
												"tr:nth-child(1)").find(
												"td:nth-child(1)").find(
												"div:nth-child(1)").html();
										jArray.push(jobj);
									}
								});
						var stringJson = JSON.stringify(jArray);

						$("#productList").val(stringJson);
						$("#cartForm").submit();
					}
				}
				});

		// 전체 주문
		$("#buyAll").on(
				"click",
				function() {
					if(${loginId==null}){
						alert("로그인이 필요한 메뉴입니다.")
						$(location).attr("href","/login");
					}else{
					$(".goodsCheckbox").prop("checked", true);
					var checked = 0;
					$(".goodsCheckbox").each(function() {
						if ($(this).prop("checked")) {
							checked++;
						}
					});
					if (checked == 0) {
						alert("장바구니에 담긴 상품이 상품이 없습니다.");
					} else {
					var jArray = new Array();
					//JsonArray를 위한 배열생성

					$('.products').each(
							function() {
								var jobj = new Object();
								//JsonObject를 위한 객체생성

								jobj.c_p_no = $(this).find("div:nth-child(1)")
										.find("div:nth-child(1)").find(
												"input:nth-child(1)").val();
								jobj.c_p_title = $(this).find(
										"div:nth-child(1)").find(
										"div:nth-child(1)").find(
										"input:nth-child(2)").val();
								jobj.c_p_price = $(this).find(
										"div:nth-child(1)").find(
										"div:nth-child(1)").find(
										"input:nth-child(3)").val();
								jobj.c_p_imagepath = $(this).find(
										"div:nth-child(1)").find(
										"div:nth-child(1)").find(
										"input:nth-child(4)").val();
								jobj.c_count = $(this).find("div:nth-child(1)")
										.find("div:nth-child(9)").find(
												"table:nth-child(1)").find(
												"tr:nth-child(1)").find(
												"td:nth-child(1)").find(
												"div:nth-child(1)").html();
								jArray.push(jobj);
							});
					var stringJson = JSON.stringify(jArray);

					$("#productList").val(stringJson);
					$("#cartForm").submit();
					}
				}
				});
		
		$("#keepShopping").on("click", function() {
			$(location).attr("href", "productsList")
		})
		
		$(".up")
				.on(
						"click",
						function() {
							var count = parseInt($(this).parent().parent()
									.find("td:nth-child(1)").find(
											"div:nth-child(1)").html());
							if (count < 10) {
								var price = parseInt($(this).parent().find(
										"input:nth-child(1)").val());
								var totalWon = parseInt($("#totalWonPrice")
										.val());
								$(this).parent().parent().find(
										"td:nth-child(1)").find(
										"div:nth-child(1)").html(
										parseInt(count) + 1);

								$(this)
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.find("div:nth-child(10)")
										.find("span:nth-child(1)")
										.html(
												((count + 1) * price)
														.toString()
														.replace(
																/\B(?=(\d{3})+(?!\d))/g,
																","));

								$(this).parent().parent().parent().parent()
										.parent().parent().find(
												"div:nth-child(10)").find(
												"input:nth-child(2)").val(
												(count + 1) * price);

								if ($(this).parent().parent().parent().parent()
										.parent().parent().find(
												"div:nth-child(2)").find(
												"input:nth-child(2)").prop(
												"checked")) {
									$("#totalWon")
											.html(
													(totalWon + price)
															.toString()
															.replace(
																	/\B(?=(\d{3})+(?!\d))/g,
																	","));
									$("#totalWonPrice").val(totalWon + price);
								}
							}
						})
		$(".down")
				.on(
						"click",
						function() {
							var count = $(this).parent().parent().find(
									"td:nth-child(1)").find("div:nth-child(1)")
									.html();
							if (count > 1) {
								var price = parseInt($(this).parent().find(
										"input:nth-child(1)").val());
								var totalWon = parseInt($("#totalWonPrice")
										.val());
								$(this).parent().parent().find(
										"td:nth-child(1)").find(
										"div:nth-child(1)").html(
										parseInt(count) - 1);
								$(this)
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.parent()
										.find("div:nth-child(10)")
										.find("span:nth-child(1)")
										.html(
												((count - 1) * price)
														.toString()
														.replace(
																/\B(?=(\d{3})+(?!\d))/g,
																","));
								$(this).parent().parent().parent().parent()
										.parent().parent().find(
												"div:nth-child(10)").find(
												"input:nth-child(2)").val(
												(count - 1) * price);

								if ($(this).parent().parent().parent().parent()
										.parent().parent().find(
												"div:nth-child(2)").find(
												"input:nth-child(2)").prop(
												"checked")) {
									$("#totalWon")
											.html(
													(totalWon - price)
															.toString()
															.replace(
																	/\B(?=(\d{3})+(?!\d))/g,
																	","));
									$("#totalWonPrice").val(totalWon - price);
								}
							}
						})

	});
</script>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>

	<div id="header_v5_wrap_height"></div>
	<div class="body_area" style="width: 100%; margin: auto;">
		<div class="body_sub_area" style="background-color: #ffffff">

			<br style="line-height: 30px;" />

			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="40"></td>
					<td>

						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td align="left"><h1 id="cartStyle">장바구니</h1></td>
							</tr>
							<tr>
								<td height="20"></td>
							</tr>
						</table>
						<form id="cartForm" method="post" action="order">
							<!-- Button -->
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<div id="selectAll" class="btn_select_all">전체선택</div>

										<div id="selectDel" class="btn_select_del">선택삭제</div>
									</td>
								</tr>
							</table>
							<!-- /Button -->

							<br style="line-height: 8px;" />

							<!-- Cart List -->
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="cart_list_table">
								<thead>
									<tr>
										<th width="100%">
											<div class="row">
												<div class="col-lg-1 col-4 menu">선택</div>
												<div class="col-lg-3 col-8 menu">주문 상품</div>
												<div class="col-2 menu d-lg-block d-none">상품 가격</div>
												<div class="col-2 menu d-lg-block d-none">수량</div>
												<div class="col-2 menu d-lg-block d-none">주문 금액</div>
												<div class="col-2 menu d-lg-block d-none">배송비</div>
											</div>
										</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test='${list=="[]"||list==null}'>
											<tr>
												<td class="td_bottom_line" align="center" colspan="9"
													height="80">장바구니에 담긴 상품이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="dto" items="${list}">
												<c:set var="count"
													value="${count + dto.c_p_price*dto.c_count}" />
												<tr>
													<td width="100%" class="products">
														<div class="row">
															<div>
																<input type="hidden" value="${dto.c_p_no }"> <input
																	type="hidden" value="${dto.c_p_title }"> <input
																	type="hidden" value="${dto.c_p_price }"> <input
																	type="hidden" value="${dto.c_p_imagepath }">
															</div>
															<div class="col-lg-1 col-4 td_bottom_line nameWrapper">
																<input type="hidden" value="${dto.c_p_no }"> <input
																	type="checkbox" class="goodsCheckbox" checked>
															</div>
															<div class="col-lg-3 col-8 td_bottom_line titleWrapper">
																<div class="row">
																	<div class="col-4">
																		<img class="goodsImg"
																			src="${dto.c_p_imagepath }">
																	</div>
																	<div class="col-6 nameWrapper ml-3" align="left">
																		<span class="goodsName">${dto.c_p_title }</span>
																	</div>
																</div>
															</div>

															<div class="col-3 menu d-lg-none d-block mt-2">상품
																가격</div>
															<div class="col-3 menu d-lg-none d-block mt-2">수량</div>
															<div class="col-3 menu d-lg-none d-block mt-2">주문
																금액</div>
															<div class="col-3 menu d-lg-none d-block mt-2">배송비</div>

															<div class="col-lg-2 col-3 td_bottom_line nameWrapper">
																<span class="goods_price"> <fmt:formatNumber
																		value="${dto.c_p_price }" type="number" /></span> 원
															</div>
															<div class="col-lg-2 col-3 td_bottom_line mt-1">
																<table align="center" cellpadding="0" cellspacing="0"
																	border="0">
																	<tr>
																		<td>
																			<div class="choice_ea ">${dto.c_count }</div>
																		</td>
																		<td width="10"></td>
																		<td><input type="hidden"
																			value="${dto.c_p_price }"> <input
																			type="button" value="▲"
																			class="btn btn-light updown up"><br> <input
																			type="button" value="▼"
																			class="btn btn-light updown down"></td>
																	</tr>
																</table>
															</div>
															<div class="col-lg-2 col-3 td_bottom_line nameWrapper">
																<span><fmt:formatNumber
																		value="${dto.c_p_price*dto.c_count }" type="number" /></span>
																원 <input type="hidden"
																	value="${dto.c_p_price*dto.c_count }">
															</div>
															<div class="col-lg-2 col-3 td_bottom_line nameWrapper">0원</div>
														</div> <input type="hidden" name="productList" id="productList">

													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</form> <c:choose>
							<c:when test='${list=="[]"}'>
								<div style="text-align: right; font-weight: bold">
									<span id="totalPrice">총 주문금액</span> <span class="totalprice"
										id="totalWon">0</span> <span id="won">원</span>
								</div>
							</c:when>
							<c:otherwise>
								<div style="text-align: right; font-weight: bold">
									<span id="totalPrice">총 주문금액</span> <span class="totalprice"
										id="totalWon">${count }</span><input type="hidden" value="${count }"
										id="totalWonPrice"> <span id="won">원</span>
								</div>
							</c:otherwise>
						</c:choose>
						<div style="height: 40px"></div>

						<div style="text-align: right">
							<span id="buyAll"> 전체상품 주문하기 </span> <span id="buySelect">
								선택상품 주문하기 </span> <span id="keepShopping"> 계속 쇼핑하기 </span>
						</div>
					</td>
					<td width="40"></td>
				</tr>

			</table>
			<br style="line-height: 30px;" />
			<div id="optional_changes_dialog" style="display: none;"></div>
			<div id="remove_cart_confirm">
				<table width="100%" height="100%" cellpadding="0" cellspacing="0"
					border="0">
					<tr>
						<td align="center" valign="middle" style="padding: 0px 30px;">
							<div
								style="background-color: #ffffff; border-radius: 10px; width: 350px;">
								<div id="confirm_msg">상품을 삭제하시겠습니까?</div>
								<div>
									<div id="confirm_cancel"
										onclick="javascript:$('#remove_cart_confirm').hide();">취소</div>
									<div id="confirm_del">삭제</div>
									<div style="clear: both;"></div>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>
</body>
</html>