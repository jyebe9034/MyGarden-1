<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
   type="text/javascript"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>나의 정원 - 주문</title>
<style>
#header_v5_wrap_height {
   height: 200px;
}

.goods_name {
   line-height: 15px;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
   -o-text-overflow: ellipsis;
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
   font-size: 14px;
}

.body_sub_area table th {
   padding-top: 3px;
   padding-bottom: 3px;
}

#pay {
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

table.list_table_style {
   border: 0px;
   border-top: 2px solid #559c75;
}

table.list_table_style thead th {
   font-size: 15px;
   height: 35px;
   border-right: 0px;
   border-left: 0px;
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
   height: 100%;
   margin-top : 5px;
   margin-bottom : 5px;
}
</style>

<script>

	$(function() {
		var orderer = $("#order_user_name").val();
		var phone = "${loginDTO.m_phone}".split("-");
		$("#phone1").val(phone[0]);
		$("#phone2").val(phone[1]);
		$("#phone3").val(phone[2]);

		$("#copy_order_info").on("change", function() {
			if ($(this).prop("checked")) {
				$("#recipient_user_name").val(orderer);
				$("#recvPhone1").val(phone[0]);
				$("#recvPhone2").val(phone[1]);
				$("#recvPhone3").val(phone[2]);
			} else {
				$("#recipient_user_name").val("");
				$("#recvPhone1").val("");
				$("#recvPhone2").val("");
				$("#recvPhone3").val("");
			}

		})
		
		$("#newAddr").on("click",function(){
			$("#zipcode").val("");
			$("#address1").val("");
			$("#address2").val("");
		})
		
		$("#memAddr").on("click",function(){
			$("#zipcode").val("${loginDTO.m_zipcode}");
			$("#address1").val("${loginDTO.m_address1}");
			$("#address2").val("${loginDTO.m_address2}");
			console.log("${loginDTO.m_address2}");
		})

	});
</script>

</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>

	<div id="header_v5_wrap_height"></div>
	<!-- // 전체헤더 -->

	<div class="clearbox">
		<div class="body_area" style="width: 100%; margin: auto;">
			<div class="body_sub_area" style="background-color: #ffffff">

				<table width="100%" border="0" cellpadding="0" cellspacing="0">

					<tr>
						<td height="60" colspan="3"></td>
					</tr>
					<tr>
						<td width="40"></td>
						<td>
							<!-- 본문내용 시작 --> <!-- 타이틀 -->
							<h2 style="padding-bottom: 10px;">주문상품</h2>

							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="list_table_style">
								<thead>
									<tr class="bottom_line">
										<th>주문상품</th>
										<th width="150">주문일</th>
										<th width="100">수량</th>
										<th width="100">가격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="dto" items="${list}">
										<c:set var="count"
											value="${count + dto.c_p_price*dto.c_count}" />

										<tr class="bottom_line eachOrder">
											<input type="hidden" value="${dto.c_p_no }">
											<input type="hidden" value="${dto.c_p_imagepath }">
											<input type="hidden" value="${dto.c_p_title }">
											<input type="hidden" value="${dto.c_count }">
											<input type="hidden" value="${dto.c_p_price }">
											<td class="cell left">
												<table width="100%" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td class="center" width="60" height="60" valign="middle">
														<img class="orderImg" src="${dto.c_p_imagepath }"
															align="absmiddle"
															style="max-height: 60px; max-width: 60px;" /></td>
														<td class="left" style="padding-left: 10px;">
															<div class="goods_name">
																${dto.c_p_title }
															</div>
															<div class="shipFeeBadge"></div>
														</td>
													</tr>
												</table>
											</td>

											<td class="cell"><span class="goods_input">${orderDate }</span></td>

											<td class="cell">${dto.c_count }</td>
											<td class="cell center"><span><fmt:formatNumber
														value="${dto.c_p_price*dto.c_count }" type="number" /></span>원</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								style="border: 1px solid #dddddd; border-top: 0px"
								class="goods_delivery_info hide">
								<tr class="domestic">
									<td height="34" align="right"
										style="padding: 0 5px; background-color: #f7f7f7"><b>기본배송비
											: <span class="basic_delivery">0</span>원
									</b> <b class="total_add_delivery_lay hide"
										style="padding-left: 20px;">추가배송비 : <span
											class="add_delivery">0</span>원
									</b> <b><span id="shipping_coupon_sale"></span></b> <b><span
											id="shipping_code_sale"></span></b></td>
								</tr>

							</table>
							<div style="height: 10px"></div>

							<table width="100%" border="0" cellpadding="10" cellspacing="0">
								<col />
								<col width="300" />
								<tr>
									<td valign="top" style="display: none;">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											style="padding: 10px;">
											<col width="100" />
											<col width="172" />
											<col />

											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
										</table>
									</td>
									<td valign="top" bgcolor="#878787" style="padding: 10px;">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="white fx12">
											<col width="50%" />
											<col />
											<tr>
												<td>총 상품금액</td>
												<td align="right" class="fx12"><span id="total_price">
														<fmt:formatNumber value="${count }" type="number" />
												</span> 원</td>
											</tr>
											<tr>
												<td height="8"></td>
											</tr>
											<tr class="goods_delivery_info">
												<td>총 배송비</td>
												<td align="right" class="fx12"><span
													class="total_shipping_price">0</span> 원</td>
											</tr>
											<tr class="goods_delivery_info">
												<td>예상 적립금</td>
												<td align="right" class="fx12"><span
													class="total_bonus_price"> <fmt:formatNumber
															value="${count*0.05}" type="number" />

												</span> 원</td>
											</tr>
											<tr class="goods_delivery_info">
												<td height="8"></td>
											</tr>

											<tr>
												<td height="8"></td>
											</tr>
											<tr>
												<td><span class="fx14 bold">총 결제금액</span></td>
												<td align="right"><strong
													class="settle_price fx20 bold tahoma "><fmt:formatNumber
															value="${count }" type="number" /></strong> <span
													class="fx12 bold">원</span></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>

							<div id="fee_benefit"
								style="background-color: #888888; margin-top: 1px; padding: 10px; line-height: 18px; color: #ffffff; font-size: 14px; font-weight: lighter;">
								<div id="fee_benefit_head">
									<div style="font-size: 13px;">
										- <span style="font-weight: bold;">신규 오픈 기념 배송비 무료
											이벤트중!</span><br> - 주문 당 1개의 배송지만 선택 가능합니다. <span
											style="font-weight: bold;">배송지를 꼭 확인해주세요!</span><br> -
										추가 주문의 경우 별도로 박스포장 되어 출고 됩니다. <span style="font-weight: bold;"></span><br>
									</div>
								</div>
							</div>

							<div style="height: 60px"></div> <!-- 주문정보 -->
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td valign="bottom" align="left" height="25"><h2>주문자정보</h2></td>
								</tr>
								<tr>
									<td height="8"></td>
								</tr>
								<tr>
									<td height="2" bgcolor="#044437"></td>
								</tr>
								<tr>
									<td height="10"></td>
								</tr>
							</table>
							<div style="padding: 10px">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td valign="top" width="48%">
											<table width="100%" border="0" cellpadding="0"
												cellspacing="0">
												<col width="130" />
												<tr>
													<td>이름 <b style="color: red">*</b></td>
													<td class="fx12"><input type="text"
														id="order_user_name" value="${loginDTO.m_name }" size="15" /></td>
												</tr>
												<tr>
													<td height="8"></td>
												</tr>
												<tr>
													<td>이메일 <b style="color: red">*</b></td>
													<td class="fx12"><input type="text" name="order_email"
														value="${loginDTO.m_email }" size="30" id="order_email" /></td>
												</tr>
												<tr>
													<td height="8"></td>
												</tr>
												<tr>
													<td>휴대폰 <b style="color: red">*</b></td>
													<td class="fx12"><input type="text"
														name="order_cellphone[]" value="" size="10" id="phone1" />
														- <input type="text" name="order_cellphone[]" value=""
														size="10" id="phone2" /> - <input type="text"
														name="order_cellphone[]" value="" size="10" id="phone3" /></td>
												</tr>
												<tr>
													<td height="8"></td>
												</tr>
												<tr>
													<td>유선전화</td>
													<td class="fx12"><input type="text"
														name="order_phone[]" value="" size="10" /> - <input
														type="text" name="order_phone[]" value="" size="10" /> -
														<input type="text" name="order_phone[]" value="" size="10" /></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>

							<div style="height: 60px" class="shippingDataViewTitle"></div>
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="shippingDataViewTitle">
								<tr>
									<td valign="bottom" align="left" height="25">
										<h2>배송정보</h2>
									</td>
								</tr>
								<tr>
									<td height="8"></td>
								</tr>
								<tr>
									<td height="2" bgcolor="#044437"></td>
								</tr>
								<tr>
									<td height="10"></td>
								</tr>
							</table>
							<div style="padding: 10px">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<col width="130" />
									<tr class="goods_delivery_info">
										<td height="10"></td>
									</tr>
									<tr class="domestic goods_delivery_info">
										<td>배송주소 <b style="color: red">*</b>
										</td>
										<td class="fx12" colspan="3">

											<div style="padding-bottom: 8px">
												<label><input type="radio" name="chkQuickAddress"
													value="often" checked id="memAddr" /> 회원 정보 주소</label> <label><input
													type="radio" name="chkQuickAddress" value="new"
													id="newAddr" /> 새로운 배송지</label>
											</div> <input type="text" name="recipient_zipcode[]"
											value="${loginDTO.m_zipcode }" size="10" maxlength="3"
											readonly id="zipcode" /> <span class="white_btn"><button
													class="hand" type="button" id="search">주소찾기</button></span>
										</td>
									</tr>
									<tr class="goods_delivery_info">
										<td height="5"></td>
									</tr>
									<tr class="domestic goods_delivery_info">
										<td></td>
										<td class="fx12" colspan="3">
											<div>
												<input type="text" name="recipient_address"
													value="${loginDTO.m_address1 }" size="45" readonly
													id="address1" />
											</div>
											<div style="margin-top: 5px;">
												<input type="text" name="recipient_address_detail"
													value="${loginDTO.m_address2 }" size="45" id="address2" />
											</div>
										</td>
									</tr>
									<tr class="domestic goods_delivery_info">
										<td height="5"></td>
									</tr>

									<tr>
										<td class="pb-3">받는분 <b style="color: red">*</b></td>
										<td class="fx12 pt-2 pb-1" colspan="3"><input type="text"
											id="recipient_user_name" value="" size="15" class="mr-1" /><label
											><input type="checkbox"
												id="copy_order_info" /> 주문자 정보와 동일</label>

											<div class="overseasInfo hide" style="color: #ff0000;">*
												받는 분의 이름은 개인통관고유번호를 발급받을 때 사용한 이름과 동일하여야 합니다.</div></td>
									</tr>
									<tr class="international">
										<td>받는분 휴대폰 <b style="color: red">*</b></td>
										<td class="fx12" colspan="3"><input type="text"
											name="international_recipient_cellphone[]" value="" size="10"
											id="recvPhone1" /> - <input type="text"
											name="international_recipient_cellphone[]" value="" size="10"
											id="recvPhone2" /> - <input type="text"
											name="international_recipient_cellphone[]" value="" size="10"
											id="recvPhone3" /></td>
									</tr>
									<tr>
										<td height="8"></td>
									</tr>
									<tr class="international">
										<td>받는분 전화</td>
										<td class="fx12" style="width: 300px" colspan="3"><input
											type="text" name="international_recipient_phone[]" value=""
											size="10" /> - <input type="text"
											name="international_recipient_phone[]" value="" size="10" />
											- <input type="text" name="international_recipient_phone[]"
											value="" size="10" /></td>
									</tr>
									<tr class="goods_delivery_info">
										<td height="5"></td>
									</tr>
									<tr class="goods_delivery_info">
										<td>배송요청사항</td>
										<td class="fx12" colspan="3"><div
												style="padding: 5px; border: 1px solid #ddd;">
												<textarea name="memo" id="shipMemo"
													style="padding: 0px; width: 100%; overflow: auto; border: 0px;"
													rows="2" title="이곳은 택배기사님이 확인하는 메세지란입니다."></textarea>
											</div></td>
									</tr>
								</table>
							</div>

							<div style="height: 60px" class="shippingDataViewTitle"></div>

							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<col />
								<col width="280" />
								<tr>
									<td valign="bottom" align="left" height="50"><h2>결제수단
											선택</h2></td>
									<td valign="middle" align="center"></td>
								</tr>
								<tr>
									<td height="8"></td>
								</tr>
								<tr>
									<td height="2" bgcolor="#044437" colspan="2"></td>
								</tr>
							</table>

							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								style="border-bottom: 1px solid #dbdbdb;">
								<tr>
									<td valign="top" style="padding: 10px">
										<!-- 결제정보입력 -->
										<table width="100%" border="0" cellpadding="0" cellspacing="0">
											<col width="130" />

											<tr>
												<td height="25"></td>
											</tr>
											<tr>
												<td valign="top">결제수단</td>
												<td class="fx12" style="letter-spacing: -1px"
													id="payment_type"><label
													style="display: inline-block; padding-right: 10px;">
														<input type="radio" name="payment" id="cardPay"
														value="v2_bill_kakaopay" style="height: 14px" checked />체크/신용카드,
														카카오페이
												</label><label
													style="display: inline-block; padding-right: 10px; font-size: 14px;"><input
														type="radio" name="payment" id="sendPay"
														value="v2_n_virtual"
														style="height: 14px; margin-right: 3px;" />무통장입금</label></td>
											</tr>
											<tr>
												<td height="15"></td>
											</tr>


										</table>
									</td>
								</tr>
							</table>

							<div style="height: 40px" class="shippingDataViewTitle"></div>

							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="2" colspan="2" bgcolor="#044437"></td>
								</tr>
								<tr>
									<td height="8" colspan="2"></td>
								</tr>
								<tr>
									<td valign="bottom" align="left" height="100"></td>
									<td valign="middle" align="right" width="302">
										<div>
											<span
												style="font-size: 20px; font-weight: bold; color: #222422; padding-right: 10px;">최종결제금액</span>
											<span
												style="font-size: 30px; font-weight: bold; color: #222422;"
												class="settle_price"><fmt:formatNumber
													value="${count }" type="number" /></span> <span
												style="font-size: 15px; color: #222422; padding-right: 10px;">원</span>
										</div>

										<div style="margin-top: 10px;">
											<div
												style="color: #222422; font-size: 14px; font-weight: bold; padding-right: 10px;">
												적립금 <span style="font-weight: bold;">${bonus} 원 </span> 적립
												예정
												<div id="mannapoint_info"
													style="color: #818181; font-size: 14px; font-weight: normal;">
													(일반 5% 정기 5% 배송 시작 후 지급)</div>
											</div>
										</div>
									</td>
								</tr>


							</table>



							<div style="height: 40px"></div>

							<div style="text-align: right" class="pay_layer">





								<span id="pay"> 결제하기 </span>

								<div id="problem_alert"
									style="margin-top: 10px; color: #008CBA;"></div>
							</div>

							<div style="text-align: center; display: none;" class="pay_layer"></div>
							<!-- 본문내용 끝 -->
						</td>
						<td width="40"></td>
					</tr>

				</table>
				<div style="height: 100px"></div>
				<form id="payForm" action="orderComplete" method="post">
					<input type="hidden" id="orderList" name="orderList">
				</form>

				<script>
		$("#pay").on("click", function(){
		if(${loginId==null}){
			alert("로그인이 필요한 메뉴입니다.")
			$(location).attr("href","/login");
		}else{
		if($("#order_user_name").val()!="" && $("#order_email").val()!="" && $("#phone1").val()!="" && $("#phone2").val()!="" && $("#phone3").val()!="" && $("#zipcode").val()!="" && $("#address1").val()!="" && $("#address2").val()!="" && $("#recipient_user_name").val()!="" && $("#recvPhone1").val()!="" && $("#recvPhone2").val()!="" && $("#recvPhone3").val()!=""){
    	  if($("#cardPay").prop("checked")){
    		  
    	 var spl = "${loginId}".split("(");
         var IMP = window.IMP; // 생략가능
         IMP.init('imp33112290'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
         IMP.request_pay({
            pg : 'inicis', // version 1.1.0부터 지원.
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : "상품 결제", //결제창에서 보여질 이름 //// 후원명 불러오기
            amount : ${count}, // 입력받은 금액
            buyer_email : spl[0],
            buyer_name : "${loginName}",
            buyer_tel : "010-0000-0000",
            m_redirect_url : 'orderComplete'
         /*  
             모바일 결제시,
             결제가 끝나고 랜딩되는 URL을 지정 
             (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
          */
         }, function(rsp) {
            if (rsp.success) {
               alert("결제가 완료되었습니다");
               $.ajax({
                  url : "https://www.myservice.com/payments/complete", // 가맹점 서버
                  method : "POST",
                  headers : {
                     "Content-Type" : "application/json"
                  },
                  data : {
                     imp_uid : rsp.imp_uid,
                     merchant_uid : rsp.merchant_uid
                  }
               }).done(function(data) {

               })
                    var jArray = new Array();
                      //JsonArray를 위한 배열생성

                      $('.eachOrder').each(
                            function() {
                               var jobj = new Object();
                               //JsonObject를 위한 객체생성
                           jobj.s_email = "${loginId}";
                           jobj.s_phone = $("#recvPhone1").val()+"-"+$("#recvPhone2").val()+"-"+$("#recvPhone3").val();
                               jobj.s_p_no = $(this).find("input:nth-child(1)").val();
                               jobj.s_p_imagepath = $(this).find("input:nth-child(2)").val();
                               jobj.s_p_title = $(this).find("input:nth-child(3)").val();
                               jobj.s_p_count = $(this).find("input:nth-child(4)").val();
                               jobj.s_p_price = $(this).find("input:nth-child(5)").val();
                           jobj.s_m_recipient = $("#recipient_user_name").val();
                           jobj.s_m_memo = $("#shipMemo").html();
                           jobj.s_m_paymethod = "카드 결제";
                               jobj.s_m_zipcode = $("#zipcode").val();
                               jobj.s_m_address1 = $("#address1").val();
                               jobj.s_m_address2 = $("#address2").val();
                               jobj.s_statement = "결제 완료";                             
                               jArray.push(jobj);
                            });
                      var stringJson = JSON.stringify(jArray);
                      $("#orderList").val(stringJson);                          
                  $("#payForm").submit();
            } else {
               alert('결제에 실패하였습니다.');
            }
         });

    	  }else{
    		  alert("무통장 입금으로 결제를 진행합니다.");
    		  var jArray = new Array();
					//JsonArray를 위한 배열생성

					$('.eachOrder').each(
							function() {
								var jobj = new Object();
								//JsonObject를 위한 객체생성
								jobj.s_email = "${loginId}";
								jobj.s_phone = $("#recvPhone1").val()+"-"+$("#recvPhone2").val()+"-"+$("#recvPhone3").val();
								jobj.s_p_no = $(this).find("input:nth-child(1)").val();
								jobj.s_p_imagepath = $(this).find("input:nth-child(2)").val();
								jobj.s_p_title = $(this).find("input:nth-child(3)").val();
								jobj.s_p_count = $(this).find("input:nth-child(4)").val();
								jobj.s_p_price = $(this).find("input:nth-child(5)").val();
								jobj.s_m_recipient = $("#recipient_user_name").val();
								jobj.s_m_memo = $("#shipMemo").html();
								jobj.s_m_paymethod = "무통장 입금";
								jobj.s_m_zipcode = $("#zipcode").val();
								jobj.s_m_address1 = $("#address1").val();
								jobj.s_m_address2 = $("#address2").val();
								jobj.s_statement = "입금 대기";						
								jArray.push(jobj);
							});
					var stringJson = JSON.stringify(jArray);
					$("#orderList").val(stringJson);            
					$("#payForm").submit();

    	  } 
		}else{
			alert("필수 항목을 모두 입력해주세요.");
		}
		}
      })
      
      
       document.getElementById("search").onclick = searchAddress;
                
                function searchAddress() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var roadAddr = data.roadAddress; // 도로명 주소 변수
                            var extraRoadAddr = ''; // 참고 항목 변수

                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraRoadAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraRoadAddr !== ''){
                                extraRoadAddr = ' (' + extraRoadAddr + ')';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById("zipcode").value = data.zonecode;
                            document.getElementById("address1").value = roadAddr;
                        }
                    }).open();
                }
      
   </script>


            <!--             


            <div id="bill_loading"
               style="z-index: 100000; position: fixed; width: 100%; height: 100%; left: 0px; top: 0px; display: none; background: rgba(82, 82, 82, .7);">
               <table height="100%" width="350" margin="0" cellpadding="0"
                  cellspacing="0" style="margin: 0 auto;">
                  <tr>
                     <td align="center" valign="middle">
                        <div
                           style="background-color: #ffffff; padding-top: 50px; padding-bottom: 30px; margin-left: 20px; margin-right: 20px; font-size: 14px;">
                           <div style="font-weight: bold;">
                              결제를 처리하고 있습니다.<br>잠시만 기다려 주세요...
                           </div>
                           <div>
                              <button type="button" name="close_btn"
                                 style="width: 250px; background-color: #044437; border: 0px; color: #ffffff; padding: 10px 0px 10px 0px; margin: 50px 10px 10px 10px;"
                                 onclick="javascript:$('#bill_loading').hide();">창닫기</button>
                           </div>
                        </div>
                     </td>
                  </tr>
               </table>
            </div>




            <div id="formpay_layer"
               style="z-index: 10000; position: fixed; width: 100%; height: 100%; left: 0px; top: 0px; display: none; background: rgba(82, 82, 82, .7);">
               <table height="100%" width="100%" margin="0" cellpadding="0"
                  cellspacing="0">
                  <tr>
                     <td align="center" valign="middle">
                        <table height="100%" width="100%" margin="0" cellpadding="0"
                           cellspacing="0">
                           <tr>
                              <td><iframe name="formpayFrame" id="formpayFrame"
                                    src="/main/blank" frameborder="0" width="100%" height="100%"></iframe>
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
            </div>

 -->

         </div>
      </div>
   </div>
   <jsp:include page="../module/fixedFooter.jsp"></jsp:include>
</body>
</html>