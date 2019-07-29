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
<div class="container" style="width : 40%;padding-top: 50px;">

<form action="signInDo" method="GET" class="signInForm">
	<input required="required" type="number" class="form-control" placeholder="교번" name="member_no"><br>
	<input required="required" type="text" class="form-control" placeholder="이름" name="member_name"><br>
	<input required="required" type="text" class="form-control" placeholder="아이디" name="member_id"><br>
	<input required="required" type="password" class="form-control" placeholder="비밀번호" name="member_pw" id="member_pw" style="width:45%; float:left">
	<input required="required" type="password" class="form-control" placeholder="비밀번호 확인" id="member_pwck" style="width:45%; float:right">
	<div class="pwcheck"></div>
	<br><br><br>
	
	<select class="form-control" name="member_department" required="required">
		<option value="0">=========담당 부서를 확인해주세요=========</option>
		<option value="1">교무처</option>
		<option value="2">학생복지처</option>
		<option value="3">총무처</option>
		<option value="4">도서관</option>
	</select>
	<br>
	<input type="number" class="form-control" placeholder="전화번호" name="member_pnum" required="required">
	<br>
	<div>
		<input type="checkbox" id="terms">
		<a href="#">이용약관</a>을 확인하였으며 이에 동의합니다.
	</div>
	<br>
	<hr>
	<div class="form-group text-center">
        <button type="submit" id="join-submit" class="btn btn-primary">회원가입<i class="fa fa-check spaceLeft"></i></button>
        <button type="button" class="btn btn-warning" onclick="gotohome()">가입취소<i class="fa fa-times spaceLeft"></i></button>
    </div>
	
	
</form>
</div>
</body>
<script>
$(document).ready(function({
	var 
}))


function gotohome(){
	if(confirm("회원가입을 취소하시겠습니까?")){
		location.href="/"
	}
}

</script>
</html>