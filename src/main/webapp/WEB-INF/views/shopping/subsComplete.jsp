<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>나의 정원 - 주문 완료</title>
<style type="text/css">
#header_v5_wrap {
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 185px;
	z-index: 1000;
}

.body_sub_area {
	width: 1160px;
	margin: auto;
}

.body_sub_area table {
	font-size: 14px;
}

.body_sub_area table th {
	font-size: 15px;
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>

<script>
	$(function() {
		console.log("cute");

	});
</script>
</head>

<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	<br style="line-height: 200px;" />
	<div id="header_v5_wrap_height"></div>
	<!-- // 전체헤더 -->

	<div class="clearbox">
		<div class="body_area" style="width: 100%; margin: auto;">
			<div class="body_sub_area" style="background-color: #ffffff">

				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="30"></td>
					</tr>
					<tr>
						<td width="40"></td>
						<td>

							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="20" align="center"><img
										src="/resources/img/foodMarket.png" id="orderImg"
										style="width: 300px;"></td>
								</tr>

								<tr>
									<td align="center"><h1 style="font-size: 32px;">주문완료</h1></td>
								</tr>



								<tr>
									<td height="10"></td>
								</tr>
							</table> <!-- Thank you 이미지 -->
							<div align="center"
								style="padding: 20px 0 20px 0; font-size: 18px; color: #000000;"
								class="desc">
								감사합니다. <strong>${loginName }</strong>님의 주문이 정상적으로 처리되었습니다.
							</div> <!-- List -->

							<div align="center"
								style="padding: 50px 0 30px 0; font-size: 18px; color: #000000;"
								class="desc"></div>

							<div
								style="padding-bottom: 20px; font-weight: bold; font-size: 20px;">상품정보</div>
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="list_table_style">
								<thead>
									<tr>
										<th class="pl-2">정기 구독 상품</th>
										<th width="100">구독 주기</th>
										<th width="90">구독 금액</th>

										<th width="100" class="hide">적립</th>
										<th width="90" class="goods_delivery_info hide">배송비</th>
									</tr>
								</thead>
								<tbody>
										<tr>
											<td class="cell left rline">
												<table width="100%" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td class="left" valign="middle">
															<div class="goods_name" style="margin-left: 10px;">
																<strong><a href="subscription">${subsDTO.sb_category }
																	</a></strong>
															</div>
														</td>
													</tr>
												</table>
											</td>
											<td class="cell rline">${subsDTO.sb_period }</td>
											<td class="cell right"><fmt:formatNumber
														value="${subsDTO.sb_price }" type="number" /></td>
											<td class="cell right"><fmt:formatNumber
														value="${subsDTO.sb_price*0.05 }" type="number" /></td>
											<td class="cell right">무료배송</td>
										</tr>

								</tbody>
							</table>
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								style="border-bottom: 2px solid #dedede" class="hide">
								<tr>
									<td height="34" align="right" style="padding: 0 5px;"><span
										class="goods_delivery_info"> <b>기본배송비 : 0원</b>
									</span></td>
								</tr>
							</table> <br style="line-height: 40px;" /> <!-- 최종결제금액 -->
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td valign="bottom" align="left" height="25"
										style="font-weight: bold;">최종결제금액</td>
								</tr>
								<tr>
									<td height="8"></td>
								</tr>
								<tr>
									<td height="2" bgcolor="545454"></td>
								</tr>
							</table>

							<table width="100%" border="0" cellpadding="10" cellspacing="0">
								<col />
								<col width="300" />
								<tr>
									<td valign="top" style="padding: 10px;">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="fx12">
											<col width="50%" />
											<col />
											<tr>
												<td>총 상품금액</td>
												<td align="right" class="fx12"><fmt:formatNumber
														value="${subsDTO.sb_price }" type="number" /> 원</td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td>총 배송비 <img src="/resources/products/plane.png"
													class="productsImg" width="15px" height="15px">
												</td>
												<td align="right" class="fx12">0 원</td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td>총 적립금</td>
												<td align="right" class="fx12"><fmt:formatNumber
														value="${subsDTO.sb_price*0.05 }" type="number" /> 원</td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td><span class="fx14 bold">총 결제금액</span></td>
												<td align="right"><strong
													class="settle_price fx20 bold tahoma"><fmt:formatNumber
														value="${subsDTO.sb_price }" type="number" /></strong> <span
													class="fx12 bold">원</span></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>

							<div style="height: 60px"></div>

							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td valign="bottom" align="left" height="25"
										style="font-weight: bold;">주문배송</td>
								</tr>
								<tr>
									<td height="8"></td>
								</tr>
								<tr>
									<td height="2" bgcolor="545454"></td>
								</tr>
								<tr>
									<td height="23"></td>
								</tr>
							</table>

							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<col width="150" />
								<tr>
									<td>받는사람</td>
									<td class="fx12">${loginDTO.m_name }</td>
								</tr>
								<tr>
									<td height="15"></td>
								</tr>
								<tr>
									<td>연락처</td>
									<td class="fx12">${loginDTO.m_phone }</td>
								</tr>
								<tr>
									<td height="15"></td>
								</tr>
								<tr class="goods_delivery_info">
									<td>주소</td>
									<td class="fx12"><span style="font-weight: bold;">(지번
											주소)</span> ${loginDTO.m_zipcode } ${loginDTO.m_address1 }
										${loginDTO.m_address2 }</td>
								</tr>
								<tr class="goods_delivery_info">
									<td height="15"></td>
								</tr>
								<tr class="goods_delivery_info">
									<td>배송구분</td>
									<td class="fx12">택배비 무료</td>
								</tr>
								<tr class="goods_delivery_info">
									<td height="15"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td class="fx12">${loginDTO.m_email }</td>
								</tr>
								<tr>
									<td height="15"></td>
								</tr>
								<tr class="goods_delivery_info">
									<td>배송 상품</td>
									<td class="fx12">${subsDTO.sb_category }</td>
								</tr>
								<tr class="goods_delivery_info">
									<td height="20px;"></td>
									<td></td>
								</tr>
							</table> <!-- 단일배송지 : 끝 -->

							<div style="height: 40px"></div> <!-- 결제정보 -->
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<!-- 결제정보 -->
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td valign="bottom" align="left" height="25"
													style="font-weight: bold;">결제정보</td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td height="2" bgcolor="545454"></td>
											</tr>
											<tr>
												<td height="23"></td>
											</tr>
										</table>

										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<col width="150" />
											<tr>
												<td>배송 시작일</td>
												<td class="fx12">${subsDTO.sb_startday }</td>
											</tr>
											<tr>
												<td height="15"></td>
											</tr>
											<tr>
												<td>결제방식</td>
												<td class="fx12">${subsDTO.sb_paymethod }</td>
											</tr>
											<c:if test="${subsDTO.sb_paymethod=='무통장 입금'}">
												<tr>
													<td height="15"></td>
												</tr>
												<tr>
													<td>입금계좌</td>
													<td class="fx12">신한은행 110-355-650040</td>
												</tr>
											</c:if>
											<tr>
												<td height="15"></td>
											</tr>
											<tr>
												<td>정기 결제금액</td>
												<td class="fx12"><font color="black"><strong><fmt:formatNumber
														value="${subsDTO.sb_price }" type="number" /> 원</strong></font></td>
											</tr>
											<tr>
												<td height="15"></td>
											</tr>
										</table>

									</td>
								</tr>
							</table> <!-- 주의사항 -->
							<div style="height: 60px"></div>
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<!-- 결제정보 -->
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td valign="bottom" align="left" height="25"
													style="font-weight: bold;">* 주의사항</td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td height="2" bgcolor="545454"></td>
											</tr>
											<tr>
												<td height="23"></td>
											</tr>
										</table>
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<col width="150" />
											<tr>
												<td class="fx12">제주도/산간지역</td>
												<td class="fx12">배송받으시는 지역이나 공휴일 등의 사정에 따라 배송받으실 일정이
													변경될 수 있습니다.</td>
											</tr>
											<tr>
												<td height="15"></td>
											</tr>
											<tr>
												<td class="fx12">가상계좌(무통장입금)</td>
												<td class="fx12">무통장입금의 경우 기한내에 입금하셔야 하며, 이후 입금되지 않은
													주문은 자동으로 취소됩니다.</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>

							<div style="height: 60px"></div> <!-- 주의 -->
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="20"></td>
								</tr>
								<tr>
									<td valign="top" class="hide">
										<div style="padding-bottom: 12px;"></div>
										<table width="100%" border="0" cellpadding="0" cellspacing="3">
											<col width="10" />
											<tr>
												<td valign="top"><span
													style="font-family: 'arial black'; line-height: 10px;">·</span></td>
												<td class="desc">비회원 주문의 경우, 주문번호로 주문이 조회되오니 주문번호를 꼭
													기억하세요.</td>
											</tr>
											<tr>
												<td valign="top"><span
													style="font-family: 'arial black'; line-height: 10px;">·</span></td>
												<td class="desc">무통장입금의 경우, <font color="black">2일
														이내</font>로 입금 하셔야 하며 이후 입금되지 않은 주문은 자동으로 취소됩니다.
												</td>
											</tr>
											<tr>
												<td valign="top"><span
													style="font-family: 'arial black'; line-height: 10px;">·</span></td>
												<td class="desc" style="letter-spacing: -1.5px;">배송은
													결제완료 후 지역에 따라 1~7일 가량 소요됩니다. 상품별 자세한 배송과정은 주문조회를 통하여 조회하실 수
													있습니다.</td>
											</tr>
											<tr>
												<td valign="top"><span
													style="font-family: 'arial black'; line-height: 10px;">·</span></td>
												<td class="desc">주문의 취소 및 환불, 교환에 관한 사항은 이용안내의 내용을 참고해
													주세요.</td>
											</tr>
										</table>
									</td>
									<td width="300" align="right"><a href="productsList"
										id="keepShopping"
										style="color: #fff; font-size: 14px; text-align: center;"><div
												style="width: 138px; height: 45px; background: #aaafaf; display: table-cell; vertical-align: middle;">쇼핑
												계속하기</div></a> <a href="subsList" id="orderList"
										style="color: #fff; font-size: 14px; text-align: center;"><div
												style="width: 138px; height: 45px; background: #636666; display: table-cell; vertical-align: middle;">구독 내역</div></a></td>
								</tr>

							</table> <!-- 본문내용 끝 -->
						</td>
						<td width="40"></td>
					</tr>
				</table>

				<div align="center"
					style="padding: 50px 0 30px 0; font-size: 18px; color: #000000;"
					class="desc"></div>

			</div>
		</div>
	</div>
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>
</body>
</html>

