<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="gender" class="pl-5 pr-5" method="post" enctype="multipart/form-data">
<div class="filebox"> 
	<div class="profile"><img id="p_image" src="resources/img/profile.png" width="130" height="130"></div>
	<label for="ex_file">프로필&#x02295;</label> 
	<input type="file" id="ex_file" name="m_profile"> 
</div>	                    	
   <input type="text" placeholder="나만의 정원 이름을 지어주세요" class="fadeIn inputStuff" name="m_garden"/>
   <input type="text" placeholder="사용자 이름을 입력하세요" class="fadeIn inputStuff" name="m_name">
   <input type="email" placeholder="사용하실 메일주소를 입력하세요" class="fadeIn inputStuff" name="m_email">
   <input type="password" placeholder="영문, 숫자  8자리 이상을 조합해 비밀번호를 입력하세요" class="fadeIn inputStuff" name="m_pw">
   <input type="password"d placeholder="입력하신 비밀번호를 확인하세요" id="password" class="fadeIn inputStuff">
   <input type="text" placeholder="휴대폰 번호를 입력하세요 ex)010-000-0000" class="fadeIn inputStuff" name="m_phone">
   <div class="postCode">
   <input type="text" placeholder="우편번호를 검색하세요" class="fadeIn inputStuff" name="m_zipcode">
   	<button type="button" id="joinBtn" class="mb-3"><img src="resources/img/post.png" width="38" height="36"></button>
   </div>	
  	<p class="fontGreen mt-3">생년월일과 성별을 입력하세요</p>
 		<input type="date" id="date" class="fadeIn inputStuff mb-2" name="m_birth"/>
   <div class="custom-control custom-radio custom-control-inline ml-3">
  <input type="radio" id="customRadioInline1" value="f" name="m_gender" class="custom-control-input">
  <label class="custom-control-label" for="customRadioInline1">여성</label>
</div>
<div class="custom-control custom-radio custom-control-inline">
  <input type="radio" id="customRadioInline2" value="m" name="m_gender" class="custom-control-input">
  <label class="custom-control-label" for="customRadioInline2">남성</label>
</div>
<div class="custom-control custom-switch mt-4 mb-4">
  <input type="checkbox" class="custom-control-input" id="customSwitch1">
  <label class="custom-control-label" for="customSwitch1">서비스 이용약관, 개인정보취급방침을 모두 확인했으며 이에 동의합니다</label>
</div>
    <input type="reset" class="mb-1" value="다시쓰기">
    <input type="submit" value="가입하기">
</form>

<form action="profile" method="post" enctype="multipart/form-data">
		<input type="text" name="name"><br>
		<input type="file" name="image"><br>
		<input type="submit" value="send">
	</form>
</body>
</html>