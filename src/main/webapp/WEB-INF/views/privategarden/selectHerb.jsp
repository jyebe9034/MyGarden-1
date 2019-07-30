<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
   type="text/javascript"></script>
<title>Select herb</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
	#bcolor{
      width : 100%;
      height : 175px;
      background-color : #deca92;      
    }
	div{
		box-sizing : border-box;
	}
	#wrap{
		overflow-y : auto;
		text-align: center;
		margin-bottom : 100px;
	}
	#title{
		margin : 45px;
	}
	.frames{
		display : inline-block;
		text-align: center;
		width : 200px;
	}
	.herbs{
		width : 180px;
		height : 180px;
	}
	.borders{
		border : 1px solid #d1d1d1;
	}
	.borders:hover{
		cursor : pointer;
	}
	label{
		display : inline-block;
		width : 100%;
		text-align : center;
		margin-bottom : 10px;
	}
	.rows{
		margin-top : 20px;
		text-align : center;
	}
	#chooseherb{
		font-size : 36px;
		font-weight : bold;
		margin : 20px 0px 10px 0px;
	}
	#notice{
		font-size : 16px;
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
	
	#cancel {
	   float: left;
	   width: 49%;
	   font-size: 14px;
	   color: #818181;
	   padding: 18px 0px;
	   cursor: pointer;
	}
	
	#confirmBtn {
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
	
	#sort{
		font-size : 26px;
		margin : 10px;
	}
	
	#aboutherb{
		font-size : 14px;
		margin : 15px;
	}
	
	.environment{
		margin-top : 10px;
	}
	
	.character, .environment{
		font-size : 16px;
		color : #44b27d;
	}
</style>
</head>
<body>
	<jsp:include page="../module/fixedHeader.jsp"></jsp:include>
	<div id="bcolor"></div>

	<div id="wrap" class="container">
		<div id="title" class="row">
			<div id="chooseherb" class="col-12">Select Your herb!</div>
			<div id="notice" class="col-12">선택한 허브를 키우는 방법은 완료 버튼을 클릭하면 볼 수 있어요</div>
		</div>
		<div class="rows row">
			<div class="frames col-4">
				<div id="applemint" class="borders p-3" myflag="false">
					<img class="herbs" src="/resources/herbs/applemint02.png">
					<label>애플민트(Applemint)</label>
				</div>
			</div>
			<div class="frames col-4">
				<div id="basil" class="borders p-3" myflag="false">
					<img class="herbs" src="/resources/herbs/basil03.jpg">
					<label>바질(Basil)</label>
				</div>
			</div>
			<div class="frames col-4">
				<div id="watercress" class="borders p-3" myflag="false">
					<img class="herbs" src="/resources/herbs/watercress01.jpg">
					<label>워터크래스(Watercress)</label>
				</div>
			</div>
		</div>
		<div class="rows row">
			<div class="frames col-4">
				<div id="coriander" class="borders p-3" myflag="false">
					<img class="herbs" src="/resources/herbs/coriander01.jpg">
					<label>고수(Coriander)</label>
				</div>
			</div>
			<div class="frames col-4">
				<div id="oregano" class="borders p-3" myflag="false">
					<img class="herbs" src="/resources/herbs/oregano02.jpeg">
					<label>오레가노(Oregano)</label>
				</div>
			</div>
			<div class="frames col-4">
				<div id="parsley" class="borders p-3" myflag="false">
					<img class="herbs" src="/resources/herbs/parsley02.jpg">
					<label>파슬리(Parsley)</label>
				</div>
			</div>
		</div>
		<div class="rows row">
			<div class="frames col-4">
				<div id="peppermint" class="borders p-3" myflag="false">
					<img class="herbs" src="/resources/herbs/peppermint02.jpg">
					<label>페퍼민트(Peppermint)</label>
				</div>
			</div>
			<div class="frames col-4">
				<div id="thyme" class="borders p-3" myflag="false">
					<img class="herbs" src="/resources/herbs/thyme01.jpg">
					<label>타임(Thyme)</label>
				</div>
			</div>
			<div class="frames col-4">
				<div id="rucola" class="borders p-3" myflag="false">
					<img class="herbs" src="/resources/herbs/rucola03.PNG">
					<label>루꼴라(Rucola)</label>
				</div>
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
                  <div id="confirm_msg" class="p-2">
                  	<div id="sort"></div>
                  	<div id="aboutherb"></div>
                  </div>
                  <div>
                     <div id="cancel" data-toggle="modal" data-target="#exampleModalCenter">다른 허브 알아보기</div>
                     <div id="confirmBtn">선택한 허브 키우러 가기</div>
                     <div style="clear: both;"></div>
                  </div>
               </div>
            </td>
         </tr>
      </table>
   </div> 
   
   <jsp:include page="../module/fixedFooter.jsp"></jsp:include>
	
	<script>
		
		$("#confirmBtn").on("click", function(){
			$("#addrConfirm").hide();
		if(${loginId==null}){
			alert("로그인이 필요한 메뉴입니다.")
			$(location).attr("href","/login");
		}else{
  		 alert("허브 결제를 진행합니다.");  	
  		 var spl = "${loginId}".split("(");
         var IMP = window.IMP; // 생략가능
         IMP.init('imp33112290'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
         IMP.request_pay({
            pg : 'inicis', // version 1.1.0부터 지원.
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : "허브 결제 : "+ $("#sort").text(), //결제창에서 보여질 이름 //// 후원명 불러오기
            amount : 100, // 입력받은 금액
            buyer_email : spl[0],
            buyer_name : "${loginName}",
            buyer_tel : "010-0000-0000",
            m_redirect_url : "toConfirmherb?herb="+$("#sort").text()
         /*  
             모바일 결제시,
             결제가 끝나고 랜딩되는 URL을 지정 
             (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
          */
         }, function(rsp) {
            if (rsp.success) {
               alert("결제가 완료되었습니다. 허브 키우기로 이동합니다.");
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
				
                var herb = $("#sort").text();
  				$(location).attr("href", "toConfirmherb?herb="+herb);
               
            } else {
               alert('결제에 실패하였습니다.');
            }
         });

		}
      })
		
		
		$(".borders").on("click", function(){
			$(".borders").css("border", "");
			$(".borders").attr("myflag", "false");
			$(this).css("border", "1px solid #44b27d");
			$(this).attr("myflag", "true");
			
			$(".borders").each(function(i,item){
				var test = $(this).attr("myflag");
				if(test == "true"){
					var name = $(this).attr("id");
					var about = $("#aboutherb");
					about.text("");
					if(name == "applemint"){
						$("#sort").text("애플민트(Applemint)");
						about.append("<div class='character'>애플민트의 특징과 효능</div>");
						about.append("<div class='aboutcharacter'>소화불량이나 피로회복에 좋고 구취제거에 탁월하여 치약의 성분으로도 사용된다. 유럽에서는 향신료로도 널리 사용된다.</div>");
						about.append("<div class='environment'>애플민트를 위한 환경설정</div>");
						about.append("<div class='temp'>온도 : 15~20도</div>");
						about.append("<div class='humid'>습도 : 약간의 습기는 좋지만 과습은 싫어함</div>");
						about.append("<div class='light'>빛 : 강한 직사광선이 아닌 햇빛을 좋아함</div>");
					}else if(name == "basil"){
						$("#sort").text("바질(Basil)");
						about.append("<div class='character'>바질의 특징과 효능</div>");
						about.append("<div class='aboutcharacter'>달콤하고 은은하면서 시원한 사과향이 나고 토마토 요리와 잘 어울린다. 올리브 오일에 담가 허브 오일로 이용해도 좋다."
								 + "바질 페스토 만들기도 어렵지는 않지만 바질 잎이 많이 필요하다.</div>");
						about.append("<div class='environment'>바질을 위한 환경설정</div>");
						about.append("<div class='temp'>온도 : 25~30도</div>");
						about.append("<div class='humid'>습도 : 약간 촉촉하게 유지해 주는 것이 좋음</div>");
						about.append("<div class='light'>빛 : 햇빛을 좋아함</div>");
					}else if(name == "watercress"){
						$("#sort").text("워터크래스(Watercress)");
						about.append("<div class='character'>워터크래스의 특징과 효능</div>");
						about.append("<div class='aboutcharacter'>독특한 매운맛이 난다. 비타민, 베타 카로틴, 미네랄 등 영양이 풍부하지만 가열하면 영양소가 파괴될 수 있어 생으로 이용하는 것이 좋다.</div>");
						about.append("<div class='environment'>워터크래스를 위한 환경설정</div>");
						about.append("<div class='temp'>온도 : 15~20도</div>");
						about.append("<div class='humid'>습도 : 습기가 많은 곳을 좋아함</div>");
						about.append("<div class='light'>빛 : 반그늘을 좋아함</div>");
					}else if(name == "coriander"){
						$("#sort").text("고수(Coriander)");
						about.append("<div class='character'>고수의 특징과 효능</div>");
						about.append("<div class='aboutcharacter'>씨앗 차는 두통, 소화와 입냄새 제거에 좋다. 잎은 강한 향으로 생선등의 비린내를 잡아준다. 그러나 향이 강해 호불호가 강하다.</div>");
						about.append("<div class='environment'>고수를 위한 환경설정</div>");
						about.append("<div class='temp'>온도 : 15~20도</div>");
						about.append("<div class='humid'>습도 : 약간 촉촉한 상태를 좋아함</div>");
						about.append("<div class='light'>빛 : 햇빛을 좋아함. 반양지도 괜찮음</div>");
					}else if(name == "oregano"){
						$("#sort").text("오레가노(Oregano)");
						about.append("<div class='character'>오레가노의 특징과 효능</div>");
						about.append("<div class='aboutcharacter'>이탈리아 요리에 잘 어울리며, 차로 이용하면 소화, 호흡기, 두통 등에 효과가 있다고 한다.</div>");
						about.append("<div class='environment'>오레가노를 위한 환경설정</div>");
						about.append("<div class='temp'>온도 : 15~20도</div>");
						about.append("<div class='humid'>습도 : 적정한 습도를 좋아함</div>");
						about.append("<div class='light'>빛 : 햇빛을 좋아함</div>");
					}else if(name == "parsley"){
						$("#sort").text("파슬리(Parsley)");
						about.append("<div class='character'>파슬리의 특징과 효능</div>");
						about.append("<div class='aboutcharacter'>차, 요리 등에 들어가는 허브이다. 파슬리, 월계수잎, 타임 등을 묶어 생선이나 고기의 냄새를 없애고 맛을 내는데 사용한다."
								+ "그러나 약성이 있으므로 과다 사용은 금물이다.</div>");
						about.append("<div class='environment'>파슬리 위한 환경설정</div>");
						about.append("<div class='temp'>온도 : 10~18도</div>");
						about.append("<div class='humid'>습도 : 습한걸 좋아하며 고온 건조에 약함</div>");
						about.append("<div class='light'>빛 : 햇빛을 좋아하지만 강한 햇빛은 싫어함</div>");
					}else if(name == "peppermint"){
						$("#sort").text("페퍼민트(Peppermint)");
						about.append("<div class='character'>페퍼민트의 특징과 효능</div>");
						about.append("<div class='aboutcharacter'>키우기도 쉽고 향기가 좋아 인기있는 허브이다. 요리, 차, 포프리, 목욕제에 사용된다. 소화에 좋다.</div>");
						about.append("<div class='environment'>페퍼민트를 위한 환경설정</div>");
						about.append("<div class='temp'>온도 : 15~20</div>");
						about.append("<div class='humid'>습도 : 습한것을 좋아하지만 과습은 싫어함</div>");
						about.append("<div class='light'>빛 : 반양지를 좋아함</div>");
					}else if(name == "thyme"){
						$("#sort").text("타임(Thyme)");
						about.append("<div class='character'>타임의 특징과 효능</div>");
						about.append("<div class='aboutcharacter'>요리, 차, 향(에센셜 오일), 입욕제로도 좋다. 활용도가 좋은 허브이다."
								+ "타임은 총 300여종이 있으며 커먼타임 외에 레몬타임, 실버타임 등 주로 기르는 것도 여러종류이다.</div>");
						about.append("<div class='environment'>타임을 위한 환경설정</div>");
						about.append("<div class='temp'>온도 : 16~23도</div>");
						about.append("<div class='humid'>습도 : 과습만 피하면 됌</div>");
						about.append("<div class='light'>빛 : 햇빛을 좋아함</div>");
					}else{ //rucola
						$("#sort").text("루꼴라(Rucola)");
						about.append("<div class='character'>루꼴라의 특징과 효능</div>");
						about.append("<div class='aboutcharacter'>채소처럼 이용하기 쉬운 인기있는 허브이다. 비타민 C등의 영양도 풍부하고 소화촉진 효과도 있다."
								+ "땅콩 같은 견과류의 향과 매운 맛이 난다.</div>");
						about.append("<div class='environment'>루꼴라를 위한 환경설정</div>");
						about.append("<div class='temp'>온도 : 10~18도</div>");
						about.append("<div class='humid'>습도 : 건조한 편이 좋지만 습해도 잘자람</div>");
						about.append("<div class='light'>빛 : 햇빛을 좋아하지만 너무 강하면 잎이 뻣뻣해 짐</div>");
					}
					$("#addrConfirm").fadeIn();
				}
			})
		})
		
		$("#cancel").on("click", function(){
			$("#addrConfirm").hide();
		})
	</script>
</body>
</html>