<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<section id="page-breadcrumb">
     <div class="vertical-center sun">
          <div class="container">
             <div class="row">
                 <div class="action">
                     <div class="col-sm-12">
							<h1 class="title"><b>회원가입</b></h1>
                     </div>
                 </div>
             </div>
         </div>
     </div>
</section>
<div class="container" style="width : 40%">

<form action="signInDo" method="GET" class="signInForm">
	<input type="number" class="form-control" placeholder="교번"><br>
	<input type="text" class="form-control" placeholder="아이디"><br>
	<input type="password" class="form-control" placeholder="비밀번호" style="width:45%; float:left">
	<input type="password" class="form-control" placeholder="비밀번호 확인" style="width:45%; float:right"><br><br><br>
	<input type="text" class="form-control" placeholder="이메일" style="width : 45%;float: left" >
	<select name="member_grade" class="form-control" style="width : 45%;float: right">
		<option value="0">이메일 주소를 선택해주세요</option>
		<option value="1">naver.com</option>
		<option value="2">hanmail.net</option>
		<option value="3">gmail.con</option>
		<option value="4">nate.com</option>
	</select>
	<br><br>
	<hr>
	<div class="form-group text-center">
        <button type="button" id="join-submit" class="btn btn-primary">회원가입<i class="fa fa-check spaceLeft"></i></button>
        <button type="button" class="btn btn-warning" onclick="gotohome()">가입취소<i class="fa fa-times spaceLeft"></i></button>
    </div>
	
	
</form>
</div>
</body>
<script>
function gotohome(){
	if(confirm("회원가입을 취소하시겠습니까?")){
		location.href="/"
	}
}
</script>
</html>