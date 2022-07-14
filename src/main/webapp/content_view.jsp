<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>대충 게시글 내용</h2>
	<jsp:useBean id="dao" class="board.Board1DAO" />
	<c:set var="dto" value="${dao.getContent(param.bnum) }" />
	
		<table border="1">
			<tr>
				<td>번호 : ${dto.bnum }</td> <td colspan="2">제목 : ${dto.title }</td>
			</tr>
			<tr>
				<td>아이디 : ${dto.id }</td> <td>작성자 : ${dto.name }</td> <td>조회수 : ${dto.hit }</td>
			</tr>
			<tr>
				<td colspan="3">내용</td> 
			</tr>
			<tr>
				<td colspan="3">${dto.content }</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" onclick="location.href='boardList.jsp'" value="목록">
					<input type="button" onclick="location.href='board1_Update.jsp?bnum=${dto.bnum }'" value="수정">
					<input type="button" onclick="location.href='board1_delete.jsp?bnum=${dto.bnum}'" value="삭제">
					<input type="button" onclick="location.href='board1_replyWrite.jsp?bnum=${dto.bnum}'" value="댓글">
				</td>
			</tr>
		</table>
</body>
</html>