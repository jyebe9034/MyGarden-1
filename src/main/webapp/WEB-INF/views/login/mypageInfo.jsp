<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 정보수정</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
#joinBtn{height:57px; position:absolute; top:6px; right:14px; display: inline-block; padding: .5em .75em; color: #4f9c87; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #4f9c87; border-bottom-color: #4f9c87; border-radius: .25em; }
#joinBtn:hover{background:#4f9c87; color:#fff;}
.fontGreen{font-weight:bold; color:#4f9c87;}
.onblur{font-size:13px; color:#4f9c87;}
.postCode{position:relative;}
input[name=m_social]{pointer-events: none; visibility: hidden;}
.blockSign {
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 0 20px 20px 20px;
}
#formContent {
  -webkit-border-radius: 0px 0px 10px 10px;
  border-radius: 0px 0px 10px 10px;
  background: #fff;
  padding: 0px;
  max-width: 650px;
  margin: 47px auto;
  position: relative;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}
#formFooter {
  background-color: #f6f6f6;
  border-top: 1px solid #dce8f1;
  padding: 25px;
  text-align: center;
  -webkit-border-radius: 0 0 10px 10px;
  border-radius: 0 0 10px 10px;
}
.tab-group:after {
  content: "";
  display: table;
  clear: both;
}
.tab-content > div:last-child {
  display: none;
}
#reset{
  background:#72af9f;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 #65a896;
  box-shadow: 0 10px 30px 0 #65a896;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
input[type=button], input[type=submit]  {
  background-color: #4f9c87;
  border: none;
  color: white;
  padding: 15px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  text-transform: uppercase;
  font-size: 13px;
  -webkit-box-shadow: 0 10px 30px 0 #65a896;
  box-shadow: 0 10px 30px 0 #65a896;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
  margin: 5px 20px 40px 20px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}
input[type=button]:hover, input[type=submit]:hover  {
  opacity:0.8;
}
input[type=button]:active, input[type=submit]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
}
.inputStuff{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 95%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
.inputStuff50{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
  width: 46%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
input[type=text]:focus,input[type=email]:focus, input[type=password]:focus {
  background-color: #fff;
  border-bottom: 2px solid #60a593;
}
input:readonly{
  background:#D1E5DF;
  border: 2px solid #D1E5DF;
}
input[type=text]:placeholder,input[type=email]:placeholder, input[type=password]:placeholder {
  color: #eee;
}
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}
@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}
/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}
.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}
.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}
.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}
.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}
/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
  display: block;
  left: 0;
  bottom: -10px;
  width: 0;
  height: 2px;
  background-color: #86B404;
  content: "";
  transition: width 0.2s;
}
.underlineHover:hover {
  color: #86B404;
}
.underlineHover:hover:after{
  width: 100%;
}
input[type=email]{
  background:#D1E5DF;
  border: 2px solid #D1E5DF;
}
/* OTHERS */
*:focus {
    outline: none;
} 
* {
  box-sizing: border-box;
} 
</style>
</head>
<body>
<script>
	$(function(){
		//slide
		$('.carousel').carousel({
			  interval: 5000
			});
		//input effect
		$('.form').find('input, textarea').on('keyup blur focus', function (e) {
		    var $this = $(this),
		        label = $this.prev('label');
		        if (e.type === 'keyup') {
		              if ($this.val() === '') {
		            label.removeClass('active highlight');
		          } else {
		            label.addClass('active highlight');
		          }
		      } else if (e.type === 'blur') {
		          if( $this.val() === '' ) {
		              label.removeClass('active highlight'); 
		              } else {
		              label.removeClass('highlight');   
		              }   
		      } else if (e.type === 'focus') {
		        if( $this.val() === '' ) {
		              label.removeClass('highlight'); 
		              } 
		        else if( $this.val() !== '' ) {
		              label.addClass('highlight');
		              }
		      }
		  });
		//input form
       	$("input[name=m_name]").on("blur", function(){
       		var regexName=/^[가-힣A-z]{2,}$/;
       		if(regexName.exec($("input[name=m_name]").val())){
       			$("#userName").text("");
       		}else{
       			$("#userName").text("2단어 이상으로 이루어진 영어, 한글만 가능합니다");
       			$("input[name=m_name]").val("${memDTO.m_name}");
       		}
       	});
       	$("#pastPw").on("blur", function(){
       		$.ajax({
       			url:"/pwCheck",
       			type:"post",
       			data:{key:"${memDTO.m_email}", pw:$("#pastPw").val()}
       		}).done(function(resp){
       			if(resp==true){
           			$("#pastPwName").text("");
       			}else{
           			$("#pastPwName").text("비밀번호가 일치하지 않습니다");
           			$("#pastPw").val("");
       			}
       		});
       	});
       	$("input[name=m_pw]").on("blur", function(){
       		var regexPw=/^(?=.*\d)(?=.*[a-z]).{8,15}$/;
       		if($("#password").val()==""){
           		if(regexPw.exec($("input[name=m_pw]").val())){
           			$("#pwName").text("");
           			$("#password").focus();
           		}else{
           			$("#pwName").text("영문, 숫자  8자리 이상을 조합해 비밀번호를 입력하세요");
           			$("input[name=m_pw]").val("");
           		}
       		}else{
           		if(regexPw.exec($("input[name=m_pw]").val())){
           			$("#pwName").text("");
           			$("#password").focus();
           			$("#password").blur();
           		}else{
           			$("#pwName").text("영문, 숫자  8자리 이상을 조합해 비밀번호를 입력하세요");
           			$("input[name=m_pw]").val("");
           		}
       		}
       	});
       	$("#password").on("blur", function(){
       		if($("input[name=m_pw]").val()==$("#password").val()){
       			$("#pwCheck").text("");
       		}else{
       			$("#pwCheck").text("비밀번호 형식이 맞지 않거나 일치하지 않습니다");
       			$("#password").val("");
       		}
       	});
       	$("input[name=m_phone]").on("blur", function(){
       		var regexPhone=/^01[01789]-[\d]{3,4}-[\d]{4}$/;
       		if(regexPhone.exec($("input[name=m_phone]").val())){
           		$.ajax({
           			url:"/phoneCheck",
           			type:"post",
           			data : {key : $("input[name=m_phone]").val()}
           		}).done(function(resp){
           			console.log(resp);
           			if(resp==true){
           				if($("input[name=m_phone]").val()==resp){
                   			$("#phoneName").text("");
           				}else{
                   			$("#phoneName").text("중복되는 번호입니다");
                   			$("input[name=m_phone]").val("${memDTO.m_phone}");
           				}
           			}else{
               			$("#phoneName").text("");
           			}
           		});
       		}else{
       			$("#phoneName").text("형식에 맞지 않는 번호입니다");
       			$("input[name=m_phone]").val("${memDTO.m_phone}");
       		}
       	});
       	$('#m_address1').on('focus', function(){
       		$("#addrName").text("주소를 수정하려면 상단 버튼을 눌러 우편번호부터 찾으세요");
       	});
       	$('#m_address2').on('focus', function(){
       		$("#addrName").text("주소를 수정하려면 상단 버튼을 눌러 우편번호부터 찾으세요");
       	});
   		$('#reset').on('click', function(){
   			$(location).attr('href', '/mypageFirst');
   		});
   		$('#updateInfo').on('click', function(){
   			if($('input[name="m_name"]').val()!="" 
   					&& $('input[name="m_email"]').val()!=""
   					&& $('#pastPw').val()!=""
   					&& $('input[name="m_pw"]').val()!=""
   	   				&& $('#password').val()!=""
   	    			&& $('input[name="m_phone"]').val()!=""
   	    	   		&& $('input[name="m_zipcode"]').val()!=""
   	    	    	&& $('input[name="m_address1"]').val()!=""
   	    	   	    && $('input[name="m_address2"]').val()!=""
   	    	    	&& $('#zonecode').val()!=""){
       			var con = confirm('이대로 제출하시겠습니까?');
 				if(con){
                		$('.formSubmit').submit();	
            		}
   			}else{
   				alert('다시 확인 후 제출하세요');
   			}
        });	
   		$('#findPwBtn').on('click', function(){
   			$(location).attr('href', '/mailSender');
   		});
	});
</script>
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
	<div class="container my">
		<div class="row text-center mt-5 my">
		
		<jsp:include page="/WEB-INF/views/module/mypage.jsp"/>
		
			<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 pt-5 my">
				<div class="list-group">
				  <a href="/mypageFirst" class="list-group-item list-group-item-action">Overview</a>
				  <a href="/mypageInfo" class="list-group-item list-group-item-action currentActive">내 정보 수정</a>
				  <a href="orderList" class="list-group-item list-group-item-action">구매 내역</a>
				  <a href="subsList" class="list-group-item list-group-item-action">정기 구독</a>
				  <c:if test="${grade == 'admin'}">
				  		<a href="productsAdd" class="list-group-item list-group-item-action">상품 등록</a>
				  		<a href="chatManage" class="list-group-item list-group-item-action">채팅 문의 관리</a>
				  </c:if>
				  <a href="/mypageDelete" class="list-group-item list-group-item-action">탈퇴하기</a>
				</div>
			</div>
			<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 my">	
				<div class="blockSign">
			        <div id="formContent">
			                <div id="signin">
			                    <h3 class="font-weight-bold text-dark pt-5 pr-2">나의 정원 정보수정
			                    </h3>
			                    <h6 class="pt-2 text-muted mr-2 ml-2">나의 정보를 확인 후 언제든 업데이트 하세요</h6>
			                    <form class="pl-5 pr-5 formSubmit" action="updateInfo" method="post" enctype="multipart/form-data">	
									<input type="text" value="${memDTO.m_social}" name="m_social" readonly>
			                        <input type="text" value="${memDTO.m_name}" placeholder="사용자 이름을 입력하세요" class="fadeIn inputStuff" name="m_name">
			                        	<div class="onblur" id="userName"></div>
			                        <input type="email" value="${memDTO.m_email}" name="m_email" class="fadeIn inputStuff" readonly>
					<!-------------------- jstl ------------------------->
			                        <c:if test="${memDTO.m_social=='MG'}">
				                        <input type="password" placeholder="이전 비밀번호를 입력하세요*" class="fadeIn inputStuff" id="pastPw">
				                        	<div class="onblur" id="pastPwName"></div>
				                        <input type="password" placeholder="최근 비밀번호 또는 새 비밀번호를 입력하세요*" class="fadeIn inputStuff" name="m_pw">
				                        	<div class="onblur" id="pwName"></div>
				                        <input type="password" placeholder="입력하신 비밀번호를 확인하세요*" id="password" class="fadeIn inputStuff">
				                        	<div class="onblur" id="pwCheck"></div>
									</c:if>
					<!-------------------- jstl ------------------------->
			                        <input type="text" value="${memDTO.m_phone}" placeholder="휴대폰 번호를 입력하세요 ex)010-000-0000" class="fadeIn inputStuff" name="m_phone">
			                        	<div class="onblur" id="phoneName"></div>
			                        <div class="postCode" id="postCode">
				                        <input type="text" value="${memDTO.m_zipcode}" placeholder="우편번호를 검색하세요" class="fadeIn inputStuff" id="zonecode" name="m_zipcode" readonly/>
				                        	<button type="button" id="joinBtn" class="mb-3 btn" onclick="sample6_execDaumPostcode()"><img src="resources/img/post.png" width="38" height="36"></button>
			                        </div>	
			                        <div id="addressSet">
				                        <input type="text" value="${memDTO.m_address1}" placeholder="주소" class="fadeIn inputStuff50" id="m_address1" name="m_address1" readonly>
				                        <input type="text" value="${memDTO.m_address2}" placeholder="상세주소" class="fadeIn inputStuff50" id="m_address2" name="m_address2" readonly>
				                    </div>
				                    <div class="onblur" id="addrName"></div>
                    <!-------------------- jstl ------------------------->
		                        <c:if test="${memDTO.m_social=='MG'}">
			                        <input type="text" value="${memDTO.m_birth}" placeholder="생년월일" class="fadeIn inputStuff50" name="m_birth" readonly>
			                        <input type="text" value="${memDTO.m_gender}" placeholder="성별" class="fadeIn inputStuff50" name="m_gender" readonly>
			                    </c:if>   
                    <!-------------------- jstl ------------------------->
			                        <input type="button" class="mt-4 mb-1" value="취소하기" id="reset">
			                        <input type="button" value="수정하기" id="updateInfo">
			                    </form>
								<!-- 	address js start-->
								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
								<script src="resources/js/zipcode.js"></script>
								<!-- 	address js end-->
		                        <p id="formFooter">
                    <!-------------------- jstl ------------------------->
		                        <c:if test="${memDTO.m_social=='MG'}">
		                        	<a href="#" class="text-muted" data-toggle="modal" data-target="#findPassword">비밀번호 찾기</a>
		                        </c:if>	
                    <!-------------------- jstl ------------------------->
		                       	</p>
		                       	<!-- Modal -->
									<div class="modal fade" id="findPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalCenterTitle">비밀번호 찾기</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body">
									          <div>${memDTO.m_email}로 임시 비밀번호를 보내드립니다</div>
									          <div>발급 버튼을 클릭 후 임시 비밀번호로 다시 로그인 하세요</div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									        <button type="button" class="btn btn-primary" id="findPwBtn">임시 비밀번호 발급받기</button>
									      </div>
									    </div>
									  </div>
									</div>
								<!-- modal end -->
			                </div>
			                <div id="signup">
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>	
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>