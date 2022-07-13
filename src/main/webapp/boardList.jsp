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
	<h2 align="center"> 소통 게시판 </h2>
	<jsp:useBean id="dao" class="board.Board1DAO" />
	<table border="1" align="center">
		<tr>
			<th>번호</th> <th>작성자</th> <th>제목</th> <th>조회수</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="dto" items="${dao.list() }">
			<tr>
				<td>${dto.bnum }</td> <td>${dto.name }</td>
				<td><a href="content_view.jsp?bnum=${dto.bnum }">${dto.title }</a></td> 
				<td>${dto.hit }</td> <td>${dto.savedate }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<input type="button" onclick="location.href='write.jsp'" value="글작성">
				<input type="button" onclick="location.href='logout.jsp'" value="로그아웃">
			</td>
		</tr>
	</table>
</body>
</html>