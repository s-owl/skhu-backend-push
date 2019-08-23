<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>
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

<form action="signInDo" method="POST" id="signInForm">
	<div class="form-group">
		<input required="required" type="number" class="form-control" placeholder="교번" name="member_no" id="member_no">
	</div>
	<div class="form-group">
		<input required="required" type="text" class="form-control" placeholder="이름" name="member_name">
	</div>
	<div class="form-group">
		<input required="required" type="text" class="form-control" placeholder="아이디" name="member_id" id="member_id">
		<button type="button" class="btn btn-default pull-right" id="idCheck">중복 확인</button>
	</div>
	<div class="form-group">
		<input required="required" type="password" class="form-control" placeholder="비밀번호" name="member_pw" id="member_pw" style="width:47%; float:left; margin-right: 3%; margin-bottom: 15px;">
		<input required="required" type="password" class="form-control" placeholder="비밀번호 확인" id="member_pwck" style="width:47%; float:right; margin-left: 3%">
		<div id="pwcheck" class="form-group text-left">
		</div>
	</div>
	
	<div class="form-group">
		<select class="form-control" name="member_department" required="required">
			<option value="0">=========담당 부서를 확인해주세요=========</option>
			<option value="1">교무처</option>
			<option value="2">학생복지처</option>
			<option value="3">총무처</option>
			<option value="4">도서관</option>
		</select>
	</div>
	<input type="number" class="form-control" placeholder="전화번호" name="member_pnum" required="required">
	<hr>
	<div>
		<input type="checkbox" id="terms">
		<a href="#">이용약관</a>을 확인하였으며 이에 동의합니다.
	</div>
	<hr>
	<div class="form-group text-center">
        <button type="button" id="join-submit" class="btn btn-primary">회원가입<i class="fa fa-check spaceLeft"></i></button>
        <button type="button" class="btn btn-warning" onclick="gotohome()">가입취소<i class="fa fa-times spaceLeft"></i></button>
    </div>
	
	
</form>
</div>
</body>
<script>
$(document).ready(function(){
	var idChecked = 0;
	var pwChecked = 0;
	var termschecked = 0;
	
	$("#terms").on("click",function(event){
		if($("input:checkbox[id='terms']").is(":checked")==true){
			termschecked = 1;
		}else{
			termschecked = 0;
		}
	});
	
	$("#member_pwck").keyup(function(event){
		var password = $("#member_pw").val();
		var passwordcheck = $("#member_pwck").val();
		if(password == passwordcheck){
			$("#pwcheck").html("<blue>비밀번호가 일치합니다.</blue>");
			pwChecked = 1;
		}
		else{
			$("#pwcheck").html("<red>비밀번호가 일치하지 않습니다.</red>");
			pwChecked = 0;
		}
		
	});
	
	$("#idCheck").unbind("click").click(function(e){
		e.preventDefault();
		var memberId = $("#member_id").val();
		var memberIdValue = {"member_id" : memberId};
		
		if(memberId.length < 1){
			alert("아이디를 입력해주세요.");
		}
		else{
			$.ajax({
				type : "POST",
				url : "/member/checkMemberId",
				data : memberIdValue,
				dataType : "json",
				beforeSend : function(xhr){
					//데이터 전송 전에 헤더에 csrf 값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success : function(checkResult){
					if(checkResult == 0){
						alert("사용할 수 있는 아이디 입니다.");
						idChecked = 1;
					}
					else if(checkResult == 1){
						alert("이미 사용중인 아이디 입니다.\n다른 아이디를 사용해주세요.");
						idChecked = 0;
					}
					else{
						alert("오류가 발생하였습니다.\n관리자에게 문의해주세요.");
						idChecked = 0;
					}
				},
				error : function(error){
					alert("서버가 응답하지 않습니다.\n다시 시도해 주시기 바랍니다.");
				}
			})
		}
	
	});
	
	$("#join-submit").unbind("click").click(function(e){
		if(idChecked == 1 && pwChecked == 1 && termschecked == 1){
			var member_no = $("#member_no").val();
			var memberData = {"member_no" : member_no}
			
			if(member_no.length < 1){
				alert("교번을 입력해주세요.");
			}
			else{
				$.ajax({
					type : "POST",
					data : memberData,
					dataType : "json",
					url : "/member/memberNoCheck",
					beforeSend : function(xhr){
						//데이터 전송 전에 헤더에 csrf 값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(checkResult){
						if(checkResult == 0){
							$("#signInForm").submit();
						}
						else if(checkResult == 1){
							alert("이미 등록되어있는 교번 입니다.");
						}
						else{
							alert("오류가 발생하였습니다.\n관리자에게 문의하여주세요.");
						}
					},
					error : function(error){
						alert("서버가 응답하지 않습니다.\n다시 시도해 주시기 바랍니다.");
					}
				})
				alert("제출하자");
			}
			
		}
		else if(idChecked == 0){
			alert("id를 확인해주세요.");
		}
		else if(pwChecked == 0){
			alert("비밀번호를 확인해주세요.");
		}
		else if(termschecked == 0){
			alert("약관을 확인하여주세요.");
		}
		else{
			alert("오류가 발생하였습니다.\n페이지 새로고침 후 다시 시도해주세요.");
		}
	})
	
})


function gotohome(){
	if(confirm("회원가입을 취소하시겠습니까?")){
		location.href="/";
	}
}

</script>
</html>