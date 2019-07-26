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
							<h1 class="title"><b>로그인</b></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
<div class="container" style="width:40%; padding-top: 50px;">
		<form action="/login" method="post" class="login-form">
			<input type="text" name="member_id" placeholder="username" class="form-control">
			<br>
			<input type="password" name="member_pw" placeholder="password" class="form-control">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}">
			<br>
			<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
			    <font color="red">
			        <p>아이디, 비밀번호를 확인하세요</p>
			        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
			    </font>
			</c:if>
			<div class="logInArea">
				<div class="loginSaveBtn">
		  	  		<input type="checkbox" name="_spring_security_remember_me" value="1" class="pull-left"/>　
		 			<label>로그인 저장</label>
		 		</div>
		 		<div class="logInBtn">
					<input type="submit" value="logIn" class="btn btn-default"><br>
				</div>
			</div>
			<hr>
			<p class="message">계정이 없으신가요?<a href="/member/signIn">회원가입</a></p>
		</form>
</div>
</body>
</html>