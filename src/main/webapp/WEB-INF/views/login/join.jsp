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
.filebox label, #joinBtn{ display: inline-block; padding: .5em .75em; color: #4f9c87; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #4f9c87; border-bottom-color: #4f9c87; border-radius: .25em; }
#joinBtn{height:57px; margin-top:13px;} 
.filebox input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
.profile{width:130px; height:130px; border-radius:50%; background:#b8d7cf; margin:10px auto; padding-top:15px;}
.fontGreen{font-weight:bold; color:#4f9c87;}
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
  width: 85%;
  border: 2px solid #f6f6f6;
  -webkit-transition: all 0.5s ease-in-out;
  -moz-transition: all 0.5s ease-in-out;
  -ms-transition: all 0.5s ease-in-out;
  -o-transition: all 0.5s ease-in-out;
  transition: all 0.5s ease-in-out;
  -webkit-border-radius: 5px 5px 5px 5px;
  border-radius: 5px 5px 5px 5px;
}
.inputMd{width:65%;}
.inputSm{width:55%;}
.inputStuffOthers, #date{
  background-color: #f6f6f6;
  border: none;
  color: #0d0d0d;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px;
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
			$('.carousel').carousel({
				  interval: 5000
				});
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
			  $('.tab a').on('click', function (e) {
			    e.preventDefault();
			    $(this).parent().addClass('active');
			    $(this).parent().siblings().removeClass('active');
			    target = $(this).attr('href');
			    $('.tab-content > div').not(target).hide();
			    $(target).fadeIn(600);
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
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pl-3 pr-3 pb-5 m-auto my">
				<div class="blockSign">
			        <div id="formContent">
			        	<p class="loginForm font-weight-bold pt-2">Join Us</p>
			            <div class="tab-content">
			                <div id="signin">
			                    <h3 class="m-3 font-weight-bold text-dark pt-4">나의 정원 회원가입</h3>
			                    <h6 class="pt-2 pb-4 text-muted">나만의 정원을 개설하고 그곳에서 재배된 작물들을 만나 보세요!</h6>
			                    <form>
			                    	<div class="filebox"> 
			                    		<div class="profile"><img src="resources/img/profile.png"></div>
			                    		<label for="ex_file">프로필&#x02295;</label> 
			                    		<input type="file" id="ex_file"> 
			                    	</div>
			                        <input type="text" required placeholder="나만의 정원 이름을 지어주세요" class="fadeIn inputStuff" />
			                        <input type="text" required placeholder="사용자 이름을 입력하세요" class="fadeIn inputStuff">
			                        <input type="email" required placeholder="사용하실 메일주소를 입력하세요" class="fadeIn inputStuff">
			                        <input type="password" required placeholder="영문, 숫자  8자리 이상을 조합해 비밀번호를 입력하세요" class="fadeIn inputStuff">
			                        <input type="password" required placeholder="입력하신 비밀번호를 확인하세요" id="password" class="fadeIn inputStuff">
			                        <input type="text" required placeholder="휴대폰 번호를 입력하세요 ex)010-000-0000" class="fadeIn inputStuff">
			                        <input type="text" required placeholder="버튼을 눌러 우편번호를 검색하세요" class="fadeIn inputStuffOthers inputMd">
			                        	<button type="button" id="joinBtn" class="mb-3">우편번호 검색</button><br>
		                        	<label for="date" class="fontGreen">&nbsp;생년월일을 입력하세요&nbsp;&nbsp;</label><input type="date" id="date" class="fadeIn inputSm"/><br>
		                        	<div class="text-left ml-5 mt-2 mb-2 mr-5">
			                        	<span class="text-left fontGreen">&nbsp;&nbsp;성별을 입력하세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				                        <div class="custom-control custom-radio custom-control-inline">
										  <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input">
										  <label class="custom-control-label" for="customRadioInline1">여성</label>
										</div>
										<div class="custom-control custom-radio custom-control-inline">
										  <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input">
										  <label class="custom-control-label" for="customRadioInline2">남성</label>
										</div>
		                        	</div>
									<div class="custom-control custom-switch mt-4 mb-4">
									  <input type="checkbox" class="custom-control-input" id="customSwitch1">
									  <label class="custom-control-label" for="customSwitch1">서비스 이용약관, 개인정보취급방침을 모두 확인했으며 이에 동의합니다</label>
									</div>
			                        <input type="reset" class="mb-1" value="다시쓰기">
			                        <input type="submit" value="가입하기">
			                        <p id="formFooter">
			                        	<a href="#" class="text-muted">서비스 이용약관 /</a>
			                       		<a href="#" class="text-muted">개인정보취급방침</a>
			                       	</p>
			                    </form>
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