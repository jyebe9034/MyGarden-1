<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - Loading...</title>  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>	
body {
  width: 100vw;
  height: 100vh;
  background: white;
  justify-content: center;
  align-items: center;
}

.content {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.wrapper {
  display: flex;
  align-self: center;
  width: 5rem;
  height: 5rem;
  justify-content: space-around;
  -webkit-transform: rotate(180deg);
          transform: rotate(180deg);
}

.load {
  width: 1.5rem;
  height: .75rem;
  margin-right: .4rem;
  background: #EAF7D9;
  position: relative;
  box-shadow: 0 -2px 10px rgba(40, 58, 16, 0.5);
}
.load:before {
  width: 0;
  height: 0;
  border-left: 1rem solid transparent;
  border-right: 1rem solid transparent;
  border-top: 1.5rem solid #EAF7D9;
  position: absolute;
  top: .5rem;
  left: -.75rem;
  content: '';
}
.load:after {
  width: 0;
  height: 0;
  border-left: .75rem solid transparent;
  border-right: .75rem solid transparent;
  border-top: 0.5rem solid #EAF7D9;
  position: absolute;
  top: 1.5rem;
  left: -.5rem;
  content: '';
}
.load.load-pesto {
  background: #8EA86C;
  -webkit-animation: wind 1s infinite;
          animation: wind 1s infinite;
  -webkit-animation-delay: 1s;
          animation-delay: 1s;
  z-index: 2;
}
.load.load-pesto:before, .load.load-pesto:after {
  border-top: 2rem solid #8EA86C;
}
.load.load-water {
  background: #283A10;
  -webkit-animation: wind 1.5s infinite;
          animation: wind 1.5s infinite;
}
.load.load-water:before, .load.load-water:after {
  border-top: 2rem solid #283A10;
}
.load.load-mint {
  background: #C3D6AA;
  -webkit-animation: wind 1s infinite;
          animation: wind 1s infinite;
  -webkit-animation-delay: .5s;
          animation-delay: .5s;
}
.load.load-mint:before, .load.load-mint:after {
  border-top: 2rem solid #C3D6AA;
}
.load.load-cilantro {
  background: #EAF7D9;
  -webkit-animation: wind 1.5s infinite;
          animation: wind 1.5s infinite;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
  z-index: 3;
}
.load.load-cilantro:before, .load.load-cilantro:after {
  border-top: 2rem solid #EAF7D9;
}
.load.load-green {
  background: #4D642D;
  -webkit-animation: wind 1s infinite;
          animation: wind 1s infinite;
}
.load.load-green:before, .load.load-green:after {
  border-top: 2rem solid #4D642D;
}

@-webkit-keyframes wind {
  0% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  50% {
    -webkit-transform: rotate(3deg);
            transform: rotate(3deg);
    -webkit-transform-origin: center top;
            transform-origin: center top;
  }
  100% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
}

@keyframes wind {
  0% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
  50% {
    -webkit-transform: rotate(3deg);
            transform: rotate(3deg);
    -webkit-transform-origin: center top;
            transform-origin: center top;
  }
  100% {
    -webkit-transform: rotate(0);
            transform: rotate(0);
  }
}
p {
  color: #666;
  margin-left: 10px;
}
</style>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="content">
  <div class="body">
    <div class="wrapper">
      <div class="load load-cilantro"></div>
      <div class="load load-green"></div>
      <div class="load load-pesto"></div>
      <div class="load load-water"></div>
      <div class="load load-mint"></div>
    </div>
    <div>
      <p>Loading...  </p>
    </div>
  </div>
</div>
<script>
	$('.locontent').delay(3000);
	location.href="/mypageFirst";
</script>
<!-- partial -->
</body>
</html>