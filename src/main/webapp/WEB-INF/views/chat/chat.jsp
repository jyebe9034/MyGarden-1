<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<title>나의 정원 - Chat</title>
<style>
	@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/* 전체 폰트용 코드  */
@font-face {
	font-family: 'Eoe_Zno_L';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_eight@1.0/Eoe_Zno_L.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'S-CoreDream-3Light';
}

	#chatBorder{
		border : 0.5px solid #cacbcc;
		box-sizing : boder-box;
		width : 350px;
		height : 400px;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
		background-color : #e8e4f0;
	}
	#chatContents{
		overflow-y : auto;
		height : 300px;
		padding : 10px;
	}
	.msg{
		text-align : center;
		color : white;
		background-color : #87779e;
		padding-top : 10px;
		padding-bottom : 10px;
	}
	#firstmsg{
		font-size : 15px;
		border-top-left-radius: 10px;
		border-top-right-radius: 10px;
	}
	#secondmsg{
		font-size : 12px;
		padding-bottom : 20px;
	}
	#message{
		width : 248px;
		height : 92px;
		border-bottom-left-radius: 10px;
		line-height : 95px;
		border : 0.5px solid #cacbcc;
		padding : 10px;
		margin-top : 3px;
	}
	#send{
		width : 97px;
		height : 95px;
		background-color: #87779e;
		color : white;
		border : 0px;
		border-radius : 5px;
	}
	.mine{
		margin-bottom : 0;
		text-align : right;
	}
</style>
<script>
// 	$(function(){
// 		$.ajax({
// 			url : "selectChat",
// 			type : "post",
// 			data : ${loginId}
// 		}).done(function(resp){
// 			for(tmp : resp){
// 				console.log(tmp);
// 			}
// 		})
// 	}) 
</script>
</head>
<body>
	<div id="chatBorder">
		<div id="firstmsg" class="msg">안녕하세요!</div>
		<div id="secondmsg" class="msg">문의하시면 몇분 내에 답변해드립니다.</div> 
		<div id="chatContents"></div>
	</div>
	<input type="text" id="message" placeholder="문의 내용을 입력하세요">
	<input type="button" id="send" value="Send">
	
	<script>
		var socket = new WebSocket("ws://192.168.60.22/chatcontrol"); // 이 코드를 통해서 웹소켓이 열림
		
		socket.onmessage = function(msg){ // 콜백함수
			var line = $("<div class='messages'></div>");
			line.append("<div class='answer'>" + msg.data + "</div>");
			$("#chatContents").append(line);
			$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);
		} // 서버로부터 메세지가 도착한 경우
		
		$("#send").on("click",function(){
			var msg = $("#message").val();
			$("#chatContents").append("<p class='mine'>" + msg + "</p>");
			$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);
			$("#message").val("");
			$("#message").focus();
			socket.send("${loginId} : " + msg);
		}) // 서버로 메세지를 보내는 경우
	
		$("#message").keyup(function(key){
			if(key.keyCode == 13){
				$("#send").click();
			}
		})
	</script>
</body>
</html>