	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"></jsp:include>

<title>자유게시판</title>
</head>
<style>
#titleImg {
	overflow: hidden;
	height: 600px;
	padding: 0px;
	margin-bottom: 50px;
	padding: 0px;
}

.content {
	width: 100%;
	height: 130px;
	text-align: left;
	line-height: 75px;
	margin-bottom: 40px;
}

.realImg {
	margin-top: 5px;
	padding: 0px;
	width: 100%;
	text-align: center;
}

.img img {
	max-width: 100%;
	max-height: 150px;
	border-radius: 5px;
}

.title {
	font-size: 20px;
	font-weight: bold;
	margin-left: 28px;
	cursor: pointer;
}

.title:hover {
	text-decoration: underline;
}


hr {
	margin: 0px;
	width: 100%;
	/* border: 1px solid #9e9e9e; */
}

#write {
	background-color: #44b27d;
	color: white;
	border: 0px;
}

#write:hover {
	background-color: #b4d9b5;
	border: 0px;
}

.otherContents>span {
	margin: 0px 20px;
}

.otherContents img {
	margin: 0px 5px;
}

.footBtn {
	text-align: right;
	margin: 40px 0;
}

#freeSearch {
	text-align: left;
}

#naviPlace {
	width: 100%;
	height: 32px;
	text-align: center;
}

.naviBtn {
	width: 30px;
	text-align: center;
	color: #44b27d;
	font-size: 20px;
	font-weight: bold;
	margin: 0px 15px;
	cursor: pointer;
}

.naviBtn:hover {
	text-decoration: underline;
	color: #c1b1fc;
}
</style>
<body>
	<div class=col-12 id=titleImg>
		<img src="resources/free/boardFree.png">
	</div>

	<div class=container>
		<div class=listOne>
		<c:forEach var="tmp" items="${list}">
			<div class="row content">
				<div class="col-2 realImg">
					<div class=tmpImg>${tmp.bf_content }</div>
					<div class=img></div>
				</div>

				<div class="col-10">
					<div class=title>
						${tmp.bf_title }
						<hr size="3">
					</div>
					<input type=hidden value=${tmp.bf_no }>
					<div class=otherContents>
						<span class=writer><img
							src="resources/free/boardFreeWriter.png">${tmp.bf_writer }</span> <span
							class=writeDate><img
							src="resources/free/boardFreeWriteDate.png">${tmp.bf_stringdate }</span>
						<span class=viewCount><img
							src="resources/free/boardFreeView.png">${tmp.bf_viewcount }</span>
						<span class=comment><img
							src="resources/free/boardFreeReply.png">${tmp.bf_cmtcount}</span>
					</div>
				</div>
				<hr size="3">
			</div>
		</c:forEach>
	</div>
		<div id="freeSearch">
			<form class="form-inline my-2 my-lg-0">
				<div class="input-group freeSearch">
					<input class="form-control freeSearch" type="search"
						placeholder="필요한 레시피 검색" aria-label="Search"
						aria-describedby="basic-addon2" id=searchVal>
					<div class="input-group-append">
						<button class="btn btn-outline-secondary mr-4" type="button"
							id="freeSearchBtn">&telrec;</button>
					</div>
				</div>
			</form>
		</div>

		<div id=naviPlace>
			<c:forEach var="tmp" items="${navi }">
				<span class=naviBtn>${tmp}</span>
			</c:forEach>
		</div>

		<c:if test="${loginId!=null}">
			<div class="col-12 footBtn">
				<button type="button" class="btn" id=write>글쓰기</button>
			</div>
		</c:if>
	</div>
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"></jsp:include>
	<script>

	$(".tmpImg").each(function (i, item) {
		var tmp = $(this).html();
		var regex = /(\/re.+?png)/;
		var result = regex.exec(tmp);
			$(".tmpImg").hide(); //자꾸 튀어나와서 숨겼음ㅡㅡ
			if(result!=null){
			$(this).next().html("<img src='"+result[1]+"'>");
			}else{
				$(this).next().html("<img src='/resources/free/noImg.png'>");
			}
	})

		$(".title").on("click",function(){
			var seq = $(this).next().val();
			$(location).attr("href","boardFreeRead?no="+seq);
		})
	
		$("#write").on("click", function() {
			location.href = "boardFreeWrite";
		})
		
		$(".naviBtn").on("click",function(){
			var page = $(this).text();
			if(page == ">"){
				page = parseInt($(this).prev().text())+1;
				console.log(page);
			}else if(page == "<"){
				page = parseInt($(this).next().text())-1;
				console.log(page);
			}
			$(location).attr("href","boardFreeList?page="+page);
		})
		
		
		$(".naviBtn").each(function(i,item){
			if($(this).text() == ${page}){
				$(this).css("color","#c1b1fc");
		}
		})
		
		$("#freeSearchBtn").on("click",function(){
			$.ajax({
				url:'searchForFree',
				data:{
					'value':$("#searchVal").val()
				},
				type:"post"
			}).done(function (resp) {
				console.log(resp.searchPage);
				$(".listOne").html("");
				var tmp = "";
				if(resp.searchList.length>0){
				for(var i=0 ; i<resp.searchList.length ; i ++){
				var tmp = tmp + '<div class="col-2 realImg"><div class=tmpImg>'+${resp.searchList[i].bf_content }+'</div><div class=img></div></div>'
					+'<div class="col-10"><div class=title>${resp.searchList[i].bf_title }<hr size="3"></div>'
				+'<input type=hidden value=${resp.searchList[i].bf_no }><div class=otherContents><span class=writer>'
				+'<img src="resources/free/boardFreeWriter.png">${resp.searchList[i].bf_writer }</span><span class=writeDate>'
				+'<img src="resources/free/boardFreeWriteDate.png">${resp.searchList[i].bf_stringdate }</span><span class=viewCount>'
				+'<img src="resources/free/boardFreeView.png">${resp.searchList[i].bf_viewcount }</span><span class=comment>'
				+'<img src="resources/free/boardFreeReply.png">${resp.searchList[i].bf_cmtcount}</span></div></div><hr size="3">'
				}
				$(".listOne").html(tmp);
				}else{
					$(".listOne").html("일치하는 내용이 없습니다.");	
				}
				console.log(tmp);
				
			})
		})
		
		
	</script>
</body>
</html>