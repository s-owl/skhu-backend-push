<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/includeURL.jsp"%>

<title>detail board</title>


<script>
function deleteBoard(board_no,board_category){
   if(confirm("삭제하시겠습니까?")){
      location.href = "/boardDelete?board_no="+board_no +"&board_category="+board_category;
      }
   return false;
}
function updateBoard(board_no,board_category){
   location.href = "/board/boardUpdate?board_no="+board_no +"&board_category="+board_category;
}
function boardList(board_category){
    location.href = "/board/boardList?board_category="+board_category;
 }
</script>

<body>

	<div class="container" style="padding-top: 60px;">
		<form id='detailBoard'>
			<input type="hidden" value="${dto.board_no}" name="no" id="board_no" />
			<table class="table table-striped table-hover">
				<thead class="thead-dark">
					<tr>
						<td>작성자</td>
						<td><input type="text" value="${dto.board_writer}"
							name="board_writer" readonly="readonly" style="width: 1100px;" /></td>
					</tr>
					<tr>
						<td>제&nbsp;&nbsp;&nbsp;목</td>
						<td colspan="3"><input type="text" value="${dto.board_title}"
							name="board_title" style="width: 1100px; height: 50px"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td class="boardAreaTitleModal">내&nbsp;&nbsp;&nbsp;용</td>
						<td colspan="3"><textarea name="board_content" id="editor"
								readonly="readonly" style="width: 1100px; height: 205px;">${dto.board_content}</textarea></td>
					</tr>
					<tr>
						<td colspan="4">
					
						<input class="btn btn-outline-secondary" type="button" id="updateBtn" value="수정" onclick="updateBoard(${dto.board_no} ,${board_category})"> 
                  		<input class="btn btn-outline-secondary" type="button" id="deleteBtn" value="삭제" onclick="deleteBoard(${dto.board_no} ,${board_category})">
                		<input id="board_list_button" class="btn btn-outline-secondary" type="reset" value="목록" onclick="boardList(${board_category})">
						</td>
					
					</tr>
				</thead>
			</table>
		</form>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="resource/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>