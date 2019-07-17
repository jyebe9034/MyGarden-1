<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
<!--      style -->
<style>
	.imageContainer{height:300px; overflow:hidden;}
	.carousel-inner{margin-top:-120px;}
	.overview{padding:20px 30px 20px 30px;}
	.gardenImg{width:95%px; height:150px; overflow:hidden;}
	.gardenImg img{background-size:cover;}
	.currentActive{background:#4f9c87; color:#fff;}
	.bg-f5{background: #f5f5f5;}
	#gardenUpdateBtn{ display: inline-block; padding: .5em .75em; color: #4f9c87; font-size: inherit; line-height: normal; vertical-align: middle; background-color:#fff; cursor: pointer; border: 1px solid #4f9c87; border-bottom-color: #4f9c87; border-radius: .25em; }
	#gardenUpdateBtn:hover{background:#4f9c87; color:#fff;}
</style>    

<!--      html -->
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left my">
	<h2>마이페이지</h2><hr>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
	<div class="row my">
		<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12 border border-white bg-f5 my">
			<div class="row pt-2 my">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 overview my">
					<h4 class="mt-3">${memDTO.m_name}님의</h4> 
					<h4 class="font-weight-bold">${memDTO.m_garden}</h4>
					<button type="button" id="gardenUpdateBtn" class="mt-3 btn" data-toggle="modal" data-target="#exampleModalCenter">수정하기</button>
					<!-- Modal -->
						<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalCenterTitle">정원 이름, 프로필 수정하기</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        ...
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-primary">수정완료</button>
						      </div>
						    </div>
						  </div>
						</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 overview mb-4 my">
					<div class="gardenImg"><img src="${memDTO.m_profile}"></div>
				</div>
			</div>	
		</div>
		<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 bg-f5 border border-white overview my">
			<h3 class="text-left mt-4">구독현황 &raquo;</h3>
			<h4 class="text-center mt-2">3/week</h4>
			<p class="text-right mt-2"><a href="#" class="badge badge-primary">more</a></p>
		</div>
		<div class="col-lg-3 col-md- col-sm-6 col-xs-12 bg-f5 border border-white overview my">
			<h3 class="text-left mt-4">보유씨앗 &raquo;</h3>
			<h4 class="text-center mt-2">seed개</h4>
			<p class="text-right mt-2"><a href="#" class="badge badge-primary">more</a></p>
		</div>
	</div>	
</div>


<!-- script -->
<script>
	$(function(){
		
	});
</script>