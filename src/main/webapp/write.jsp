<%@page import="board.Board1DTO"%>
<%@page import="board.Board1DAO"%>
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
	
	<h2>게시글 작성</h2>
	<jsp:useBean id="dao" class="board.Board1DAO" />
	
	<c:set var="dto" value="${dao.getName(sessionScope.login) }" />
	<form action="write_save.jsp" method="post">
		<input type="hidden" name="id" value="${dto.id }"> 
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" value="${dto.name }" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="저장">
		<input type="button" value="취소" onclick="location.href='boardList.jsp'">
	</form>

</body>
</html>