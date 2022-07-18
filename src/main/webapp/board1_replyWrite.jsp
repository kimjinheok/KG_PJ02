<%@page import="board.Board1DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		h2 { color: #785D12;}
		form { margin: 0 auto; width: 70%; height: 700px; border: 1px solid #993800; padding: 20px; border-radius: 15px; background-color: beige; }
		table {margin: 0 auto; width: 100%;}
		th { vertical-align: top;}
		div {text-align: center;}
		input { border-radius: 15px; height: 25px; border: 1px solid #993800; width: 95%; }
		textarea { border-radius: 15px; width: 95%; border: 1px solid #993800; height: 480px;}
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

	<h2 align="center">댓글 게시판 작성</h2>
	<jsp:useBean id="dao" class="board.Board1DAO" />
	<c:set var="nhdto" value="${dao.getReNumHit(param.bnum) }" />
	<c:set var="indto" value="${dao.getName(sessionScope.login) }" />
	
	<form id="fo" action="board1_reply.jsp" method="post">
		
		
		<input type="hidden" name="idgroup" value="${nhdto.idgroup }">
		<input type="hidden" name="step" value="${nhdto.step }">
		<input type="hidden" name="indent" value="${nhdto.indent }">
		<table>
			<tr>
				<th>번호</th>
				<td><input type="text" name="bnum" value="${nhdto.bnum }" readonly></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${indto.id }" readonly></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${indto.name }" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
						<button type="button" onclick="chkData()">저장</button>
						<button type="button" onclick="location.href='content_view.jsp?bnum=${nhdto.bnum }'">취소</button>
					</div>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>