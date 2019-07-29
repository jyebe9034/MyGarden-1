<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../module/bootstrap_cdn.jsp"></jsp:include>
<title>나의 정원 - Products Read</title>
<style>
   #bcolor{
      width : 100%;
      height : 175px;
      background-color : #bee6d3;      
   }
   #titleImg{
      margin-top : 10px;
      width : 90%;
      height : 550px;
      margin : auto;
   }
   .trow{
      border-bottom : 1px solid #9c9c9c;
      height : 35px;
   }
   #table{
      width : 100%;
   }
   table{
      margin : 50px auto;
      border-top : 2px solid #9c9c9c;
      border-bottom : 2px solid #9c9c9c;
   }
   .tTitle{
      width : 200px;
      padding-left : 10px;
   }
   #main{
      margin-top : 30px;
      text-align : center;
   }
   #title{
      font-size : 34px;
      font-weight : 600px;
      margin-top : 50px;
      margin-bottom : 20px;
      color: #222422;
   }
   #text1{
      font-size : 20px;
      font-weight : 400px;
      margin-bottom : 15px;
      color: #222422;
   }
   #text2{
      font-size : 18px;
      font-weight : 400px;
      color: #222422;
   }
   #smCart{
      border : 1px solid #c9c5c5;
      width : 300px;
      height : 300px;
      position : fixed;
      left : 25px;
      bottom : 5px;
      background-color : white;
      border-top-left-radius : 5%;
      border-top-right-radius : 5%;
      box-sizing : border-box;
   }
   #smTitle{
      font-size : 24px;
      font-weight : bold;
      margin : 5px;
      color : #188752;
   }
   #smUnitTitle{
      font-size : 13px;
   }
   #msg{
      font-size : 11px;
      text-align : right;
      margin-top : 5px;
   }
   #smPriceTitle, #smCount{
      font-size : 15px;
   }
   #smTotal{
      font-size : 18px;
      font-weight : bold;
   }
   #smAmount{
      text-align : right;
      margin-bottom : 5px;
   }
   #total{
      font-size : 17px;
      font-weight : bold;
   }
   #getProduct{
      width : 100%;
      height : 50px;
      background-color : #44b27d;
      color : white;
      text-align : center;
      line-height : 50px;
   }
   #getProduct:hover{
      cursor : pointer;
      background-color : #b4d9b5;
   }
   #adBtns{
      margin-top : 10px;
   }
   .adminBtn{
      background-color : #44b27d;
      color : white;
      margin : 5px;
   }
   .adminBtn:hover{
      background-color : #b4d9b5;
      color : white;
   }
</style>
</head>
<body>
   <jsp:include page="../module/fixedHeader.jsp"></jsp:include>
   <div id="wrapper">
      <div id="bcolor"></div>
      <div class="container">
         <c:if test="${grade=='admin'}">
            <div id="adBtns" class="row">
               <input id="updateBtn" class="btn btn-sm adminBtn" type="button" value="수정">
               <input id="deleteBtn" class="btn btn-sm adminBtn" type="button" value="삭제">
            </div>
         </c:if>
         <div class="row">
            <div id="main" class="col-12">
               <img id="titleImg" src="${result.p_imagepath}">
               <div id="title" class="col-12">${result.p_title}</div>
               <div id="text2" class="col-12">${result.p_content}</div>
            </div>
            <div id="table" class="col-12">
               <table>
                  <tr class="trow">
                     <td class="tTitle"> 포장 단위 별 중량(g)</td>
                     <td class="tContent">${result.p_unit}</td>
                  </tr>
                  <tr class="trow">
                     <td class="tTitle"> 제조사 및 생산자</td>
                     <td class="tContent">${result.p_seller}</td>
                  </tr>
                  <tr class="trow">
                     <td class="tTitle"> 원산지</td>
                     <td class="tContent">${result.p_origin}</td>
                  </tr>
                  <tr class="trow">
                     <td class="tTitle"> 제조연원일</td>
                     <td class="tContent">제품 별도 표기</td>
                  </tr>
                  <tr class="trow">
                     <td class="tTitle"> 유통기한</td>
                     <td class="tContent">별도의 유통기한은 없으나 신선식품이므로 가급적 빨리 드시기 바랍니다</td>
                  </tr>
                  <tr class="trow">
                     <td class="tTitle"> 보관방법 및 취급방법</td>
                     <td class="tContent">냉장 보관</td>
                  </tr>
               </table>
            </div>
         </div>
         
         <jsp:include page="../module/boardReviewAndQnA.jsp"></jsp:include>
         
         <div id="smCart" class="row">
            <div id="smTitle" class="col-12">${result.p_title}</div>
            <label id="smUnitTitle" class="col-5">중량/판매단위</label><div id="smUnit" class="col-7">${result.p_unit}</div>
            <label id="smPriceTitle" class="col-5">상품 가격</label><div id="smPrice" class="col-7">${result.p_price}</div>
            <label id="smCount" class="col-5">수량</label>
            <div id="countSelect" class="col-7">
               <select id="smSelect" name="count">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
               </select>
            </div>
            <div id="msg" class="col-12">마이페이지에서 배송일을 확인 할 수 있어요</div>
            <div id="smAmount" class="col-12">
               <label id="smTotal" class="m-0">총 금액 </label>
               <div id="total">${result.p_price}</div>
            </div>
            <div id="getProduct" class="col-12">담 기</div>
         </div>   
      </div>
   </div>
   <jsp:include page="../module/fixedFooter.jsp"></jsp:include>
   
   <script>
       $("#getProduct").on("click",function(){
    	   if(${loginId==null} || ${loginName==null}){
    		   alert("로그인이 필요한 메뉴입니다.");
				$(location).attr("href","/login");
    	   }else{
				var data = new FormData();
				var price = $("#total").html().split("원");
				data.append("c_p_no", "${result.p_no}");
				data.append("c_p_imagepath", "${result.p_imagepath}");
				data.append("c_p_title", "${result.p_title}");
				data.append("c_p_price", "${result.p_price}");
				data.append("c_m_email", "${loginId}");
				data.append("c_count", $("#smSelect").val());
	         $.ajax({
	            url : "insertCart",
	            data : data,
	            type : "post",
	            cache : false,
	            contentType : false,
	            processData : false
	         }).done(function(){
	        	var goCart = confirm("상품을 성공적으로 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?");
				if (goCart) {
					location.href = "cart";
				}
	         })
    	   }
      }) 
      
      $("#updateBtn").on("click", function(){
         location.href = "productsUpdate?pnumber=" + ${result.p_no};
      })
      
      $("#deleteBtn").on("click", function(){
         location.href = "productsDelete?arr=" + ${result.p_no};
      })
      
      $("#smPrice").html(function(){
         var price = $(this).html();
         var result = numberWithCommas(price);
         $(this).html(result);
      })
      
      $("#total").html(function(){
         var price = $(this).html();
         var result = numberWithCommas(price);
         $(this).html(result);
      })
   
      $("#smSelect").on("change", function(){
         var price = ${result.p_price};
         var count = $(this).val();
         var calculate = price * count;
         var result = numberWithCommas(calculate);
         $("#total").html(result);
      })
      
      function numberWithCommas(x) {
          return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
      }
   </script>
</body>
</html>