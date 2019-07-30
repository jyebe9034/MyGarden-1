<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 회원가입</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
.imageContainer{height:300px; overflow:hidden;}
.carousel-inner{margin-top:-120px;}
.loginForm{background:#399078; color:#fff; height:60px; font-size:27px;}
#verMailBtn, #verCodeBtn, .filebox label, #joinBtn{ display: inline-block; padding: .5em .75em; color: #4f9c87; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #4f9c87; border-bottom-color: #4f9c87; border-radius: .25em; }
#joinBtn{height:57px; position:absolute; top:6px; right:-5px;} 
#verMailBtn:hover, #verCodeBtn:hover, #joinBtn:hover, .filebox label:hover{background:#4f9c87; color:#fff;}
.filebox input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
.profile{width:130px; height:130px; border-radius:50%; margin:10px auto; overflow:hidden;}
.fontGreen{font-weight:bold; color:#4f9c87;}
.onblur{font-size:13px; color:#4f9c87;}
.postCode{position:relative;}
.modal-body{max-height:270px; overflow-y:auto;}
#surplusForm, #verifingCode{display:none;}
.modal-body{height:400px; overflow-y:scroll;}
.blockSign {
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}
#formContent {
  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  background: #fff;
  padding: 0px;
  max-width: 650px;
  margin: 40px auto;
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
input[type=reset]{
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
input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
  opacity:0.8;
}
input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
  -moz-transform: scale(0.95);
  -webkit-transform: scale(0.95);
  -o-transform: scale(0.95);
  -ms-transform: scale(0.95);
  transform: scale(0.95);
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
  width: 100%;
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
input[type=text]:placeholder,input[type=email]:placeholder, input[type=password]:placeholder {
  color: #cccccc;
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
<!-- script -->
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
			//profile local image insert start
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						$('.profile').html('<img src='+e.target.result+' width=130 height=130>');
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#ex_file").change(function() {
				var selectedFile = this.files[0];
	       		var idxDot = selectedFile.name.lastIndexOf(".") + 1;
	       		var extFile = selectedFile.name.substr(idxDot, selectedFile.name.length).toLowerCase();
	       		if (extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == "svg" || extFile == "gif") {
	       		   //do whatever want to do
	       			readURL(this);
	       		} else {
	       		     alert("이미지 파일만 가능합니다");
	       		 	 $('.profile').html('<img src="resources/img/profile.png" width=130 height=130>');
	       		}
			});	
			//profile local image insert end
			
			//input form
           	$("input[name=ex_file]").on("input", function(){
           		if($('#ex_file').val()!=""){
           			$("#fileName").text("");
           		}
           	});
           	$("input[name=m_garden]").on("blur", function(){
           		var regexGarden=/^[가-힣A-z]+[\s]*[가-힣A-z]{0,12}$/;
           		if(regexGarden.exec($("input[name=m_garden]").val())){
               		$.ajax({
               			url:"/gardenCheck",
               			type:"post",
               			data : {key : $("input[name=m_garden]").val()}
               		}).done(function(resp){
               			if(resp==true){
                   			$("#gardenName").text("중복되는 정원 이름입니다");
                   			$("input[name=m_garden]").val("");
               			}else{
                   			$("#gardenName").text("");
               			}
               		});
           		}else{
           			$("#gardenName").text("2~12단어로 이루어진 영어, 한글만 가능합니다");
           			$("input[name=m_garden]").val("");
           		}
           	});
           	$("input[name=m_name]").on("blur", function(){
           		var regexName=/^[가-힣A-z]{2,12}$/;
           		if(regexName.exec($("input[name=m_name]").val())){
           			$("#userName").text("");
           		}else{
           			$("#userName").text("2~12단어 이상으로 이루어진 영어, 한글만 가능합니다");
           			$("input[name=m_name]").val("");
           		}
           	});
           	var pwCode;
           	$("#verMailBtn").on("click", function(){
           		var regexMail=/^[^\d](\w*|\d)@([a-z]*.?)*[a-z]$/;
           		if(regexMail.exec($("input[name=m_email]").val())){
               		$.ajax({
               			url:"/emailCheck",
               			type:"post",
               			data : {key : $("input[name=m_email]").val()}
               		}).done(function(resp){
               			if(resp==true){
                   			$("#eamilName").text("중복되는 메일입니다");
                   			$("input[name=m_email]").val("");
               			}else{
               				$.ajax({
               					url:"/findPwGetCode",
               					type:"post",
               					data:{key:$("input[name=m_email]").val()}
               				}).done(function(resp){
               					pwCode=resp;
                       			$("#eamilName").text("메일로 발송된 인증번호를 입력하고 버튼을 누르세요");
                       			$('#verText').val("");
                       			$('#verifingCode').slideDown();
               				});
               			}
               		});
           		}else{
           			$("#eamilName").text("사용할 수 없는 형식의 메일입니다");
           			$("input[name=m_email]").val("");
           		}
           	});
           	$('#verCodeBtn').on('click', function(){
           		if(pwCode==$('#verText').val()){
           			$("#eamilName").text("");
           			$('#surplusForm').slideDown();
           			$('#verifingCode').slideUp();
           		}else{
           			$("#eamilName").text("인증번호가 맞지 않습니다");
           			$('#verText').val("");
           		}
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
               			if(resp==true){
                   			$("#phoneName").text("중복되는 번호입니다");
                   			$("input[name=m_phone]").val("");
               			}else{
                   			$("#phoneName").text("");
               			}
               		});
           		}else{
           			$("#phoneName").text("형식에 맞지 않는 번호입니다");
           			$("input[name=m_phone]").val("");
           		}
           	});
           	var thisYear = new Date().getFullYear();
           	$("#date").on("blur", function(){
               	console.log(thisYear);
               	console.log(thisYear-15);
               	console.log($('#date').val().substr(0,4));
           		if($('#date').val().substr(0,4) <= thisYear-15){
           			$("#birthCheck").text("");
           		}else{
               		$("#birthCheck").text(thisYear-15 + "년도 이상 출생자부터 가입 가능합니다");
           			$("#date").val("");
           		}
           	});
       		$('#joinSubmit').on('click', function(){
           		if($('#ex_file').val()!=""){
           			if($('.inputStuff').val()!="" && $('#zonecode').val()!="" && $('#date').val()!="" && $('#customSwitch').is(":checked")){
               			var con = confirm('이대로 제출하시겠습니까?');
        				if(con){
	                   		$('.formSubmit').submit();	
                   		}
           			}else{
           				alert('다시 확인 후 제출하세요');
           			}
           		}else{
       				$('html, body').stop().animate({scrollTop:$(".filebox").offset().top-30}); 
           			$("#fileName").text("프로필 사진이 선택되지 않았거나 이미지 파일이 아닙니다");
           		}
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
				      <img src="resources/img/join1.jpg" align="bottom" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/join2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/join3.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
<!-- 	contents -->
	<div class="container-fluid my">
		<div id="row my">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pl-3 pr-3 pb-4 m-auto my">
				<div class="blockSign">
			        <div id="formContent">
			        	<p class="loginForm font-weight-bold pt-2">Join Us</p>
			            <div class="tab-content">
			                <div id="signin">
			                    <h3 class="m-3 font-weight-bold text-dark pt-4">나의 정원 회원가입</h3>
			                    <h6 class="pt-2 pb-4 text-muted mr-2 ml-2">나만의 정원을 개설하고 그곳에서 재배된 작물들을 만나 보세요!</h6>
			                    <form class="pl-5 pr-5 formSubmit" action="joinSubmit" method="post" enctype="multipart/form-data">
			                    	<div class="filebox"> 
			                    		<div class="profile"><img id="p_image" src="resources/img/profile.png" width="130" height="130"></div>
			                    		<label for="ex_file">프로필&#x02295;</label> 
			                    		<input type="file" id="ex_file" name="ex_file" accept='image/jpeg,image/gif,image/png' />
			                    		<p class="onblur" id="fileName"></p>
			                    	</div>		
			                        <input type="text" placeholder="나만의 정원 이름을 지어주세요" class="fadeIn inputStuff" name="m_garden">
			                        	<span class="onblur" id="gardenName"></span>
			                        <input type="text" placeholder="사용자 이름을 입력하세요" class="fadeIn inputStuff" name="m_name">
			                        	<span class="onblur" id="userName"></span>
			                        <input type="email" placeholder="사용할 메일주소를 입력하세요" class="fadeIn inputStuff" name="m_email">
			                        	<div class="onblur" id="eamilName"></div>
			                        	<button type="button" id="verMailBtn" class="m-1 btn">메일 인증번호 받기</button><br>
			                      <div id="verifingCode">  	
			                        <input type="password" placeholder="인증번호를 입력하세요" id="verText" class="fadeIn inputStuff50">	
			                        	<button type="button" id="verCodeBtn" class="btn">인증하기</button>
			                      </div>  	
<!-- 			             surplusForm -->
			                      <div id="surplusForm">  	
			                        <input type="password" placeholder="영문, 숫자  8자리 이상을 조합해 비밀번호를 입력하세요" class="fadeIn inputStuff" name="m_pw">
			                        	<span class="onblur" id="pwName"></span>
			                        <input type="password" placeholder="입력하신 비밀번호를 확인하세요" id="password" class="fadeIn inputStuff">
			                        	<span class="onblur" id="pwCheck"></span>
			                        <input type="text" placeholder="휴대폰 번호를 입력하세요 ex)010-000-0000" class="fadeIn inputStuff" name="m_phone">
			                        	<span class="onblur" id="phoneName"></span>
			                        <div class="postCode" id="postCode">
			                        <input type="text" placeholder="우편번호를 검색하세요" class="fadeIn inputStuff" id="zonecode" name="m_zipcode" readonly/>
			                        	<button type="button" id="joinBtn" class="mb-3 btn" onclick="sample6_execDaumPostcode()"><img src="resources/img/post.png" width="38" height="36"></button>
			                        	<div id="addressSet"></div>
			                        </div>	
		                        	<p class="fontGreen mt-3">생년월일과 성별을 입력하세요</p>
		                        		<span class="onblur" id="birthCheck"></span>
	                        		<input type="date" id="date" class="fadeIn inputStuff mb-2" name="m_birth">
			                        <div class="custom-control custom-radio custom-control-inline ml-3">
									  <input type="radio" id="customRadioInline1" value="여성" name="m_gender" class="custom-control-input" checked/>
									  <label class="custom-control-label" for="customRadioInline1">여성</label>
									</div>
									<div class="custom-control custom-radio custom-control-inline">
									  <input type="radio" id="customRadioInline2" value="남성" name="m_gender" class="custom-control-input">
									  <label class="custom-control-label" for="customRadioInline2">남성</label>
									</div>
									<div class="custom-control custom-switch mt-3 mb-3">
									  <input type="checkbox" class="custom-control-input" id="customSwitch">
									  <label class="custom-control-label" for="customSwitch">서비스 이용약관, 개인정보취급방침을 모두 확인했으며 이에 동의합니다</label>
									</div>
								</div>	
			                        <input type="reset" class="mt-4 mb-1" value="다시쓰기">
			                        <input type="button" value="가입하기" id="joinSubmit">
			                    </form>
								<!-- 	address js start-->
								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
								<script src="resources/js/zipcode.js"></script>
								<!-- 	address js end-->
		                        <p id="formFooter">
		                        	<a href="#" class="text-muted" data-toggle="modal" data-target="#exampleModalCenter">서비스 이용약관 및 개인정보취급방침</a>
		                       	</p>
		                       	<!-- Modal -->
								<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalCenterTitle">서비스 이용약관 및 개인정보취급방침</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body text-left">
								         <jsp:include page="/WEB-INF/views/module/contract.jsp"/>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
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