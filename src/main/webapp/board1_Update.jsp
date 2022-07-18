<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style type="text/css">
		h2 { color: #785D12;}
		form { margin: 0 auto; width: 50%; height: 700px; border: 1px solid #993800; padding: 20px; border-radius: 15px; background-color: beige; }
		table {margin: 0 auto; width: 100%;}
		th { vertical-align: top;}
		div {text-align: center;}
		input { border-radius: 15px; height: 25px; border: 1px solid #993800; width: 95%; }
		textarea { border-radius: 15px; width: 95%; border: 1px solid #993800; height: 550px;}
		button { padding: 10px 20px; align: float-right; border-radius: 5px; border: #FFA46C; background-color: #FFA46C; }
		button:active {border-radius: 10px; background-color: #993800;}
	</style>

	<script type="text/javascript">
	function chkData() {
		if (document.getElementById('title').value == "") {
			alert("제목을 입력해주세요")
			title.focus()
		} else if (document.getElementById('content').value == "") {
			alert("내용을 입력해주세요");
			content.focus()
		} else {
			fo.submit();
		}
	}
	</script>

</head>
<body>
	
	<jsp:useBean id="dao" class="board.Board1DAO" />	
	<c:set var="dto" value="${dao.updateContent(param.bnum) }" />
	
	<h2 align="center">${dto.bnum }번 게시글 수정</h2>
	<form id="fo" action="modify.jsp" method="post">
		<table>
			<tr>
				<th>번호</th>
				<td><input type="text" name="bnum" value="${dto.bnum }" readonly></td>
			</tr>
			<tr>
				<th >작성자</th>
				<td><input type="text" name="name" value="${dto.name }" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title" value="${dto.title }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
						<button type="button" onclick="chkData()">수정</button>
						<button type="button" onclick="location.href='boardList.jsp'">취소</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>