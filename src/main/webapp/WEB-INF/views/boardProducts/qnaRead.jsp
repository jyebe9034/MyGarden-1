<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의글</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp"/>
<style>
	div{
/* 		border: 1px solid black; */
	}
	#qnaWrapper{
		width: 1000px;
		margin: 300px auto;
	}
	
	#updateQnAForm{
		width: 90%;
		margin: 0 auto;
/* 		background-color: #e8ede1; */
 		border: 1px solid lightgrey;  
	    border-radius: 5px;
	}

	.inputTitleRow{
		margin-bottom:3px;
	}
	#inputTitle{
		padding: 0 40px;
 		margin-top: 25px;
		border: none;
		font-size: 30px;
		font-weight: 500;
		color: #709468;
		background-color: white;
	}
	
		
	.writerInfoRow{
		color: #949993;
		width:95%;
		margin: auto;
		margin-top: -10px;
		font-size: 15px;
		font-size: 13px;
    	font-weight: 500;
	}
	
	.profileImg{
		width: 30px;
		height: 30px;
		border-radius: 50px;
	}
	

	#inputContent{
/* 		height: 300px; */
		width: 100%;
		margin: 0 auto;
		border: none;
		border-radius: 5px;
		padding: 10px 35px;
		 color: #515c4e;
		font-size: 20px;
    	font-weight: 300;
    	font-family: sans-serif;
	}
	.imagesRow{
		width: 100%;
		margin: 0 auto;
	}
	
	.imagesBox{
		width: 100%;
	}
	
	.imagesRow img{
/* 		height: 150px; */
		max-width: 100%;
		margin: 15px auto; 
	}
	
	.btnsRow{
		width: 100%;
	}
	
	.btnsRow div{
		text-align: right;
		width:80%;
	}
	
	.btns button{
		margin: 0 5px;
	}
	#commentBtn, #updateCommentBtn{
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.goBackBtn{
		border: 1px solid #44b27d;
		color: #44b27d;
		font-weight: border;
	}
	#commentBtn:hover, #updateCommentBtn:hover{
		background-color: #b4d9b5;
		color: #44b27d;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
	.goBackBtn:hover {
		background-color: #b4d9b5;
		color: white;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
	.updateBtn{
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
	}
	.updateBtn:hover{
		background-color: #b4d9b5;
		color: #44b27d;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
	
	#answerWrapper{
		width: 90%;
		height: 350px;
		margin: 0 auto;
/* 		background-color: #e8ede1; */
 		border: 1px solid lightgrey;  
	    border-radius: 5px;
	    margin-top: 50px;
	
	}
	
	.commentBtnRow{
		width:90%;
	}
	.commentRow{
		width:98%;
		margin: auto;
		border-radius: 5px;
	}
	
	.commentLabelBox{
		height: 20%;
	}
	
	#answerWrapper label{
		padding: 15px 5px;
		border: none;
		font-size: 30px;
		font-weight: 500;
		color: #709468;
		background-color: white;
	}
	
	#inputComment{
		width: 100%;
		height: 200px;
		border-radius: 10px;
		padding: 15px;
		color: #515c4e;
		font-size: 20px;
    	font-weight: 300;
    	font-family: sans-serif;
		
	}
	
 	.commentBtnBox{ 
 		margin-top: 10px;
 	} 
	
 	.commentBtnRow div{ 
 		position: relative; 
      	left: 25px;  
      	top: 15px;
	} 
	
	#editBtn{
		background-color: #44b27d;
		color: white;
		font-weight: bold;
	}
	
	#editBtn:hover{
		background-color: #b4d9b5;
		color: #44b27d;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
	
	#delCommentBtn{
		background-color: #b4d9b5;
		color: #44b27d;
		margin-right: 20px;
	}
	#delCommentBtn:hover{
		background-color: #44b27d;
		color: white;
	}
</style>

<!-- script -->
<script>
	$(function(){
		$(".goBackBtn").on("click",function(){
			//$(location).attr("href","/");
			var pnumber = ${readQnA.bq_p_no};
			location.href = "productsRead?&revPage=1&qnaPage=1&pnumber=" + pnumber;
			
		})
	
		$(".updateBtn").on("click",function(){
			var bq_no = ${readQnA.bq_no};
			
			$(location).attr("href","updateQnAForm?bq_no="+bq_no);
		})


// 		$(".imagesRow img").each(function(){
// 			var imgSrc = $(this).next().val();
// // 			alert(imgSrc);
// 			var imgHeight = $(this)[0].naturalHeight;
// 			console.log("imgHeight : " + imgHeight);
// 			var imgWidth = $(this)[0].naturalWidth;
// 			//alert("imgHeight : " + imgHeight);
// 			if(imgHeight>1000 || imgWidth > 1000){
// 				imgHeight = $(this)[0].naturalHeight*0.7;
// 				imgWidth = $(this)[0].naturalWidth*0.7;
// 				console.log("imgWidth : " + imgWidth);
// 			}
			
// 			$(this).on("click",function(){
// 				//$(".qnaImgModal").html("<img src='"+imgSrc+"' height='"+imgHeight+"px' width='"+imgWidth+"px'>");
// 				$(".qnaImgModal").html("<img src='"+imgSrc+"'>");
// 				//$(".qnaImgModal").height(imgHeight);
// 				$(".qnaImgModal").width(1000);
// 				$(".qnaImgModal img").height(imgHeight);
// 				$(".qnaImgModal img").width(imgWidth);
// 			})
// 		})
		
		
		$(document).on("click","#commentBtn",function(){  //답변 등록
			var inputComment = $("#inputComment").text();
			//$("#cq_comment").val(inputComment);
			var data = {
					cq_p_no : "${readQnA.bq_p_no}",
					cq_no : ${readQnA.bq_no},
					cq_name :  "${loginName}",
					cq_email : "${loginId}",
					cq_comment : inputComment
				  };
			$.ajax({
				url: "writeComment",
				type: "post",
				dataType:"json",
				async: true,
				data: data
			}).done(function(result){
				var cq_comment = result.cq_comment;
				var checkAns = result.checkAns;
				//$(".cq_comment").text(cq_comment);
				if(checkAns=='y'){
					//$("#AnswerWrapper").html("");	
					$("#inputComment").attr("contenteditable","false");
					$("#inputComment").html(inputComment);
// 					$("#inputComment").css("background-color","lightgrey");
					$(".commentBtnBox").html("<button class='btn' id='delCommentBtn'>삭제하기</button>"
							+ "<button type='button' class='btn' id='editBtn'>수정하기</button>");
					alert("답변이 등록되었습니다.")
				}
			})
		})
				
			
				$(document).on("click","#editBtn",function(){ //답변 수정 가능한 형태로~
				
					$("#inputComment").attr("contenteditable","true");
					$("#inputComment").css("background-color","#f5ffeb");
					$(".commentBtnBox").html("<button type='button' class='btn' id='updateCommentBtn'>등록</button>");	
					
				})
					
				$(document).on("click","#updateCommentBtn",function(){ //답변 수정
					$("#inputComment").attr("contenteditable","false");
					$("#inputComment").css("background-color","white");
					$(".commentBtnBox").html("<button type='button' class='btn' id='delCommentBtn'>삭제하기</button>"
							+ "<button type='button' class='btn' id='editBtn'>수정하기</button>");
					
					var inputComment = $("#inputComment").html();
		
					var data = {
							cq_no : ${readQnA.bq_no},
							cq_comment : inputComment
						  };

					$.ajax({
							url: "updateComment",
							type: "post",
							async: true,
							data: data
						}).done(function(cq_comment){
							alert("답변이 수정되었습니다.")	;	
						})
				})
				
				$(document).on("click","#delCommentBtn",function(){ //답변 삭제

					$.ajax({
						url: "deleteComment",
						type: "post",
						async: true,
						data: {"cq_no" : ${readQnA.bq_no}}
					}).done(function(resp){
						if(resp=2){
							alert("resp" + resp);
							$("#answerWrapper").html("");
							$("#answerWrapper").append("<div class='form-group row commentRow'>"
									+"<div class=\"col-12 commentLabelBox\">"
									+"<label for=\"cq_comment\" class=\"col-12 col-form-label\">답변</label>"
									+"</div>"
									+"<div class=\"col-12 inputCommentBox\">"
									+"<div contenteditable=\"true\" id=\"inputComment\">답변을 등록해주세요.</div>"
									+"</div></div>"
									+"<div class=\"row commentBtnRow\">"
									+"<div class=\"col-12 commentBtnBox\">"
									+"<button class=\"btn\" id=\"commentBtn\">답변등록</button>"
									+"</div></div>")
							alert("답변이 삭제되었습니다.");      
						}			
						
					})
				})
			
			
			
	
		

		
	})

</script>
	
	
</head>
  <body>

                    <!-- header -->
                    <jsp:include page="/WEB-INF/views/module/fixedHeader.jsp"/>

                    <!-- 			carousel -->
                    <div class="container-fluid my">
                        <div class="row my">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
                                <img src="">
                            </div>
                        </div>
                    </div>

                    <!-- 리뷰 작성 폼 -->
                    <div id="qnaWrapper">
                        <!-- 		<span>문의하기</span> -->
                        <!-- 		<hr> -->

                        <div id="qWrapper">
                            <form action="updateQnA" id="updateQnAForm" method="post" enctype="multipart/form-data">

                                <div class="form-group row inputTitleRow">
                                    <!-- 		    <label for="inputTitle" class="col-sm-2 col-form-label">제목</label> -->
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control" id="inputTitle" name="bq_title" value="${readQnA.bq_title }" readOnly>
                                    </div>
                                </div>

                                <div class="row writerInfoRow">
                                    <div class="col-12">
                                        <img src="${writerInfo.m_profile}" class="profileImg" border="1px solid black">
                                        <span class="writerInfo">
                                            ${readQnA.bq_name }/작성자/
                                            <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${readQnA.bq_writedate }"/>
                                        </span>
                                    </div>
                                </div>


                                <div class="form-group row inputContentRow">
                                    <div class="col-sm-12">
                                        <div contenteditable="false" id="inputContent">${readQnA.bq_content }</div>
                                        <input type=hidden name="bq_content" id="content">
                                    </div>
                                </div>
                                <div class="form-group row imagesRow"> 
                                    <div class="col-sm-12 imagesBox">
                                        <p><img src="${readQnA.bq_imagepath1 }" onerror="this.style.display='none'" data-toggle="modal" data-target=".bd-example-modal-lg"></p>
                                        <input type="hidden" value="${readQnA.bq_imagepath1 }">
                                        <p><img src="${readQnA.bq_imagepath2 }" onerror="this.style.display='none'" ></p>
                                        <p><img src="${readQnA.bq_imagepath3 }" onerror="this.style.display='none'" ></p>
                                        <!-- 		  			onclick="fnImgPop(this.src)" -->
                                    </div>

                                    <!-- 		  		<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"> -->
                                    <!-- 				  <div class="modal-dialog modal-lg"> -->
                                    <!-- 				    <div class="modal-content"> -->
                                    <!-- 				     	 <div class="modal-header"> -->
                                    <!-- 					        <h5 class="modal-title">사진</h5> -->
                                    <!-- 					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
                                    <!-- 					          <span aria-hidden="true">&times;</span> -->
                                    <!-- 					        </button> -->
                                    <!-- 					      </div> -->
                                    <!-- 					      <div class="modal-body qnaImgModal"> -->
                                    <!-- 					        사진 -->
                                    <!-- 					      </div> -->
                                    <!-- 					      <div class="modal-footer"> -->
                                    <!-- 					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
                                    <!-- 					      </div> -->
                                    <!-- 				    </div> -->
                                    <!-- 				  </div> -->
                                    <!-- 				</div> -->

                                </div>

                                <div class="form-group row btnsRow">
                                    <div class="col-12 btns">
                                        <button type="button" class="btn goBackBtn" >돌아가기</button>
                                        <!-- 		  	</div> -->
                                        <c:choose>
                                            <c:when test="${mine eq 'y'}">
                                                <!-- 					<div class="col-6 btns"> -->
                                                <button type="button" class="btn updateBtn" >수정하기</button>
                                                <!--					</div>	-->
                                            </c:when>
                                        </c:choose>
                                    </div>		  
                                </div>	
                            </form>
                            <div id="answerWrapper">

                                <c:choose>
                                    <c:when test="${checkAns eq 'n' and grade eq 'admin'}">
                                        <!-- ========================답변(관리자만 가능)============================= -->

                                        <div class="form-group row commentRow">
                                            <div class="col-12 commentLabelBox">
                                                <label for="cq_comment" class="col-12 col-form-label">관리자 답변</label>
                                            </div>
                                            <div class="col-12 inputCommentBox">
                                                <div contenteditable="true" id="inputComment">답변을 작성해주세요.</div>
                                            </div>
                                        </div>
                                        <div class="row commentBtnRow">
                                        	<div class="col-12 commentBtnBox">
                                        		<button class="btn" id="commentBtn">답변등록</button>
                                        	</div>
                                        </div>

                                    </c:when>
                                    <c:when test="${checkAns eq 'n' and grade ne 'admin'}">
                                        <div class="form-group row commentRow">
                                            <div class="col-sm-12 commentLabelBox">
                                                <label for="cq_comment" class="col-12 col-form-label">관리자 답변</label>
                                            </div>
                                            <div class="col-sm-12 inputCommentBox">
                                                <div contenteditable="false" id="inputComment">등록된 답변이 없습니다.</div>
                                            </div>
                                        </div>	

                                    </c:when>
                                    <c:otherwise>
                                        <div class="form-group row commentRow">
                                            <div class="col-sm-12 commentLabelBox">
                                                <label for="cq_comment" class="col-12 col-form-label">관리자 답변</label>
                                            </div>
                                            <div class="col-sm-12 inputCommentBox">
                                                <div contenteditable="false" id="inputComment">${commentList.cq_comment }</div>
                                            </div>
                                        </div>	
                                        <c:if test="${checkAns eq 'y' and grade eq 'admin'}">
                                            <div class="row commentBtnRow">
                                                <div class="col-12">
                                                    <button class="btn" id="delCommentBtn">삭제하기</button>
                                                    <button class="btn" id="editBtn">수정하기</button>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>

                                <!-- 		<div class="cq_comment"></div> -->
                            </div>




                        </div>

                    </div>


                    <!-- 	footer -->
                    <jsp:include page="/WEB-INF/views/module/fixedFooter.jsp"/>

                </body>
</html>