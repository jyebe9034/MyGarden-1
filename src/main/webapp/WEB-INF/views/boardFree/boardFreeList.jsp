
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"></jsp:include>
<title>나의 정원 - 자유게시판</title>
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
	text-align: left;
	line-height: 75px;
}

.realImg, .img {
	padding: 0px;
	width: 100%;
	height: 151px;
	text-align: center;
}

.img img {
	max-width: 100%;
	max-height: 151px;
	border-radius: 5px;
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	margin: auto;
}

.title, .sTitle {
	font-size: 20px;
	font-weight: bold;
	margin-left: 28px;
}

.searchContImg {
	margin-left: 28px;
	padding: 0px;
}

.sTitle {
	margin-left: 35px;
	margin-bottom: 10px;
	color: #8e74a8;
}

.title:hover {
	text-decoration: underline;
	cursor: pointer;
}

.writer>img{
	height: 30px !important;
	width: 30px !important;
	margin-right: 10px !important;
	border-radius: 30px;
}

hr {
	margin: 0px;
	width: 100%;
}

#write, #back {
	background-color: #44b27d;
	color: white;
	border: 0px;
}

#write:hover, #back:hover {
	background-color: #b4d9b5;
	border: 0px;
}

.otherContents>span {
	margin: 0px 20px;
}

.otherContents img {
	margin: 0px 5px;
	height: 28px;
	width: auto;
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
	margin-bottom : 30px;
}

.naviBtn, .searchNaviBtn {
	width: 30px;
	text-align: center;
	color: #44b27d;
	font-size: 20px;
	font-weight: bold;
	margin: 0px 15px;
	cursor: pointer;
}

.naviBtn:hover, .searchNaviBtn:hover {
	text-decoration: underline;
	color: #c1b1fc;
}

.searchContImg img {
	width: 100px !important;
	border-radius: 5px;
}

#remark{
	color: #44b27d;
	font-weight: bold;
	position: relative;
	right: 15px;
	bottom: 15px;
}
.ellipsis {
    height : 200px;
    text-overflow: ellipsis;
    -o-text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    word-wrap: normal !important;
    display: block;
}
</style>
<body>
	<div class=col-12 id=titleImg>
		<img src="resources/free/boardFree.jpg">
	</div>

	<div class=container>
	<span id=remark>'나의 정원' 회원님들이 레시피를 공유하는 공간입니다.</span>
	
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
							<span class=writer><img src=${tmp.bf_writerImg }>${tmp.bf_writer }</span>
							<span class=writeDate><img
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
		<br>
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

		$(document).on("click",".title",function(){
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
			}else if(page == "<"){
				page = parseInt($(this).next().text())-1;
			}
			$(location).attr("href","boardFreeList?page="+page);
		})
		
		
		$(".naviBtn").each(function(i,item){
			if($(this).text() == ${page} ){
				$(this).css("color","#c1b1fc");
		}
		})

		$("#freeSearchBtn").on("click",function(){
			var searchVal = $("#searchVal").val().replace("(?i)<script", "&lt;script");
			if(searchVal==""){
				alert("검색어를 입력해주세요.");
			}else{
			$.ajax({
				url:'searchForFree',
				data:{
					'value':searchVal
				},
				type:"post"
			}).done(function (resp) {
				$(".listOne").html("");
				$("#naviPlace").html("");
				var size = resp.searchList.length;
				if(size>0){
				var tmp = "";
				for(var i=0 ; i<resp.searchList.length ; i++){
				tmp = tmp +'<div class="col-12"><div class=title>'+resp.searchList[i].bf_title+'</div>'
				+'<input type=hidden value='+resp.searchList[i].bf_no +'>'
				+'<hr><div class="col-12 searchContImg ellipsis">'+resp.searchList[i].bf_content+'</div>'
				+'<br><div class=otherContents><span class=writer>'
				+'<img src="resources/free/boardFreeWriter.png">'+resp.searchList[i].bf_writer+'</span><span class=writeDate>'
				+'<img src="resources/free/boardFreeWriteDate.png">'+resp.searchList[i].bf_stringdate+'</span><span class=viewCount>'
				+'<img src="resources/free/boardFreeView.png">'+resp.searchList[i].bf_viewcount+'</span><span class=comment>'
				+'<img src="resources/free/boardFreeReply.png">'+resp.searchList[i].bf_cmtcount+'</span><hr></div></div><br><br>';
				}					
				$(".listOne").html("<div class=sTitle>'"+resp.searchVal+"' 관련 검색어 : "+resp.searchList.length+" 건</div><br>"+tmp+"<br><br>");
				var navi = "";
				for(var i=0; i<resp.searchNavi.length; i++){
					navi = navi+'<span class=searchNaviBtn>'+resp.searchNavi[i]+'</span>';
					$("#naviPlace").html(navi);
				}	
				}else{
					$(".listOne").html("<center><img src=resources/img/noresults.png width=500px><br><br><br>'<b>"+resp.searchVal+"</b>' 에 대한 결과가 없습니다.<br><br>"
					+"<button id='back' class='btn'>돌아가기</button>");
				}
			})
			}
		})
		
// 		$(document).on("keydown", "#searchVal", function(key) {		
//         if (key.keyCode == 13) {
//         	$("#freeSearchBtn").click();   	
//         }
// 		})
		
		$(document).on("click", ".searchNaviBtn", function(){
			var page = $(this).text();
			if(page == ">"){
				page = parseInt($(this).prev().text())+1;
			}else if(page == "<"){
				page = parseInt($(this).next().text())-1;
			}
			$.ajax({
				url:'searchForFree',
				data:{
					'page':page
				},
				type:"post"
			}).done(function (resp) {
				$(".listOne").html("");
				$("#naviPlace").html("");
				var size = resp.searchList.length;
				if(size>0){
				var tmp = "";
				for(var i=0 ; i<resp.searchList.length ; i++){
					tmp = tmp +'<div class="col-12"><div class=title>'+resp.searchList[i].bf_title+'</div>'
					+'<input type=hidden value='+resp.searchList[i].bf_no +'>'
					+'<div class="col-12 searchContImg"><hr>'+resp.searchList[i].bf_content+'</div>'
					+'<br><div class=otherContents><span class=writer>'
					+'<img src="resources/free/boardFreeWriter.png">'+resp.searchList[i].bf_writer+'</span><span class=writeDate>'
					+'<img src="resources/free/boardFreeWriteDate.png">'+resp.searchList[i].bf_stringdate+'</span><span class=viewCount>'
					+'<img src="resources/free/boardFreeView.png">'+resp.searchList[i].bf_viewcount+'</span><span class=comment>'
					+'<img src="resources/free/boardFreeReply.png">'+resp.searchList[i].bf_cmtcount+'</span></div></div><hr size="3"><br>';
				}					
				$(".listOne").html("<div class=sTitle>'"+resp.searchVal+"' 관련 검색어 : "+resp.searchList.length+" 건</div><br>"+tmp+"<br><br>");
				var navi = "";
				for(var i=0; i<resp.searchNavi.length; i++){
					navi = navi+'<span class=searchNaviBtn>'+resp.searchNavi[i]+'</span>';
					$("#naviPlace").html(navi);
				}	
				}else{
					$(".listOne").html("<center><img src=resources/img/noresults.png><br><br>'<b>"+resp.searchVal+"</b>' 에 대한 결과가 없습니다.<br><br>"
					+"<button id='back' class='btn'>뒤로 가기</button>");
				}
			})
		})
		
		$(document).on("click", "#back", function(){
			location.href="boardFreeList";
		})
	</script>
</body>
</html>