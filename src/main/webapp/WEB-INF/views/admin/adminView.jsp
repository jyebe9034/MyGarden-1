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

<title>관리자 페이지</title>
</head>
<style>
#titleImg {
	overflow: hidden;
	height: 600px;
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
	margin-top: 10px;
	border: 1px solid #9e9e9e;
	height: 100px;
	width: 100%;
	text-align: center;
}

#modifyBox {
	width: 88%;
	height: 100%;
	color: #44b27d;
	background-color: #ecf7e9;
	border: 0px;
	margin-right: 5px;
}

.mdBtn {
	background-color: white;
	border: 0px;
	color: #44b27d;
	height: 40px;
	margin-right: 5px;
}

.mdBtn:hover {
	text-decoration: underline;
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

.rContents {
	margin: 10px 5px;
}

.rIcons {
	width: 100%;
	text-align: right;
}

.rIcons img {
	width: 20px;
	margin: 0 10px;
	position: relative;
	bottom: 10px;
	cursor: pointer;
}

#rContentWrite {
	padding: 15px;
	text-align: left;
	margin: 0px;
}

#navi {
	width: 100%;
	text-align: center;
	margin-bottom: 15px;
}

.naviBtn {
	width: 30px;
	text-align: center;
	color: #44b27d;
	font-weight: bold;
	margin: 0px 10px;
	padding-left: 5px;
	cursor: pointer;
}

.naviBtn:hover {
	text-decoration: underline;
	color: #eded39;
}

.nowPage {
	color: #eded39;
}

.footBtn {
	padding: 0px;
	text-align: left;
	margin: 20px 0px;
	text-align: left;
}

.bfBtn {
	width: 90px;
	height: 40px;
	background-color: #44b27d;
	color: white;
	border: 0px;
	border-radius: 5px;
	margin-right: 10px;
}

.bfBtn:hover {
	background-color: #b4d9b5;
	color: white;
}

.submitDiv {
	text-align: right;
}

#submitBtn {
	height: 100%;
	width: 70%;
	margin: 0px;
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
					<div class=commentOne>
						<span class=rWriter> <img
							src="resources/img/boardFreeCmtWriter.png">${tmp.cf_name }
						</span> <span class=rWritedate>${tmp.cf_stringdate}</span>
						<div class="rContents row">
							<div class="rContent col-10">${tmp.cf_comment }</div>
							<c:if test="${loginName==tmp.cf_name }">
								<div class="rIcons col-2">
									<span class=cmtChange flag=true id='${tmp.cf_no}'> <img
										src="resources/img/boardFreeCmtChange.png"></span> <span
										class=cmtDelete id='${tmp.cf_no}'> <img
										src="resources/img/boardFreeCmtDelete.png">
									</span>
								</div>
							</c:if>
						</div>
						<hr>
					</div>
				</c:forEach>
			</div>
			<div class="col-12" id=navi>
				<c:forEach var="navi" items="${navi}">
					<span class=naviBtn>${navi }</span>
				</c:forEach>
			</div>

			<div class="col-10 comment" contenteditable id=rContentWrite></div>
			<div class="col-2 submitDiv">
				<button type="button" class="bfBtn" id="submitBtn">댓글 등록</button>
			</div>
			<div class="col-12 footBtn">
				<button type="button" class="bfBtn" id=back>목록으로</button>

				<c:if test="${loginId==page.bf_email}">
					<button type="button" class="bfBtn" id=modify>글수정</button>
					<button type="button" class="bfBtn" id=delete>글삭제</button>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"></jsp:include>
	<script>
		$("#back").on("click", function() {
			location.href = "boardFreeList?page=1";
		})
		
		
		//글 수정, 삭제
		$("#modify").on("click",function(){
			location.href="boardFreeModify?no="+${page.bf_no};
		})
		
		$("#delete").on("click", function(){
			if(confirm("정말 삭제하시겠습니까?")==true){
			location.href="boardFreeDelete?no="+${page.bf_no};
			}
		})

		
		
		$(document).on("click","#cancelBtn",function(){
				$(this).parent().prev().html(origin);
		})
		
		//댓글 수정 1)수정 박스 만들기
		$(document).on("click",".cmtChange",function(){
			if($(this).attr("flag")=="true"){//여러번 클릭 막기
			var origin=$(this).parent().prev().text();
			var change="<input type=text id=modifyBox value="+origin+"><button type=button class='mdBtn modifyBtn'>수정</button>"
			+"<button type=button class=mdBtn id=cancelBtn>취소</button>";		
			$(this).attr("flag","false");
			$(this).parent().prev().html(change);		
			}
		})
		
		
		//댓글 수정 2)수정한 값 처리
			$(document).on("click",".modifyBtn",function(){
				var seq=$(this).parent().next().children(".cmtChange").attr("id");
				var cmt = $(this).prev().val();	
			$.ajax({
				url:"freeCmtModify",
				data:{
					no:${page.bf_no},
					seq: seq,
					cmt:cmt
				}
			}).done(function(resp){
					if(resp.result > 0){
						// 댓글 목록
						  $(".commentList").html("");
						 var cmtList = "";
						 for(var i=0; i<resp.list.length; i++){	
							 var commentOne = $("<div class=commentOne></div>");
						        var rWriter= $("<span class=rWriter></span>");
						        rWriter.append('<img src="resources/img/boardFreeCmtWriter.png">'+resp.list[i].cf_name);      
						        var rContents = $("<div class='rContents row'></div>");
						        rContents.append("<div class='rContent col-10'>"+resp.list[i].cf_comment+"</div>");
						        if('${loginId}' == resp.list[i].cf_email){
						        var rIcons = $("<div class='rIcons col-2'></div>");  		    
						        rIcons.append('<span class=cmtChange flag=true id='+resp.list[i].cf_no+'><img src="resources/img/boardFreeCmtChange.png"></span>'
						        		+'<span class=cmtDelete id='+resp.list[i].cf_no+'><img src="resources/img/boardFreeCmtDelete.png"></span>');
						        rContents.append(rIcons); 
						        }        
						        commentOne.append(rWriter);
						        commentOne.append('<span class=rWritedate>'+resp.list[i].cf_stringdate+'</span>');
						        commentOne.append(rContents);
						        commentOne.append('<hr>');
						        var root = $("<div></div>");
						        root.append(commentOne);      
						       	cmtList=cmtList+commentOne[0].innerHTML;
						 }		 	 		
						$(".commentList").html(cmtList);
						//네비 목록
						 $("#navi").html("");
						var naviList = "";			
						for(var i=0; i<resp.navi.length; i++){
							var num = (parseInt(resp.page))-1;
							if(i==num){
								naviList = naviList + "<span class='naviBtn nowPage'>"+resp.navi[i]+"</span>"
							}else{
								naviList = naviList + "<span class='naviBtn'>"+resp.navi[i]+"</span>"
							}			
						}
						$("#navi").html(naviList);
					}
				})						
		})

		//댓글 삭제
		$(document).on("click",".cmtDelete",function(){
			var seq = $(this).attr("id");			
			if(confirm("정말 삭제하시겠습니까?")==true){
			$.ajax({
				url:"freeCmtDelete",
				data:{
					seq: seq,
					no:${page.bf_no}
				}
			}).done(function(resp){
				if(resp.result>0){
					alert("댓글이 삭제되었습니다.");
					//location.reload(true);
					$(this).parent().parent().parent().parent().html("");
					// 댓글 목록
					  $(".commentList").html("");
					 console.log(resp.list);
					 var cmtList = "";
					 for(var i=0; i<resp.list.length; i++){	
						 var commentOne = $("<div class=commentOne></div>");
					        var rWriter= $("<span class=rWriter></span>");
					        rWriter.append('<img src="resources/img/boardFreeCmtWriter.png">'+resp.list[i].cf_name);      
					        var rContents = $("<div class='rContents row'></div>");
					        rContents.append("<div class='rContent col-10'>"+resp.list[i].cf_comment+"</div>");
					        if('${loginId}' == resp.list[i].cf_email){
					        var rIcons = $("<div class='rIcons col-2'></div>");  		    
					        rIcons.append('<span class=cmtChange flag=true id='+resp.list[i].cf_no+'><img src="resources/img/boardFreeCmtChange.png"></span>'
					        		+'<span class=cmtDelete id='+resp.list[i].cf_no+'><img src="resources/img/boardFreeCmtDelete.png"></span>');
					        rContents.append(rIcons); 
					        }        
					        commentOne.append(rWriter);
					        commentOne.append('<span class=rWritedate>'+resp.list[i].cf_stringdate+'</span>');
					        commentOne.append(rContents);
					        commentOne.append('<hr>');
					        var root = $("<div></div>");
					        root.append(commentOne);      
					       	cmtList=cmtList+commentOne[0].innerHTML;
					 }		 	 			 
					$(".commentList").html(cmtList);
					
					//네비 목록
					 $("#navi").html("");
					var naviList = "";			
					for(var i=0; i<resp.navi.length; i++){
						var num = (parseInt(resp.page))-1;
						if(i==num){
							naviList = naviList + "<span class='naviBtn nowPage'>"+resp.navi[i]+"</span>"
						}else{
							naviList = naviList + "<span class='naviBtn'>"+resp.navi[i]+"</span>"
						}			
					}
					$("#navi").html(naviList);
				}			
				})			
			}
		})
		
		
		$("#submitBtn").on("click", function() {
			if('${loginId}'==""){
				alert("로그인 후 이용하실수 있습니다.");
			}else if($("#rContentWrite").text() == ""){
				alert("댓글을 입력해주세요.")
				}else{			
			 $.ajax({
				 url:"freeCmtWrite",
				 type:"post",
				 data:{				 
					no:${page.bf_no},
					content:$("#rContentWrite").text()
				 } 
			 }).done(function (resp) {	
				 $("#rContentWrite").text(""); //등록하면 썼던 댓글 지우기	
				 //댓글 목록
				 $(".commentList").html("");
				 var cmtList = "";
				 for(var i=0; i<resp.list.length; i++){	
					 var commentOne = $("<div class=commentOne></div>");
				        var rWriter= $("<span class=rWriter></span>");
				        rWriter.append('<img src="resources/img/boardFreeCmtWriter.png">'+resp.list[i].cf_name);      
				        var rContents = $("<div class='rContents row'></div>");
				        rContents.append("<div class='rContent col-10'>"+resp.list[i].cf_comment+"</div>");
				        if('${loginId}' == resp.list[i].cf_email){
				        var rIcons = $("<div class='rIcons col-2'></div>");  		    
				        rIcons.append('<span class=cmtChange flag=true id='+resp.list[i].cf_no+'><img src="resources/img/boardFreeCmtChange.png"></span>'
				        		+'<span class=cmtDelete id='+resp.list[i].cf_no+'><img src="resources/img/boardFreeCmtDelete.png"></span>');
				        rContents.append(rIcons); 
				        }        
				        commentOne.append(rWriter);
				        commentOne.append('<span class=rWritedate>'+resp.list[i].cf_stringdate+'</span>');
				        commentOne.append(rContents);
				        commentOne.append('<hr>');
				        var root = $("<div></div>");
				        root.append(commentOne);      
				       	cmtList=cmtList+commentOne[0].innerHTML;
				 }		 	 		 
				 $(".commentList").html(cmtList);
				
				//네비 목록
				 $("#navi").html("");
				var naviList = "";
				
				for(var i=0; i<resp.navi.length; i++){
					var num = (parseInt(resp.navi.length))-1;
					if(i==num){
						naviList = naviList + "<span class='naviBtn nowPage'>"+resp.navi[i]+"</span>"
					}else{
						naviList = naviList + "<span class='naviBtn'>"+resp.navi[i]+"</span>"
					}			
				}
				$("#navi").html(naviList);
			})
			}
		})
		
		$(document).on('click',".naviBtn",function(){
			var nowPage = $(this).text();
			if(nowPage==">"){
				var nowPage=parseInt($(this).prev().text())+1;
			}else if(nowPage=="<"){
				var nowPage=parseInt($(this).next().text())-1;
			}
			$.ajax({
				url:"freeCmtNaviProc",
				data:{
					no:${page.bf_no},
					page: nowPage
				}
			}).done(function (resp) {
				//댓글 목록
				 $(".commentList").html("");
				 var cmtList = "";
				 for(var i=0; i<resp.list.length; i++){	
					 var commentOne = $("<div class=commentOne></div>");
				        var rWriter= $("<span class=rWriter></span>");
				        rWriter.append('<img src="resources/img/boardFreeCmtWriter.png">'+resp.list[i].cf_name);      
				        var rContents = $("<div class='rContents row'></div>");
				        rContents.append("<div class='rContent col-10'>"+resp.list[i].cf_comment+"</div>");
				        if('${loginId}' == resp.list[i].cf_email){
				        var rIcons = $("<div class='rIcons col-2'></div>");  		    
				        rIcons.append('<span class=cmtChange flag=true id='+resp.list[i].cf_no+'><img src="resources/img/boardFreeCmtChange.png"></span>'
				        		+'<span class=cmtDelete id='+resp.list[i].cf_no+'><img src="resources/img/boardFreeCmtDelete.png"></span>');
				        rContents.append(rIcons); 
				        }        
				        commentOne.append(rWriter);
				        commentOne.append('<span class=rWritedate>'+resp.list[i].cf_stringdate+'</span>');
				        commentOne.append(rContents);
				        commentOne.append('<hr>');
				        var root = $("<div></div>");
				        root.append(commentOne);      
				       	cmtList=cmtList+commentOne[0].innerHTML;
				 }		 	 		
				 $(".commentList").html(cmtList);
				//네비 목록
				 $("#navi").html("");
				var naviList = "";
				
				for(var i=0; i<resp.navi.length; i++){			
					if(resp.navi[i]==resp.page){
						naviList = naviList + "<span class='naviBtn nowPage'>"+resp.navi[i]+"</span>"
					}else{
					naviList = naviList + "<span class='naviBtn'>"+resp.navi[i]+"</span>"
					}
				}
				$("#navi").html(naviList);
			})
		})
	
		$(".naviBtn").each(function(i, item){
			if($(this).text()==${now}){
				$(this).css("color","#eded39");
			}
		})

	</script>
</html>