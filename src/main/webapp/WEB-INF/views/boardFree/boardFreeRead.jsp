<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<title>글읽기</title>
</head>
<style>
#titleImg {
	overflow: hidden;
	padding: 0px;
	margin-bottom: 50px;
}

#title {
	border: 0px solid #9e9e9e;
	border-radius: 5px;
	height: 50px;
	line-height: 45px;
	margin: 0px auto 30px auto;
	font-size: 25px;
	font-weight: bold;
}

hr {
	position: relative;
	right: 15px;
	width: 102.7%;
	border: 0.5px solid #9e9e9e;
}

#info {
	width: 100%;
	text-align: right;
	margin-bottom: 18px;
}

.container {
	width: 100%;
}

#info>span {
	margin: 0px 20px;
}

#info img, .rWriter img {
	margin: 0px 5px;
	width: 25px;
	height: 25px;
}

#content {
	border: 1px solid #9e9e9e;
	border-radius: 5px;
	height: 500px;
	width: 100%;
	margin: 0px auto;
	padding: 15px;
	overflow: auto;
}

.comment {
	margin-top: 30px;
	border: 1px solid #9e9e9e;
	height: 100px;
	width: 100%;
	text-align: center;
}

.commentList {
	margin: 20px 0px;
}

.rWriter {
	margin-right: 25px;
	font-weight: bold;
}

.rWritedate {
	color: grey;
}

.rContent {
	margin: 10px 5px;
}

#rContentWrite {
	padding: 15px;
	text-align: left;
}

#navi {
	width: 100%;
	text-align: center;
}

.footBtn {
	text-align: center;
	margin: 40px 0;
}

#submitBtn {
	height: 80px;
	width: 100px;
	margin: 40px 40px;
}

#back {
	height: 40px;
}

#submitBtn, #back {
	width: 100px;
	background-color: #44b27d;
	color: white;
	border: 0px;
}

#submitBtn:hover, #back:hover {
	background-color: #b4d9b5;
	border: 0px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"></jsp:include>
	<div class=col-12 id=titleImg>
		<img src="resources/img/boardFree.png">
	</div>
	<div class=container>
		<div class=row>
			<div id=title class=col-12>
				${page.bf_title }
				<hr>
			</div>

			<div id=info>
				<span id=writer><img src="resources/img/boardFreeWriter.png">${page.bf_writer }</span>
				<span id=writedate><img
					src="resources/img/boardFreeWriteDate.png"> <fmt:formatDate
						pattern="yyyy-MM-dd HH:mm" value="${page.bf_writedate }" /></span> <span
					id=viewcount><img src="resources/img/boardFreeView.png">${page.bf_viewcount }</span>
			</div>

			<div id=content class=col-12>${page.bf_content }</div>

			<div class="col-12 commentList">
				<c:forEach var="tmp" items="${list }">
					<span class=rWriter> <img
						src="resources/img/boardFreeCmtWriter.png">${tmp.cf_name }
					</span>
					<span class=rWritedate><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm:ss" value="${tmp.cf_writedate}" /></span>
					<div class=rContent>${tmp.cf_comment }</div>
					<hr>
				</c:forEach>
			</div>
			<div class="col-12" id=navi>
				<c:forEach var="navi" items="${navi}">
					<span>${navi }</span>
				</c:forEach>
			</div>

			<div class="col-10 comment" contenteditable id=rContentWrite></div>
			<div class="col-2">
				<button type="button" class="btn" id="submitBtn">댓글 등록</button>
			</div>
			<div class="col-12 footBtn">
				<button type="button" class="btn" id=back>목록으로</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"></jsp:include>
	<script>
		$("#back").on("click", function() {
			location.href = "boardFreeList?page=1";
		})

		$("#submitBtn").on("click", function() {
			if($("#rContentWrite").text() == ""){
				alert("댓글을 입력해주세요.");
			}else{			
			 $.ajax({
				 url:"freeCmtWrite",
				 type:"post",
				 data:{				 
					cf_bf_no:${page.bf_no},
					content:$("#rContentWrite").text(),
					cmtPage:$("#naviBtn").text()
				 } 
			 }).done(function (resp) {	
				 console.log(resp);
				console.log(resp.list);
				 $("#rContentWrite").text(""); //썼던 댓글 지우기		
				 $(".commentList").html("");
				 var cmtList = "";
				 for(var i=0; i<list.length; i++){			
					 var cmtList = cmtList + "<span class=rWriter><img src='resources/img/boardFreeCmtWriter.png'>"+resp.map.list[i].cf_name+"</span>"
							+"<span class=rWritedate>"+resp.map.list[i].cf_stringdate+ "</span><div class=rContent>"+resp.map.list[i].cf_comment+"</div><hr>";				 					
				 }
				 console.log(cmtList);
				 $(".commentList").html(cmtList);
			})
			}
		})
	</script>
</html>