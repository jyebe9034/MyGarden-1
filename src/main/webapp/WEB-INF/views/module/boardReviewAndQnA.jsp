<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- style -->
<style>
	div {
/*  	    border: 1px solid black;  */
		
	}
	
	#revAndQnAWrapper {
		margin: 500px auto;
		width: 800px;
		height: 1000px;
	}

	#revAndQnAWrapper .tabs a {
		border-radius: 0px !important;
		border: 1px solid lightgray;
		margin-left: 35px;
		width: 150px;
		height: 30px;
		line-height: 70%;
		text-align: center;
	}
	
	#revAndQnAWrapper .aa {
		margin-top: -17px;
	}
	
	#revAndQnAWrapper .nav-link {
		color: #fff;
		background-color: #b4d9b5;
	}
	
	#revAndQnAWrapper .nav-link:hover {
		color: #44b27d;
	}
	
	#revAndQnAWrapper .nav-pills .nav-link.active {
		color: #44b27d;
		background-color: white;
		border-bottom: 2px solid white;
	}
	
	#reviewWrapper{
		margin : 300px 0;
	}
	#qnaWrapper{
		margin : 300px 0;
	}
	
	.qnaTab {
		margin-left: -27px;
	}
	
	
	.aListBox{
		border-bottom: 1px solid lightgrey;
	}
	
	.reviewImage img{
		height:200px;
		width:180px;
	}
	.reviewRightTop{
		height:60%;
	}
	.reviewRightBottom{
		height:40%;
	}
	
	.reviewTitle{
		cursor: pointer;
	}
	.reviewTitle:hover{
		font-weight: bold;
	}
	
	.reviewWriter {
		float: left;
	}
	
	.reviewWriteDate {
		float: left;
		margin: 0px 20px;
	}
	
	.reviewRecommend {
		float: left;
	}
	.recommendBtn{
		cursor: pointer;
	}
	
	.pageNaviBox{
		width:100%;
	}
	.pageNaviBox ul{
		margin:auto;
		width: 200px; /*pageNavi위치조정*/
		color:#44b27d;
	}
	.pagination a{
/* 		height: 25px; */
/* 		width: 5px; */
/* 		border: none; */
	}
	.pagination *{/*페이지네비 글씨 기본색*/
		color:lightgrey;
		
	}
	
	#revAndQnAWrapper button{
		width:90px;
		height:30px;
		font-size: 10px;
		margin : 0 2px;
	}
	
	#writeReviewBtn, .reviewUpdateBtn button {
		background-color: #44b27d;
		color: white;
		font-weight: bold;
		border: 0px;
	}
	#modifyBtn{
		position: relative;
		bottom: 5px;
	}
	
	#writeReviewBtn:hover, .reviewUpdateBtn button:hover {
		background-color: #b4d9b5;
		color: #44b27d;
		font-weight: bold;
		border: 0px;
		cursor: pointer;
	}
	
	/*Q & A*/
	.qnaTitleRow{
	 text-align : center;
	}
</style>

<script>
<!--임시 버튼 나중에 마이페이지로 옮기기-->
	$(function(){
		
			$("#writeReviewBtn").on("click",function(){
				$(location).attr("href","reviewWriteForm");
			})
			
			/*제목 클릭하면 내용 보임*/
			$(".reviewContent").hide();			
			$(".reviewContent").each(function(i,item){					
				var reviewTitle = $(item).prev();
				$(reviewTitle).on("click",function(){
					if($(item).attr("display")=="none"){
						$(item).show();
						$(item).attr("display", "block");
					}else{
						$(item).hide();
						$(item).attr("display", "none");   
					}
				})
			})
			
			/*추천 수(도움돼요)증가*/
			$(".recommendBtn").on("click",function(){
				var br_no = $(this).next().val();
				console.log("클릭한글번호:"+br_no);
				  var data = {
							br_email : "aa",
							br_no : br_no,
	 						//br_title : $(this).prev().val()		
							br_title : "제목 ㅋ"
				  };
				  
				$.ajax({
					url: "recommend",
					type: "post",
					dataType: "json",
 					async: true,
					data: data
				}).done(function(result){					
 					var recommend = result.recommendUpdate;
 					console.log("도움돼요 : " + result.recommendUpdate);
 					var cancelRecommend = result.recommendDelete;
 					console.log("도움돼요 취소 : " + result.recommendDelete);
 					var recommendCount = result.recommendCount;
					console.log("도움돼요 수 : " + result.recommendCount);
					if(recommend=1){ //추천
						$("."+br_no+"").prev().html("<img src='/resources/img/reviewLike.png' width='25px' class='recommendImage'>");
					}else if(cancelRecommend=1){ //추천 취소(사진왜 안바뀌냐고ㅡㅡ)
						$("."+br_no+"").prev().html("<img src='/resources/img/reviewHate.png' width='25px' class='recommendImage'>");
					}
					//location.reload(true); //자동새로고침
				
					$("."+br_no+"").next().text(result.recommendCount);
					
				})
			})
			
			/*현재페이지 표시해주는 스타일*/
			$(".reviewPageNumber").each(function(){
				if($(this).text()==${currentPage}){
					$(this).css("color","#44b27d");
					$(this).css("font-weight","bold");
				//	$(this).css("background-color","#b4d9b5");
				}
			})
			$(".qnaPageNumber").each(function(){
				if($(this).text()==${qnaCurrentPage}){
					$(this).css("color","#44b27d");
					$(this).css("font-weight","bold");
				//	$(this).css("background-color","#b4d9b5");
				}
			})
// 			$(".qnaPagenation li").on("click",function(){ //페이지 이동시 시점 고정ㅠ수정하기ㅠ
// 				var offset = $(this).offset();
// 				alert(offset.top);
// 				$('html, body').animate({scrollTop : offset.top}, 10);
// 			})
			
			/*후기 수정 폼으로 이동*/
			$(".modifyBtn").on("click",function(){
				var br_no = $(this).val();
				$(location).attr("href","reviewUpdateForm?br_no="+br_no);
			})
			
			/*후기 삭제*/
			$(".deleteBtn").on("click",function(){
				var br_no = $(this).val();
			    var deleteCheck = confirm("정말 삭제하시겠습니까?");
			    if(deleteCheck){
			    	$(location).attr("href","reviewDelete?br_no="+br_no);
			    }
			})
			//-----------------------------------------------------------
			$("#qBtn").on("click",function(){
				//var bq_p_no = $(this).val(); //상품글번호벨류값으로 넣어주기
				//$(location).attr("href","qnaWriteForm?bq_p_no="+br_no);
				$(location).attr("href","qnaWriteForm?bq_p_no=1");
			})
			
			
			
			$("#goQnaTab").on("click",function(){
				var offset = $("#qnaWrapper").offset();
				//alert("offset.top : " + offset.top);
				$('html, body').animate({scrollTop : offset.top - 200}, 10);
			})			
			$("#goReviewTab").on("click",function(){
				var offset = $("#reviewWrapper").offset();
				//alert("offset.top : " + offset.top);
				$('html, body').animate({scrollTop : offset.top - 100}, 10);
			})
			
			
			
	})

</script>

<!-- 	html -->
<div id="revAndQnAWrapper" class="container">
<!--=========================review===============================-->
	<div id="reviewWrapper" class="container">
		<ul class="nav nav-pills mb-3" id="pills-tabs" role="tablist">
			<li class="nav-item tabs reviewTab">
				<a class="nav-link revAndQnATabs active" id="pills-review-tab"
				data-toggle="pill" href="#qnaWrapper" role="tab"
				aria-controls="pills-home" aria-selected="true">상품후기</a></li>
			<li class="nav-item tabs qnaTab">
				<a class="nav-link revAndQnATabs" id="goQnaTab"
				href="#pills-qna">상품문의</a></li>
		</ul>
		<hr class="aa">
<!--================================================================-->
		<div class="tab-content" id="pills-tabContent">

			<div class="tab-pane fade show active" id="pills-home"
				role="tabpanel" aria-labelledby="pills-home-tab">
				<p>
					Product Review<br> <small class="test">상품의 후기를 올리는
						곳입니다.</small>
				</p>
				<hr>
				
				<div class="container reviewBox">
					<div class="row">

						<c:forEach var="reviewList" items="${reviewList }">
							<div class="col-4 reviewImage">
								<img src="${reviewList.br_imagepath }">
							</div>
							<div class="col-8">
								<div class="reviewRightTop">
									<div class="reviewTitle">${reviewList.br_title }</div>
									<div class="reviewContent" display="none">
										${reviewList.br_content }</div>
								</div>

								<div class="reviewRightBottom">
									<hr>
									<div class="reviewWriter">
										<img src="/resources/img/boardFreeWriter.png" width="20px">
										${reviewList.br_name }
									</div>
									<div class="reviewWriteDate">
										<img src="/resources/img/boardFreeWriteDate.png" width="20px">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${reviewList.br_writedate }" />
									</div>
									<div class="reviewRecommend" value="${reviewList.br_recommend}">
										<%--                                     	<input type="hidden" value="${reviewList.br_title}"> --%>
										<span class="mb-1 recommendBtn"> <img
											src="/resources/img/reviewHate.png" width="25px"
											class="recommendImage">
										</span> <input type="hidden" class="${reviewList.br_no}"
											value="${reviewList.br_no}"> 도움돼요 <span
											class="helpful" value="${reviewList.br_no}">${reviewList.br_recommend}</span>

									</div>
									<div class="reviewUpdateBtn d-flex justify-content-end">
										<button class="btn modifyBtn" value="${reviewList.br_no}">수정하기</button>
										<button class="btn deleteBtn" value="${reviewList.br_no}">삭제하기</button>
									</div>
								</div>

							</div>
							<hr width="770px">
						</c:forEach>
					</div>
				</div>

				<!--pagination/  -->
				<div class="pageNaviBox">
					<nav aria-label="Page navigation example">
						<ul class="pagination">${getNavi }
						</ul>
					</nav>
				</div>
				<!--/pagination  -->

				<div class="writeReviewBtnWrapper d-flex justify-content-end">
					<button class="btn" id="writeReviewBtn">후기쓰기</button>
				</div>

			</div>
<!--=============================review/=================================-->
		</div>
	</div>

<!--===========================Q&A========================================-->
	<div id="qnaWrapper" class="container">
		<ul class="nav nav-pills mb-3" id="pills-tabs" role="tablist">
			<li class="nav-item tabs reviewTab">
				<a class="nav-link revAndQnATabs" id="goReviewTab" href="#reviewWrapper">상품후기</a></li>
			<li class="nav-item tabs qnaTab">
				<a class="nav-link revAndQnATabs active" id="pills-qna-tab"
				data-toggle="pill" href="#pills-qna" role="tab"
				aria-controls="pills-profile" aria-selected="false">상품문의</a></li>
		</ul>
		<hr class="aa">
	<!--==========================================================-->
		<div class="tab-content" id="pills-tabContent">

			<div class="tab-pane show fade active" id="pills-qna" role="tabpanel"
				aria-labelledby="pills-qna-tab">
				<p>
					Q & A<br> <small class="test">문의하는곳임당ㅋ</small>
				</p>
				<hr>
				<div class="container qnaContainer">
					<div class="row qnaTitleRow">
						<div class="col-2">글번호</div>
						<div class="col-6">글제목</div>
						<div class="col-2">작성자</div>
						<div class="col-2">작성일</div>
					</div>
					<div class="row qnaRow">
						<c:forEach var="qnaList" items="${qnaList }">
							<div class="col-2">1</div>
							<div class="col-6">
								<button class="btns" disabled="disabled">답변완료</button>
								<span class="qnaTitle" value="${qnaList.bq_no }">${qnaList.bq_title }</span>
							</div>
							<div class="col-2">${qnaList.bq_writer }</div>
							<div class="col-2">
							<fmt:formatDate pattern="yyyy-MM-dd" value="${qnaList.bq_writedate }"/>
							</div>

						</c:forEach>
					</div>
					<!--pagination/  -->
					<div class="pageNaviBox">
						<nav aria-label="Page navigation example">
							<ul class="pagination qnaPagenation">${getNaviForQnA }
							</ul>
						</nav>
					</div>
					<!--/pagination  -->
					<button id="qBtn">문의하기</button>

				</div>
			</div>
		</div>
		<!--===================Q&A========================================-->
	</div>