<%@page import="board.Board1DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

	<h2>댓글 게시판 작성</h2>
	<jsp:useBean id="dao" class="board.Board1DAO" />
	<c:set var="nhdto" value="${dao.getReNumHit(param.bnum) }" />
	<c:set var="indto" value="${dao.getName(sessionScope.login) }" />
	
	<form id="fo" action="board1_reply.jsp" method="post">
		
		<input type="hidden" name="bnum" value="${nhdto.bnum }">
		<input type="hidden" name="idgroup" value="${nhdto.idgroup }">
		<input type="hidden" name="step" value="${nhdto.step }">
		<input type="hidden" name="indent" value="${nhdto.indent }">
		<input type="hidden" name="name" value="${indto.name }">
		<input type="hidden" name="id" value="${indto.id }">
		<table border="1">
			<tr>
				<td>번호</td> <td>${nhdto.bnum }</td>
			</tr>
			<tr>
				<td>조회수</td> <td>${nhdto.hit }</td>
			</tr>
			<tr>
				<td>아이디</td> <td>${indto.id }</td>
			</tr>
			<tr>
				<td>이름</td> <td>${indto.name }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="답변" onclick="chkData()">
					<input type="button" onclick="location.href='content_view.jsp?bnum=${nhdto.bnum }'" value="취소" >
				</td>
			</tr>
		</table>
	</form>

</body>
</html>