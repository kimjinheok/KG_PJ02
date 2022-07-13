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
	<h2>수정 폼</h2>
	<jsp:useBean id="dao" class="board.Board1DAO" />
	
	<c:set var="dto" value="${dao.getContent(param.bnum) }" />
	<form action="modify.jsp" method="post">
		<input type="hidden" name="bnum" value="${dto.bnum }"> 
		<table border="1">
			<tr>
				<td>번호 : ${dto.bnum }</td> <td>조회수 : ${dto.hit }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" value="${dto.name }" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${dto.title }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="location.href='boardList.jsp'">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>