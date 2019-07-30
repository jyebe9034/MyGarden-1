<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 정원 - 문의글</title>
<jsp:include page="/WEB-INF/views/module/bootstrap_cdn.jsp" />
<style>
div {
   /*       border: 1px solid black; */
   
}

#qnaHeaderImg {
   width: 100% !important;
}

#qnaWrapper {
   width: 1000px;
   margin: 50px auto;
}

#updateQnAForm {
   width: 90%;
   margin: 0 auto;
   /*       background-color: #e8ede1; */
   border: 1px solid lightgrey;
   border-radius: 5px;
}

.inputTitleRow {
   margin-bottom: 3px;
}

#inputTitle {
   padding: 0 40px;
   margin-top: 25px;
   border: none;
   font-size: 30px;
   font-weight: 500;
   color: #709468;
   background-color: white;
}

.writerInfoRow {
   color: #949993;
   width: 95%;
   margin: auto;
   margin-top: -10px;
   font-size: 15px;
   font-size: 13px;
   font-weight: 500;
}

.profileImg {
   width: 30px;
   height: 30px;
   border-radius: 50px;
}

#inputContent {
   /*       height: 300px; */
   width: 100%;
   margin: 0 auto;
   border: none;
   border-radius: 5px;
   padding: 10px 35px;
   color: #515c4e;
   font-size: 20px;
   font-weight: 300;
   font-family: sans-serif;
   word-break: break-all;
}

.imagesRow {
   width: 100%;
   margin: 0 auto;
}

.imagesBox {
   width: 100%;
}

.imagesRow img {
   /*       height: 150px; */
   max-width: 100%;
   margin: 15px auto;
}

.btnsRow {
   width: 100%;
}

.btnsRow div {
   text-align: right;
   width: 80%;
}

.btns button {
   margin: 0 5px;
}

#commentBtn, #updateCommentBtn {
   background-color: #44b27d;
   color: white;
   font-weight: bold;
   border: 0px;
}

.goBackBtn {
   border: 1px solid #44b27d;
   color: #44b27d;
   font-weight: bord;
}

#commentBtn:hover, #updateCommentBtn:hover {
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
   border: 1px solid #b4d9b5;
   cursor: pointer;
}

.deleteBtn {
   background-color: #44b27d;
   color: white;
   font-weight: bold;
   border: 0px;
}

.deleteBtn:hover {
   background-color: #b4d9b5;
   color: white;
   font-weight: bold;
   border: 0px;
   cursor: pointer;
}

.updateBtn {
   background-color: #44b27d;
   color: white;
   font-weight: bold;
   border: 0px;
}

.updateBtn:hover {
   background-color: #b4d9b5;
   color: #44b27d;
   font-weight: bold;
   border: 0px;
   cursor: pointer;
}

#answerWrapper {
   width: 90%;
   min-height: 350px;
   margin: 0 auto;
   /*       background-color: #e8ede1; */
   border: 1px solid lightgrey;
   border-radius: 5px;
   margin-top: 50px;
}

.commentBtnRow {
   width: 90%;
}

.commentRow {
   width: 98%;
   margin: auto;
   border-radius: 5px;
}

.commentLabelBox {
   height: 20%;
}

.commentLabelBox img {
   margin-bottom: 15px;
}

#answerWrapper label {
   padding: 15px 5px;
   border: none;
   font-size: 30px;
   font-weight: 500;
   color: #709468;
   background-color: white;
}

.blankComment {
   background-color: white !important;
}

#inputComment {
   width: 95%;
   margin: 0 auto;
   min-height: 200px;
   border-radius: 10px;
   padding: 15px;
   color: #515c4e;
   background-color: #ecf7e9;
   font-size: 20px;
   font-weight: 300;
   font-family: sans-serif;
   word-break: break-all;
}

.commentBtnRow{
    width: 92%;
    margin: auto;
    text-align: right;
}
.commentBtnBox {
	margin: 15px 0;
}

#editBtn {
   background-color: #44b27d;
   color: white;
   font-weight: bold;
}

#editBtn:hover {
   background-color: #b4d9b5;
   color: #44b27d;
   font-weight: bold;
   border: 0px;
   cursor: pointer;
}

#delCommentBtn {
   background-color: #44b27d;
   color: white;
   margin-right: 20px;
   font-weight: bold;
}

#delCommentBtn:hover {
   background-color: #b4d9b5;
   color: white;
   border: 0px;
}

.goBackBtnBox{
   width: 85%;
   margin: auto;
   margin-top: 20px;
/*     text-align: center;  */
}
.goBackBtn{
   width: 120px;
}

[contentEditable=true]:empty:not(:focus ):before {content: attr(data-text)};
</style>

<!-- script -->
<script>
   $(function(){
      
       var grade = "${grade}";
      var writer = "${writerInfo.m_email}";
      var loginId = "${loginId}";
      var checkedSr = "${readQnA.bq_checkedSecret}";
      if(checkedSr == 'y' && writer != loginId && grade !='admin'){
         alert("비밀글 입니다.");
         var pnumber = "${pnumber}";
         location.href = "productsRead?&revPage=1&qnaPage=1&pnumber=" + pnumber;
      }
      
      $(".goBackBtn").on("click",function(){
         //$(location).attr("href","/");
         var pnumber = "${pnumber}";
         location.href = "productsRead?&revPage=1&qnaPage=1&pnumber=" + pnumber;
         
      })
   
      $(".updateBtn").on("click",function(){
         var bq_no = ${bq_no};
         $(location).attr("href","updateQnAForm?bq_no="+bq_no);
      })
      
      $(".deleteBtn").on("click",function(){
         var bq_no = ${bq_no};
         $(location).attr("href","deleteQnA?bq_no="+bq_no);
      })
      

   
//       $(document).on('keyup', '#inputComment', function() { //내용 글자수 입력 제한
//          var inputComment = $("#inputComment").html();
//          var cntCmt = $("#forCntCmt").val(inputComment);
//          //alert("입력한거ㅡㅡ: " + cntCmt.val());
//             if ($(cntCmt).val().length > 100) {
//                $("#inputComment").html($(cntCmt).val().substring(0, 100)); 
//                alert("내용은 700자 이내만 입력이 가능합니다.");
//             }
//          });
      
      $(document).on("click","#commentBtn",function(){  //답변 등록
         var inputComment = $("#inputComment").html();
         //$("#cq_comment").val(inputComment);
         
         if(inputComment==""){
            alert("답변을 입력해주세요.");
            event.preventDefault();
         }else{
            var data = {
                  cq_p_no : "${readQnA.bq_p_no}",
                  cq_no : "${readQnA.bq_no}",
                  cq_name : "${loginName}",
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
                   $("#inputComment").css("background-color","white");
                  $(".commentBtnBox").html("<button class='btn' id='delCommentBtn'>삭제하기</button>"
                        + "<button type='button' class='btn' id='editBtn'>수정하기</button>");
                  alert("답변이 등록되었습니다.");
               }
            })   
         }
         
      })
            
         
            $(document).on("click","#editBtn",function(){ //답변 수정 가능한 형태로~
            
               $("#inputComment").attr("contenteditable","true");
               $("#inputComment").css("background-color","#ecf7e9");
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
                     alert("답변이 수정되었습니다.")   ;   
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
                     //alert("resp" + resp);
                     $("#answerWrapper").html("");
                     $("#answerWrapper").append("<div class=\"form-group row commentRow\">"
                           +"<div class=\"col-12 commentLabelBox\">"
                           +"<img src=\"resources/products/adminCmtImg.png\">"
                           +"<label for=\"cq_comment\" class=\"col-form-label\">관리자 답변</label>"
                           +"</div>"
                           +"<div class=\"col-12 inputCommentBox\">"
                           +"<div contenteditable=\"true\" id=\"inputComment\" data-text=\"내용을 입력해주세요.\"></div>"
                           +"<input type=\"hidden\" id=\"forCntCmt\">"
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
   <jsp:include page="/WEB-INF/views/module/fixedHeader.jsp" />
   <!--          carousel -->
   <div class="container-fluid my">
      <div class="row my">
         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 my">
            <img src="">
         </div>
      </div>
   </div>

<img alt="" src="/resources/products/qnaHeader.jpg" id="qnaHeaderImg">

      <!-- 리뷰 작성 폼 -->
      <div id="qnaWrapper">
         <!--       <span>문의하기</span> -->
         <!--       <hr> -->
   
         <div id="qWrapper">
            <form action="updateQnA" id="updateQnAForm" method="post"
               enctype="multipart/form-data">
   
               <div class="form-group row inputTitleRow">
                  <!--           <label for="inputTitle" class="col-sm-2 col-form-label">제목</label> -->
                  <div class="col-sm-12">
                     <input type="text" class="form-control" id="inputTitle"
                        name="bq_title" value="${readQnA.bq_title }" readOnly>
                  </div>
               </div>
   
               <div class="row writerInfoRow">
                  <div class="col-12">
                     <img src="${writerInfo.m_profile}" class="profileImg"
                        border="1px solid black"> <span class="writerInfo">
                        ${readQnA.bq_name }/작성자/${readQnA.bq_writedate }
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
                     <p>
                        <img src="${readQnA.bq_imagepath1 }"
                           onerror="this.style.display='none'" data-toggle="modal"
                           data-target=".bd-example-modal-lg">
                     </p>
                     <input type="hidden" value="${readQnA.bq_imagepath1 }">
                     <p>
                        <img src="${readQnA.bq_imagepath2 }"
                           onerror="this.style.display='none'">
                     </p>
                     <p>
                        <img src="${readQnA.bq_imagepath3 }"
                           onerror="this.style.display='none'">
                     </p>
                  </div>
               </div>
   
               <div class="form-group row btnsRow">
                  <div class="col-12 btns">
   
                        <c:if test="${loginId eq readQnA.bq_email }">
                           <button type="button" class="btn deleteBtn">삭제하기</button>
                           <button type="button" class="btn updateBtn">수정하기</button>
                        </c:if>
                  </div>
               </div>
            </form>
            <div id="answerWrapper">
   
               <c:choose>
                  <c:when test="${readQnA.bq_checkedAns eq 'n' and grade eq 'admin'}">
                     <!-- ========================답변(관리자만 가능)============================= -->
   
                     <div class="form-group row commentRow">
                        <div class="col-12 commentLabelBox">
                           <img src="resources/products/adminCmtImg.png"> <label
                              for="cq_comment" class="col-form-label">관리자 답변</label>
                        </div>
                        <div class="col-12 inputCommentBox">
                           <div contenteditable="true" id="inputComment" data-text="내용을 입력해주세요."></div>
                           <input type="hidden" id="forCntCmt">
                        </div>
                     </div>
                     <div class="row commentBtnRow">
                        <div class="col-12 commentBtnBox">
                           <button class="btn" id="commentBtn">답변등록</button>
                        </div>
                     </div>
   
                  </c:when>
                  <c:when test="${readQnA.bq_checkedAns eq 'n' and grade ne 'admin'}">
                     <div class="form-group row commentRow">
                        <div class="col-12 commentLabelBox">
                           <img alt="" src="resources/products/adminCmtImg.png"> <label
                              for="cq_comment" class="col-form-label">관리자 답변</label>
                        </div>
                        <div class="col-sm-12 inputCommentBox">
                           <div contenteditable="false" id="inputComment"
                              class="blankComment" data-text="">현재 등록된 답변이 없습니다.</div>
                           <input type="hidden" id="forCntCmt">
                        </div>
                     </div>
   
                  </c:when>
                  <c:otherwise>
                     <div class="form-group row commentRow">
                        <div class="col-sm-12 commentLabelBox">
                           <img src="resources/products/adminCmtImg.png">   
                           <label for="cq_comment" class="col-form-label">관리자
                              답변</label>
                        </div>
                        <div class="col-sm-12 inputCommentBox">
                           <div contenteditable="false" id="inputComment">${commentList.cq_comment }</div>
                        </div>
                     </div>
                     <c:if test="${readQnA.bq_checkedAns eq 'y' and grade eq 'admin'}">
                        <div class="row commentBtnRow">
                           <div class="col-12 commentBtnBox">
                              <button class="btn" id="delCommentBtn">삭제하기</button>
                              <button class="btn" id="editBtn">수정하기</button>
                           </div>
                        </div>
                     </c:if>
                  </c:otherwise>
               </c:choose>
   
               <!--       <div class="cq_comment"></div> -->
            </div>
   
   
   
   
         </div>
         <div class="goBackBtnBox">
            <button type="button" class="btn goBackBtn">돌아가기</button>
         </div>
      </div>
      
   

   


   <!--    footer -->
   <jsp:include page="/WEB-INF/views/module/fixedFooter.jsp" />

</body>
</html>