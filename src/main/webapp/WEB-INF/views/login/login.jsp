<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 로그인</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>	
.imageContainer{height:300px; overflow:hidden;}
.carousel-inner{margin-top:-120px;}
.form-check-label, #formFooter{font-size:15px;}
.socialButton{width:90%; height:50px; box-shadow: 0 10px 30px 0 #666;}
.joinSuggestion{color:#4f9c87; border:1px solid #4f9c87; margin-top:-8px;}
.joinSuggestion:hover{color:#fff; border:1px solid #4f9c87; background:#4f9c87;}
span.mr-2{font-size:25px;}
.event{background:rgba(0,0,0,0.3); font-family:Black Han Sans; font-size:18px; width:30%; bottom:20%; right:25%;}
.tab-group a {
  text-decoration: none;
  color: #1ab188;
  transition: .5s ease;
}
.tab-group a:hover {
  color: #179b77;
}
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
  max-width: 500px;
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
.tab-group {
  list-style: none;
  padding: 0;
  margin: 0 0 40px 0;
}
.tab-group:after {
  content: "";
  display: table;
  clear: both;
}
.tab-group li a {
  display: block;
  text-decoration: none;
  padding: 15px;
  background:#65a896;
  color: #e3f5f2;
  font-size: 20px;
  float: left;
  width: 50%;
  text-align: center;
  cursor: pointer;
  transition: .5s ease;
}
.tab-group li a:hover {
  opacity:0.8;
  color: #ffffff;
}
.tab-group .active a {
  background:#399078;
  color: #ffffff;
}
.tab-content > div:last-child {
  display: none;
}
/* label { */
/*     position:absolute; */
/*     transform:translateY(6px); */
/*     left:13px; */
/*     color:rgba($white,.5); */
/*     transition:all 0.25s ease; */
/*     -webkit-backface-visibility: hidden; */
/*     pointer-events: none; */
/*     font-size:22px; */
/*   } */
/*   label.active { */
/*     transform:translateY(50px); */
/*     left:2px; */
/*     font-size:14px; */
/*     .req { */
/*       opacity:0; */
/*     } */
/*   } */
input[type=button], input[type=submit], input[type=reset]  {
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
input[type=text],input[type=email], input[type=password]{
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
			  $('.joinSuggestion').on('click', function(){
				  $(location).attr('href', 'join');
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
				      <img src="resources/img/login1.jpg" align="bottom" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/login2.jpg" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="resources/img/login3.jpg" class="d-block w-100" alt="...">
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
<!-- 	contents -->
	<div class="container-fluid my">
		<div id="row my">
			<div class="col-lg-6 col-md-10 col-sm-10 col-xs-6 loginForm pl-3 pr-3 pb-5 m-auto my">
				<div class="blockSign">
			        <div id="formContent">
			            <ul class="tab-group">
			                <li class="tab active font-weight-bold"><a href="#signin">Login</a></li>
			                <li class="tab font-weight-bold"><a href="#signup">Social Login</a></li>
			            </ul>
			            <div class="tab-content">
			                <div id="signin">
			                    <h3 class="m-3 font-weight-bold text-dark">나의 정원 로그인</h3>
			                    <form>
			                        <input type="email" required autocomplete="off" placeholder="이메일을 입력하세요" id="signin"
			                            class="fadeIn" />
			                        <input type="password" required autocomplete="off" placeholder="비밀번호를 입력하세요" id="password"
			                            class="fadeIn mb-4">
			                        <div class="fadeIn mb-2">
								      <label><input type="checkbox" class="form-check-input text-muted" id="exampleCheck1">이 계정을 기억합니다</label>
								    </div>
			                        <input type="submit" class="font-weight-bold mt-2" value="로그인"></input>
			                        <p id="formFooter"><a href="#" class="text-muted">아이디 / 비밀번호 찾기</a></p>
			                    </form>
			                </div>
			                <div id="signup">
			                    <h3 class="m-3 font-weight-bold text-dark">나의 정원 소셜로그인</h3>
			                    <form class="p-4">
			                        <input type="button" class="socialButton mb-3" value="네이버">
			                        <input type="button" class="socialButton mb-3" value="카카오">
			                        <input type="button" class="socialButton mb-3" value="구글">
			                        <input type="button" class="socialButton mb-5" value="깃허브">
			                    </form>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>	
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center p-4 my">
				<span class="mr-2 font-weight-bold text-dark">아직 정원을 개설하지 않으셨나요?</span>
				<button type="button" class="btn btn-lg joinSuggestion font-weight-bold">가입하고 정원 개설하러 가기</button>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-112 col-xs-12 text-center pb-5 my">
				<img src="resources/img/cookie.jpg" width="60%" class="position-relative rounded-lg">
				<span class="position-absolute event text-left font-weight-bold p-3">유기농 채소로 만들어진 비건 쿠키 나눔 이벤트&nbsp;&nbsp;<br><a href="#">체험하기 go &#x0226B;</a></span>
			</div>
		</div>
	</div>
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
</body>
</html>