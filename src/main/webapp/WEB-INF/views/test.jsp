<%@ page import="java.net.URLEncoder" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><html>
<head>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
p{border:1px solid #000; float:left; margin:10px; padding:10px; cursor:pointer; text-indent:-9999;}
p:hover{background:#eee;}
</style>
<body>
  <script>
  
//   var lastDay = ( new Date( 년도입력, 월입력, 0) ).getDate();

//   int_d = new Date(2011, 7,0);    // 구하고자 하는 년,월,일

//   d = new Date(int_d);

//   console.log(d.getDate()); 

// var today = new Date();
// var dd = today.getDate();
// var mm = today.getMonth()+1; //January is 0!
// var yyyy = today.getFullYear();
// console.log(yyyy+"-"+mm+"-"+dd);
// if(dd<10) {
//     dd='0'+dd
// } 

// if(mm<10) {
//     mm='0'+mm
// } 

// today = mm+'/'+dd+'/'+yyyy;
// document.write(today);


//----------------------------

// function getInputDayLabel() {
    
//     var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
    
//     var today = new Date(yyyy+"-"+mm+"-"+dd).getDay();
//     var todayLabel = week[today];
    
//     return todayLabel;
// }
 
 
// console.log(getInputDayLabel())
// // 목요일

//---------------------------


// var today = new Date();
// var dd = today.getDate();
// var mm = today.getMonth()+1; //January is 0!
// var yyyy = today.getFullYear();
  
//   for(var i=0; i<12; i++){
// 	  $('.month:nth-child('+i+1+')').text(i+1);
// 	  var chooseMonth = new Date(yyyy, i+1, 0);
// 	  var maxDay = new Date(chooseMonth).getDate();
// 	  for(var j=1; j<=maxDay; j++){
// 		  $('.day').after("<span>"+j+"</span>");
// 	  }
//   }
<!--   </script> -->
  
 
<!--   <div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!-- 	  <div class="month"></div> -->
<!--    </div>  -->
<button id="btn">button</button>
<script>
	$('#btn').on('click', function(){
		$(location).attr('href', '/test');
	});
</script>
	<br> ${year } <br>
	<div id="div"></div>
	<h6>1월</h6>
		<c:forEach begin="1" end="${maxDay[0]}" step="1" var="x">
		  <div><p>${ x }</p></div>
		</c:forEach>
	<h6>2월</h6>
		<c:forEach begin="1" end="${maxDay[1]}" step="1" var="x">
		  <div><p>${ x }</p></div>
		</c:forEach>
	<h6>3월</h6>
		<c:forEach begin="1" end="${maxDay[2]}" step="1" var="x">
		  <div><p>${ x }</p></div>
		</c:forEach>

</body>
</html>