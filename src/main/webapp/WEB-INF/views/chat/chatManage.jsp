<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 채팅 관리</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
	.wrapper{
		margin-bottom : 200px;
	}
	#title{
		font-size : 24px;
		text-align : left;
	}
	#chatBox{
		width : 650px;
		margin : auto;
	}
	.messages{
		width : 100%;
	}
	.consumer{
		width : 150px;
		float : left;
	}
	.question{
		width : 400px;
		float : left;
	}
	.answer{
		width : 90px;
		float : left;
	}
</style>
</head>
<body>
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
	<div class="container my wrapper">
		<div class="row text-center mt-5 my">
			
		<jsp:include page="/WEB-INF/views/module/mypage.jsp"/>
		
		
			<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 pt-5 my">
				<div class="list-group">
				  <a href="/mypageFirst" class="list-group-item list-group-item-action">Overview</a>
				  <a href="/mypageInfo" class="list-group-item list-group-item-action">내 정보 수정</a>
				  <a href="orderList" class="list-group-item list-group-item-action">구매 내역</a>
				  <a href="subsList" class="list-group-item list-group-item-action">정기 구독</a>
				  <%-- <c:if test="${grade == 'admin'}"> --%>
				  		<a href="productsAdd" class="list-group-item list-group-item-action">상품 등록</a>
				  		<a href="chatManage" class="list-group-item list-group-item-action currentActive">채팅 문의 관리</a>
				  <%-- </c:if> --%>
				  <a href="/mypageDelete" class="list-group-item list-group-item-action">탈퇴하기</a>
				</div>
			</div>
			<div class="col-lg-9 col-md-12 col-sm-12 col-xs-12 pt-5 my">	
				<div id="title">채팅 문의 관리</div>
				<div id="chatBox">
					<div class="messages">
						<div class="consumer">문의한 사람</div>
						<div class="question">문의 내용</div>
						<div class="answer">답변하기</div>
					</div>
				</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 id="toWhom" class="modal-title" id="exampleModalCenterTitle"></h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div id="message" class="modal-body" contenteditable="true">
			        
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-sm btn-outline-secondary" data-dismiss="modal">취소하기</button>
			        <button id="send" type="button" class="btn btn-sm btn-outline-primary">전송하기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
		</div>
	</div>	
	
<!-- 	footer -->
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>
	
	<script>
		var socket = new WebSocket("ws://192.168.60.22/chatcontrol"); // 이 코드를 통해서 웹소켓이 열림
		
		socket.onmessage = function(msg){ // 콜백함수
			var line = $("<div class='messages'></div>");
			var message = msg.data;
			var arr = message.split(" : ");
			line.append("<div class='consumer'>" + arr[0] + "</div>")
			line.append("<div class='question'>" + arr[1] + "</div>");
			line.append("<button id='temp' type='button' class='btn btn-sm btn-outline-primary answer' data-toggle='modal' data-target='#exampleModalCenter'>답변하기</button>");
			$("#chatBox").append(line);
			/* $("#chatBox").scrollTop($("#chatContents")[0].scrollHeight); */
		} // 서버로부터 메세지가 도착한 경우
		
		$("#send").on("click",function(){
			var id = $("#toWhom").text();
			var msg = $("#message").text();
			socket.send("sdf@gmail.com" + " : " + msg + " : " + id);
		}) // 서버로 메세지를 보내는 경우
		
		$(document).on("click", "#temp", function(){
			var tmp = $(this).prev().prev().text();
			console.log(tmp);
			$("#toWhom").html(tmp);
		})
	
		/* $("#message").keyup(function(key){
			if(key.keyCode == 13){
				$("#send").click();
			}
		}) */
	</script>
</body>
</html>