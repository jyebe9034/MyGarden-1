<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- style -->
<style>
	div {
/* 	    border: 1px solid black; */
		
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
	
	
	.reviewUpdateBtn{
		line
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
// 				var br_no = $(".recommendBtn").prev().val();
				$.ajax({
					url: "recommendCountUp",
					type: "post",
					data:{
						"br_no": $(this).prev().val(),
 						"br_recommend" : $(this).next().val()		
					}
				}).done(function(resp){
					console.log("resp : " + resp);
 					//$(".Helpful").text(resp);
 					//$(this).children(".helpful").text(resp);
 					
 					//$(".recommendBtn").html("<img src='/resources/img/reviewLike.png' width='25px' class='HelpfulImage'>");
					
				})
			})
			
			/*현재페이지 표시해주는 스타일*/
			$(".pageNumber").each(function(){
				if($(this).text()==${currentPage}){
					$(this).css("color","#44b27d");
					$(this).css("font-weight","bold");
				//	$(this).css("background-color","#b4d9b5");
				}
			})
	})

</script>

<!-- 	html -->
<div id="revAndQnAWrapper" class="container">
 
    <ul class="nav nav-pills mb-3" id="pills-tabs" role="tablist">
      <li class="nav-item tabs reviewTab">
        <a class="nav-link active" id="pills-review-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">상품후기</a>
      </li>
      <li class="nav-item tabs qnaTab">
        <a class="nav-link" id="pills-qna-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">상품문의</a>
      </li>      
    </ul>
    <hr class="aa">
    <div class="tab-content" id="pills-tabContent">
      <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                          <!--                   review/                   -->
                    <p>
                        Product Review<br>
                        <small class="test">상품의 후기를 올리는 곳입니다.</small>
                    </p>
                    <hr>
						<!-- reviewList/ -->
                    <div class="container reviewBox">
                        <div class="row">
                        
                        <c:forEach var="reviewList" items="${reviewList }">
                            <div class="col-4 reviewImage">
                                <img src="${reviewList.br_imagepath }">
                            </div>
                            <div class="col-8">
                                <div class="reviewRightTop">
                                    <div class="reviewTitle">
                                      		 ${reviewList.br_title }
                                    </div>
                                    <div class="reviewContent" display="none">
                                        	${reviewList.br_content }
                                    </div>
<%-- 					<input type="hidden" class="reviewContent" value="${reviewList.br_content }"> --%>
                     
                                </div>
                                
                                <div class="reviewRightBottom">
                         		  <hr>
                                    <div class="reviewWriter">
                                     	  <img src="/resources/img/boardFreeWriter.png" width="20px"> 
                                     	  ${reviewList.br_name }
                                    </div>
                                    <div class="reviewWriteDate">
                                        <img src="/resources/img/boardFreeWriteDate.png" width="20px"> 
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${reviewList.br_writedate }"/>
                                    </div>
                                    <div class="reviewRecommend" value="${reviewList.br_recommend}">
										<input type="hidden" value="${reviewList.br_no}">
                                    	<span class="mb-1 recommendBtn">
                                    		<img src="/resources/img/reviewHate.png" width="25px" class="recommendImage">
                                        </span>
                                    	<input type="hidden" value="${reviewList.br_recommend}">
                                      	  도움돼요 <span class="helpful">${reviewList.br_recommend}</span>
                                    </div>
                                    <div class="reviewUpdateBtn d-flex justify-content-end">
                                        <button class="btn" id="modifyBtn">수정하기</button>
                                    </div>       
                                </div>
                   
                            </div>
                            <hr width="770px">
                        </c:forEach>
         
                            
                            
                        </div>
                     <!-- /reviewList -->
          
                    </div>
<!--                   /review                   -->

			<!--pagination/  -->
			<div class="pageNaviBox">				
				<nav aria-label="Page navigation example">
				  <ul class="pagination">				  	
				  	${getNavi }				    
				  </ul>
				</nav>				
			</div>
			<!--/pagination  -->
			
			<div class="writeReviewBtnWrapper d-flex justify-content-end">
				<button class="btn" id="writeReviewBtn">후기쓰기</button>
			</div>
			
      </div>
      <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">...</div>
    </div>

</div>




