<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
<title>Document</title>
<style>


body {
	background: linear-gradient(180deg, lighten(#FDC62E, 30%), white);
	height: 100%;
	background-repeat: no-repeat;
}

.container {
	width: 80%;
	position: absolute;
	top: 0;
	bottom: 0;
	display: -webkit-flex;
	display: flex;
	align-items: center;
	justify-content: center;
}

.sun {
	-webkit-animation: ROTATE 20s infinite linear;
	animation: ROTATE 20s infinite linear;
	box-shadow: 0 0 60px 60px #ffeccc;
}

.shine {
	width: 100px;
	height: 100px;
	opacity: 1;
	background: radial-gradient(circle, #FDC62E, #FDB000);
	transform: rotate(15deg);
}

.circle {
	width: 100px;
	height: 100px;
	background: radial-gradient(circle, #FFF, #FDC62E);
	border-radius: 50%;
	transform: scale(1.2);
	opacity: 0.4;
}

@-webkit-keyframes ROTATE { 
0% {
	transform: rotate(0deg);
}

0%{
transform:rotate(360deg);
}
}

@keyframes ROTATE { 
0% {
	transform: rotate(0deg);
}
0%{
transform:rotate(360deg);                
}
}
</style>
</head>
<body>
	<div class="container">
		<div class="sun">
			<div class="shine">
				<div class="shine">
					<div class="shine">
						<div class="shine">
							<div class="shine">
								<div class="shine">
									<div class="circle"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>