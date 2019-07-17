<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<title>Chat</title>
<style>
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
	}
	.msg{
		text-align : center;
		color : white;
		background-color : #7657b5;
		padding-top : 10px;
		padding-bottom : 10px;
	}
	#firstmsg{
		font-size : 15px;
	}
	#secondmsg{
		font-size : 12px;
	}
	#message{
		width : 248px;
		height : 95px;
		border-bottom-left-radius: 10px;
		line-height : 95px;
		border : 0.5px solid #cacbcc;
	}
	#send{
		width : 97px;
		height : 95px;
		background-color: #b4d9b5;
		color : white;
		border : 0px;
		border-radius : 5px;
	}
</style>
</head>
<body>
	<div id="chatBorder">
		<div id="firstmsg" class="msg">안녕하세요! 나의 정원 입니다.</div>
		<div id="secondmsg" class="msg">자유롭게 질문해 주시면 몇분 내에 답변해드립니다.<br>(상담 시간은 월-금 10:00 ~ 18:00)</div> 
		<div id="chatContents"></div>
	</div>
	<input type="text" id="message" placeholder="메세지 전송">
	<input type="button" id="send" value="Send">
	
	<script>
		var socket = new SockJS("/webchat");
		var client = Stomp.over(socket);
		
		client.connect({}, function(resp){// 서버로부터 response된 정보를 받아오는 부분
			client.subscribe("/response", function(msg){
				var line = $("<div class='messages'></div>");
				var result = JSON.parse(msg.body);
				line.append(result.name + "님의 메세지 : " + result.message);
				$("#chatContents").append(line);
				$("#chatContents").scrollTop($("#chatContents")[0].scrollHeight);
			});
		}); 
		
		$("#send").on("click", function(){ // 클라이언트에서 서버로 메세지를 보내는 부분
			var msg = $("#message").val();
			$("#message").val("");
			$("#message").focus();
			client.send("/app/chat", {}, JSON.stringify({message:msg})); 
			// request는 무조건 String 타입으로 넘어감. 여기에서의 chat이 ChatController로 매핑돼.
		})
		
		$("#message").keyup(function(key){
			if(key.keyCode == 13){
				$("#send").click();
			}
		})
	</script>
</body>
</html>