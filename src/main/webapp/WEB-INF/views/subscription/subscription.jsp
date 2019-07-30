<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>나의 정원 - 정기 구독</title>
<style>
.options{
	width:100px;
}
#bcolor {
	width: 100%;
	height: 175px;
	background-color: #ffe0de;
}

#title {
	text-align: center;
	margin: 100px 0px 100px 0px;
}

#title div:first-child {
	font-size: 27px;
	font-weight: bold;
	margin-bottom: 10px;
}

#title div:last-child {
	font-size: 16px;
}

.item {
	border: 1px solid #d1d1d1;
	text-align: center;
}

.item:hover {
	cursor: pointer;
	background-color: #e6ebe680;
	transition-duration: 0.5s;
	
}

#item4 .img {
	width: 120px;
	height: 120px;
	margin-top: 15px;
}

.imgs {
	margin-top: 50px;
	height: 150px;
}

.img {
	width: 150px;
	height: 150px;
	border-radius: 100%;
	margin: auto;
}

.name {
	margin-top: 50px;
	margin-bottom: 30px;
	font-size: 18px;
	font-weight: bold;
}

.content {
	margin-bottom: 80px;
	font-size: 15px;
}

#btnBorder {
	margin-top: 100px;
	margin-bottom: 100px;
}

#next {
	width: 250px;
	height: 60px;
	background-color: #44b27d;
	color: white;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	font-weight: bold;
	font-size: 20px;
}

#next:hover {
	background-color: #b4d9b5;
}

#nextBtn {
	text-align: center;
	margin: auto;
}

#closeBtn {
	padding-right: 10px;
}

#modalTitle {
	text-align: center;
	margin-top: 40px;
	margin-bottom: 10px;
}

.mTitle {
	font-weight: bold;
	font-size: 24px;
}

.foryou {
	font-size: 14px;
}

.subscribe {
	height: 120px;
}

.periodSub {
	padding-left: 90px;
	margin-top: 10px;
	margin-bottom: 5px;
	font-size: 16px;
	font-weight: bold;
}

.period {
	border: 1px solid #d1d1d1;
	width: 130px;
	height: 70px;
	float: left;
	margin-left: 30px;
	margin-right: 30px;
	text-align: center;
	line-height: 70px;
	font-size: 18px;
	cursor: pointer;
}

.period2 {
	margin-left: 90px;
}

.selects {
	margin-left: 90px;
}

#modalBtn {
	height: 80px;
	text-align: center;
}

#submitBtn {
	background-color: #44b27d;
	color: white;
	font-size: 15px;
	margin-top: 30px;
}

#selectDate {
	
}

#chooseDate {
	width: 300px;
	margin: auto;
}

#addrConfirm {
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
	font-family: 'Spoqa Han Sans', sans-serif;
}

#ableDate {
	font-size: 12px;
}

#select1, #select2, #select3{
	font-size: 13px;
}
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	<div id="bcolor"></div>
	<div id="wrapper" class="container">
		<div id="title" class="row">
			<div class="col-12">Select Your Box</div>
			<hr>
			<div class="col-12">정기 구독할 박스를 선택해 주세요!</div>
		</div>
		<div id="items" class="row">
			<div class="col-12 col-md-6 col-lg-3 mb-3">
				<div class="item" flag="false">
					<input id="vegetableBox" type="hidden" value="채소 박스">
					<input id="vegePrice" type="hidden" value="30000">
					<div class="imgs">
						<img class="img" src="resources/img/vege.jpeg">
					</div>
					<div class="name">채소 박스</div>
					<div class="content">
						공유 정원에서 키워진<br> 건강한 채소들을<br> 매주 다르게 구성해드려요.
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-3 mb-3">
				<div class="item" flag="false">
					<input id="fruitBox" type="hidden" value="과일 박스">
					<input id="fruitPrice" type="hidden" value="40000">
					<div class="imgs">
						<img class="img" src="resources/img/fruits.jpg">
					</div>
					<div class="name">과일 박스</div>
					<div class="content">
						공유 정원의 재철 과일을<br> 다양하게 구성해서<br> 보내드려요.
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-3 mb-3">
				<div class="item" flag="false">
					<input id="mixedBox" type="hidden" value="과일/채소 박스">
					<input id="mixedPrice" type="hidden" value="35000">
					<div class="imgs">
						<img class="img" src="resources/img/salad.jpg">
					</div>
					<div class="name">채소 + 과일 박스</div>
					<div class="content">
						샐러드 채소와 함께 구성된<br> 채소 + 과일 박스로<br> 간편하게 샐러드를 즐겨보세요.
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-3 mb-3">
				<div class="item" flag="false">
					<input id="customBox" type="hidden" value="나만의 박스">
					<input id="customPrice" type="hidden" value="45000">
					<div class="imgs">
						<img class="img" src="resources/img/question.png">
					</div>
					<div class="name">나만의 박스</div>
					<div class="content">
						정기 구독 박스를 <br> 원하는 품목으로 구성하려면<br> 나만의 박스를 만들어 보세요.
					</div>
				</div>
			</div>
		</div>
		<div id="btnBorder" class="row">
			<div id="nextBtn" class="col-12">
				<input id="next" type="button" class="btn" value="다음 >">
			</div>
		</div>
	</div>
	<jsp:include page="../module/fixedFooter.jsp"></jsp:include>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div id="closeBtn">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="modalTitle">
					<div class="modal-title mTitle" id="exampleModalCenterTitle">구독
						주기 선택</div>
					<div class="foryou">주기에 따라 알맞은 양으로 구성해 드려요!</div>
				</div>
				<form action="subsComplete" method="post" id="sbForm">
					<div class="modal-body p-0">
						<div id="weekly" class="subscribe">
							<div class="periodSub">주간구독</div>
							<div class="period2 period" flag="false">
							<input type="hidden" value="매주 한 번">
							매주</div>
							<div class="period" flag="false">
							<input type="hidden" value="격주에 한 번">
							격주</div>
						</div>
						<div id="monthly" class="subscribe">
							<div class="periodSub">월간구독</div>
							<div class="period2 period" flag="false">
							<input type="hidden" value="한 달에 한 번">
							한 달에 한번</div>
						</div>
						<div id="hide" class="mb-5">
							<div class="periodSub">나만의 박스 구성 선택</div>
							<div class="selects mt-2">
								<select flag="false" class="mr-2 mt-2 p-1 options" name="sb_component1"
									id="select1">
									<option selected value="미선택" hidden>과일/채소</option>
									<option value="미선택">선택안함</option>
									<c:forEach var="vegetable" items="${vagetables }">
										<option value="${vegetable }"><c:out value="${vegetable }" /></option>
									</c:forEach>
									<c:forEach var="fruit" items="${fruits}">
										<option value="${fruit }"><c:out value="${fruit }" /></option>
									</c:forEach>
								</select><select flag="false" class="mr-2 mt-2 p-1 options" name="sb_component2"
									id="select2">
									<option selected value="미선택" hidden>달걀/유제품</option>
									<option value="미선택">선택안함</option>
									<c:forEach var="egg" items="${eggs}">
										<option value="${egg }"><c:out value="${egg }" /></option>
									</c:forEach>
								</select><select flag="false" class="mr-2 mt-2 p-1 options" name="sb_component3"
									id="select3">
									<option selected value="미선택" hidden>곡물/기타</option>
									<option value="미선택">선택안함</option>
									<c:forEach var="grain" items="${grains}">
										<option value="${grain }"><c:out value="${grain }" /></option>
									</c:forEach>
									<c:forEach var="source" items="${sources}">
										<option value="${source }"><c:out value="${source }" /></option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div id="date" class="mt-3 mb-2">
							<div id="dateTitle" class="periodSub mb-3">
								첫 배송일 선택<span id="ableDate">(내일부터 선택가능)</span>
							</div>
							<div id="selectDate">
								 <input id="chooseDate" class="form-control" type="date" name="sb_startday">
							</div>
						</div>
						<div class="mt-5 mb-2">
							<div class="periodSub">결제 방식 선택</div>
							<div class="period2">
								<label style="display: inline-block; padding-right: 10px;">
									<input type="radio" name="payment" id="cardPay" checked />체크/신용카드,
									카카오페이
								</label><label style="display: inline-block; padding-right: 10px;"><input
									type="radio" name="payment" id="sendPay" />무통장입금</label>
									<input type="hidden" value="" name="sb_paymethod" id="sb_paymethod">
							</div>
						</div>
					</div>
					<div id="modalBtn" class="mb-5 mt-2">
					<input type="hidden" name="sb_period" value="" id="sb_period">
					<input type="hidden" name="sb_category" value="" id="sb_category">
					<input type="hidden" name="sb_statement" value="" id="sb_statement">
					<input type="hidden" name="sb_price" value="" id="sb_price">
						<button id="submitBtn" class="btn" type="button">구독하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="addrConfirm">
		<table width="100%" height="100%" cellpadding="0" cellspacing="0"
			border="0">
			<tr>
				<td align="center" valign="middle" style="padding: 0px 30px;">
					<div
						style="background-color: #ffffff; border-radius: 10px; width: 350px;">
						<div id="confirm_msg" class="p-3">회원정보의 주소지가 상품의 배송지로 지정됩니다.
							회원정보를 확인하시겠습니까?</div>
						<div>
							<div id="confirm_cancel" data-toggle="modal"
								data-target="#exampleModalCenter">결제 진행하기</div>
							<div id="confirm_yes">주소지 확인하기</div>
							<div style="clear: both;"></div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<script>
		var date = new Date();
		date.setDate(date.getDate() + 1);
		$("#chooseDate").val(date.toISOString().substring(0, 10));
		$("#chooseDate").attr("min", date.toISOString().substring(0, 10));
		date.setDate(date.getDate() + 15);
		$("#chooseDate").attr("max", date.toISOString().substring(0, 10));

		$("#hide").hide();
		var category = "미선택";
		$(".item").on("click", function() {
			var item = $(this);
			$(".item").css("border", "1px solid #d1d1d1");
			$(".item").css("background-color", "#ffffff");
			$(".item").attr("flag", "false");
			item.css("border", "1px solid #44b27d");
			item.css("background-color", "#e6ebe680");
			item.attr("flag", "true");
			$("#sb_category").val($(this).find("input:nth-child(1)").val());
			$("#sb_price").val($(this).find("input:nth-child(2)").val());
		})
		
		$("#next").on("click", function() {
			if(${loginId==null} || ${loginName==null}){
				alert("로그인이 필요한 메뉴입니다.");
				$(location).attr("href","/login");
			}else{
			var checked = 0;
			$(".item").each(function() {
				if ($(this).attr("flag") == "true") {
					checked++;
					if ($(this).find("div:nth-child(4)").html() == "나만의 박스") {
						category = $(this).find("div:nth-child(4)").html();
						$("#hide").show();
					} else {
						category = $(this).find("div:nth-child(4)").html();
						$("#hide").hide();
					}
				}
			});
			if (checked == 0) {
				alert("선택된 상품이 없습니다.");
			} else {
				$("#addrConfirm").fadeIn();
			}
		}
		})

		$("#confirm_yes").on("click", function() {
			$(location).attr("href", "/mypageInfo");
		})

		$("#confirm_cancel").on("click", function() {
			$("#addrConfirm").hide();
		})

		$(".period").on("click", function() {
			var item = $(this);
			$(".period").css("border", "1px solid #d1d1d1");
			$(".period").attr("flag", "false");
			item.css("border", "1px solid #44b27d");
			item.attr("flag", "true");
			$("#sb_period").val($(this).find("input:nth-child(1)").val());
		})

		$('.options').change(function() {
			var select1 = $("#select1").val();
			var select2 = $("#select2").val();
			var select3 = $("#select3").val();
			if (select1 != "미선택") {
				$("#select1").attr("flag", "true");
			} else {
				$("#select1").attr("flag", "false");
			}

			if (select2 != "미선택") {
				$("#select2").attr("flag", "true");
			} else {
				$("#select2").attr("flag", "false");
			}

			if (select3 != "미선택") {
				$("#select3").attr("flag", "true");
			} else {
				$("#select3").attr("flag", "false");
			}
		});

		$("#submitBtn").on("click",function() {
							var checked = 0;
							$(".period").each(function() {
								if ($(this).attr("flag") == "true") {
									checked++;
								}
							});
							if (checked == 0) {
								alert("배송 주기를 선택해주세요.");
							} else {
								if (category == "나만의 박스"
										&& $("#select1").attr("flag") == "false"
										&& $("#select2").attr("flag") == "false"
										&& $("#select3").attr("flag") == "false") {
									alert("선택된 상품이 없습니다.");
								} else {
									if ($("#cardPay").prop("checked")) {
										var price = 100;
										var IMP = window.IMP; // 생략가능
										IMP.init('imp33112290'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
										IMP.request_pay(
														{
															pg : 'inicis', // version 1.1.0부터 지원.
															pay_method : 'card',
															merchant_uid : 'merchant_'
																	+ new Date()
																			.getTime(),
															name : "상품 결제", //결제창에서 보여질 이름 //// 후원명 불러오기
															amount : price, // 입력받은 금액
															buyer_email : "${loginDTO.m_email}",
															buyer_name : "${loginDTO.m_name}",
															buyer_tel : "${loginDTO.m_phone}",
															m_redirect_url : 'orderComplete'
														},
														function(rsp) {
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
																				})
																		.done(function(data) {
																			$("#sb_paymethod").val("카드 결제");
																			$("#sb_statement").val("결제 완료");
																			$("#sbForm").submit();
																				})
															} else {
																alert('결제에 실패하였습니다.');
															}
														});
									} else {	
										var payConfirm = confirm("무통장 입금으로 결제를 진행합니다.");
										if(payConfirm){
											$("#sb_paymethod").val("무통장 입금");
											$("#sb_statement").val("입금 대기");
											$("#sbForm").submit();
										}
									}
								}
							}
						})
	</script>
</body>
</html>