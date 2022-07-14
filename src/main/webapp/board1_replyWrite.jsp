<%@page import="board.Board1DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>댓글 게시판 작성</h2>
	<jsp:useBean id="dao" class="board.Board1DAO" />
	<c:set var="dto" value="${dao.getContent(param.bnum) }" />
	
	<form action="board1_reply.jsp" method="post">
		
		<input type="hidden" name="bnum" value="${dto.bnum }">
		<input type="hidden" name="idgroup" value="${dto.idgroup }">
		<input type="hidden" name="step" value="${dto.step }">
		<input type="hidden" name="indent" value="${dto.indent }">
		<input type="hidden" name="name" value="${dto.name }">
		<input type="hidden" name="id" value="${dto.id }">
		<table border="1">
			<tr>
				<td>번호</td> <td>${dto.bnum }</td>
			</tr>
			<tr>
				<td>조회수</td> <td>${dto.hit }</td>
			</tr>
			<tr>
				<td>아이디</td> <td>${dto.id }</td>
			</tr>
			<tr>
				<td>이름</td> <td>${dto.name }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${dto.title }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="답변">
					<input type="button" onclick="location.href='content_view.jsp?bnum=${dto.bnum }'" value="취소" >
				</td>
			</tr>
		</table>
	</form>

</body>
</html>