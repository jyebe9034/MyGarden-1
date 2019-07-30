<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
input[type=email]{
  background:#D1E5DF;
  border: 2px solid #D1E5DF;
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
           			$("#userName").text("2~12단어로 이루어진 영어, 한글만 가능합니다");
           			$("input[name=m_name]").val("");
           		}
           	});
       		$('#joinSubmit').on('click', function(){
       			if($("input[name=m_garden]").val()!="" && $('input[name=m_email]').val()!="" && $('#customSwitch').is(":checked")){
           			var con = confirm('이대로 제출하시겠습니까?');
    				if(con){
                		$('.formSubmit').submit();	
               		}
       			}else{
       				alert('다시 확인 후 제출하세요');
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
			                    <h3 class="m-3 font-weight-bold text-dark pt-4">나의 정원 소셜회원가입</h3>
			                    <h6 class="pt-2 pb-4 text-muted mr-2 ml-2">사이트 이용에 필요한 인증과 최소한의 정보를 입력하세요</h6>
			                    <form class="pl-5 pr-5 formSubmit" action="socialJoinSubmit" method="post">		
			                        <input type="text" placeholder="나만의 정원 이름을 지어주세요" class="fadeIn inputStuff" name="m_garden">
			                        	<span class="onblur" id="gardenName"></span>
			                        <input type="text" placeholder="사용자 이름을 입력하세요" class="fadeIn inputStuff" name="m_name">
			                        	<span class="onblur" id="userName"></span>
			                        <input type="email" value="${loginId }" class="fadeIn inputStuff" name="m_email" readonly>
									<div class="custom-control custom-switch mt-3 mb-3">
									  <input type="checkbox" class="custom-control-input" id="customSwitch">
									  <label class="custom-control-label" for="customSwitch">서비스 이용약관, 개인정보취급방침을 모두 확인했으며 이에 동의합니다</label>
									</div>
			                        <input type="reset" class="mt-4 mb-1" value="다시쓰기">
			                        <input type="button" value="가입하기" id="joinSubmit">
			                    </form>
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