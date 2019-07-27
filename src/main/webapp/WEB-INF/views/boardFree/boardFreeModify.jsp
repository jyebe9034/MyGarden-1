<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"></jsp:include>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<title>나의 정원 - 글 수정</title>
</head>
<style>
#titleImg {
	overflow: hidden;
	padding: 0px;
	margin-bottom: 50px;
}

#title {
	border: 1px solid #9e9e9e;
	border-radius: 5px;
	height: 50px;
	line-height: 45px;
	margin: 0px auto 30px auto;
	background-color: #f5f5f5;
}

#titleExplain, #green {
	color: #44b27d;
	font-weight: bold;
}

.container {
	width: 100%;
}

#content {
	height: 600px;
	width: 100%;
	margin: 0px auto;
}

.note-editor, .note-toolbar {
	border-radius: 5px;
	width: 100%;
}

.note-editable{
background-color: #f5f5f5 !important;
}

#submit, #back {
	width: 100px;
}

.footBtn {
	text-align: center;
	margin: 40px 0;
}

#submitBtn, #back {
	background-color: #44b27d;
	color: white;
	border: 0px;
	width: 100px;
	height: 40px;
}

#submitBtn:hover, #back:hover {
	background-color: #b4d9b5;
	border: 0px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"></jsp:include>
	<div class=col-12 id=titleImg>
		<img src="resources/free/boardFree.jpg">
	</div>
	<div class=container>
		<form action="boardFreeModifyProc" method="post" id="freeForm">
			<div class=row>
				<p id=titleExplain>레시피를 공유해보세요!</p>
				<input type=text id=title class=col-12 maxlength="30" name=bf_title>
				<div id=content class=col-12 contenteditable>${dto.bf_content}</div>
				<input type="hidden" id=sendContent name=bf_content>
				<input type="hidden" name=no value=${dto.bf_no }>
				<p id=contentExplain>
					<img src="/resources/free/boardFreeWarning.png"> 게시글 작성 시 <span
						id=green>회원님의 소중한 개인정보를 포함하지 않도록</span> 주의 부탁드립니다.
				</p>
				<div class="col-12 footBtn">
					<button type="button" class="btn" id="submitBtn">수정하기</button>
					<button type="button" class="btn" id=back>뒤로가기</button>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"></jsp:include>
	<script>
		var title = '${dto.bf_title }';
		$("#title").val(title);
		
		$("#title").on("keyup", function() {
			var count = $(this).val().length;
			$("#titleCount").text("(" + count + " / 30)");
			if (count == 30) {
				alert("제목은 최대 30자 까지 쓸 수 있습니다.");
			}
			;
		})
		
		$("#back").on("click", function() {
			location.href = "boardFreeList?page=1";
		})
// 썸머노트 : 원래 값을 가져올때는 그냥 썸머노트만들던 코드 사이에 넣어야한다.
// 		var content = '${dto.bf_content}';
// 		console.log(content);
// 		$(".note-editable").html(content);
		
		$(document).ready(function() {	
			$('#content').summernote({
				tabsize : 5,
				height : 500,
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
						}
					}
				}
			})
		});

		function sendFile(file, el) {
			var formdata = new FormData();
			formdata.append('image', file);
			$.ajax({
				data : formdata,
				type : "POST",
				url : "boardFreeFileUpload",
				cache : false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false
				}).done(function(resp) {
					$(".note-editable").append("<img src="+resp+">")
				})
		}

		
		$("#submitBtn").on("click", function() {
			$("#sendTitle").val($("#title").text());
			$("#sendContent").val($(".note-editable").html());
			if ($("#title").val() == "" || $("#sendContent").val() == "") {
				alert("제목 또는 내용을 입력해주세요.");
			}
			$("#freeForm").submit();
		})
	</script>
</html>