<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"
	xmlns:fb="http://ogp.me/ns/fb#" xmlns:og="http://ogp.me/ns#">
<head>
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<title>My Garden - 장바구니</title>
<style>
#header_v5_wrap_height {
	height: 190px;
}
button.btn_select_all, button.btn_select_del, button.btn_select_wishlist
	{
	border: 0
}
.body_sub_area {
	width: 1160px;
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
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>

	<div id="header_v5_wrap_height"></div>
	<div class="clearbox">
		<div class="body_area" style="width: 100%; margin: auto;">
			<div class="body_sub_area" style="background-color: #ffffff">

				<br style="line-height: 30px;" />

				<form name="orderFrm" id="orderFrm" method="post" action="cacluate"
					target="actionFrame"></form>

				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="40"></td>
						<td>

							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="30"></td>
								</tr>
								<tr>
									<td align="left"><h1
											style="font-size: 25px; color: #044437; font-weight: 500; font-family: 'Spoqa Han Sans', sans-serif;">장바구니</h1></td>
								</tr>
								<tr>
									<td height="20"></td>
								</tr>
							</table> <!-- <div style="height:30px;"></div> -->

							<form name="cart_form" id="cart_form" method="post"
								target="actionFrame" action="order">
								<input type="hidden" name="cart_version" value='2' />

								<!-- Button -->
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<div
												style="display: inline-block; padding: 10px 15px; font-size: 12px; color: #818181; text-align: center; vertical-align: middle; border: 1px solid #afafaf; cursor: pointer;"
												class="btn_select_all">전체선택</div>

											<div
												style="display: inline-block; padding: 10px 15px; font-size: 12px; color: #818181; text-align: center; vertical-align: middle; border: 1px solid #afafaf; cursor: pointer;"
												class="btn_select_del">선택삭제</div>
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
											<th width="40">선택</th>
											<th>주문상품</th>
											<th width="100">상품가격</th>
											<th width="200">수량</th>
											<th width="300">수령일</th>
											<th width="100">주문금액</th>
											<th width="100">배송비</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="td_bottom_line" align="center" colspan="9"
												height="80">장바구니에 담긴 상품이 없습니다.</td>
										</tr>
									</tbody>
								</table>
							</form>

							<div style="text-align: right; font-weight: bold">
								<span
									style="font-family: 'Spoqa Han Sans', sans-serif; font-size: 18px; color: #757575;">총
									주문금액</span> <span class="totalprice"
									style="margin-left: 15px; font-family: 'Spoqa Han Sans', sans-serif; font-size: 24px; font-weight: bold; color: #44b27d;">0</span>
								<span
									style="font-family: 'Spoqa Han Sans', sans-serif; font-size: 18px; color: #757575;">원</span>
							</div>

							<div style="height: 40px"></div>

							<div style="text-align: right">
								<span class="btn_all_order">
									<div
										style="width: 180px; text-align: center; font-family: 'Spoqa Han Sans', sans-serif; display: inline-block; padding: 15px 0px; font-size: 16px; background-color: #44b27d; border: 1px solid #559c75; color: #ffffff; text-align: center; margin-left: 3px; cursor: pointer;">전체상품
										주문하기</div>
								</span> <span class="btn_selected_order">
									<div
										style="width: 180px; text-align: center; font-family: 'Spoqa Han Sans', sans-serif; display: inline-block; padding: 15px 0px; font-size: 16px; background-color: #515151; border: 1px solid #515151; color: #ffffff; text-align: center; margin-left: 3px; cursor: pointer;">선택상품
										주문하기</div>
								</span> <span>
									<div
										style="width: 180px; text-align: center; font-family: 'Spoqa Han Sans', sans-serif; display: inline-block; padding: 15px 0px; font-size: 16px; background-color: #ffffff; border: 1px solid #515151; color: #515151; text-align: center; margin-left: 3px; cursor: pointer;"
										onclick="document.location.href='/';">계속 쇼핑하기</div>
								</span>
							</div>
						</td>
						<td width="40"></td>
					</tr>
				</table>
				<br style="line-height: 30px;" />
				<div id="optional_changes_dialog" style="display: none;"></div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>
</body>
</html>