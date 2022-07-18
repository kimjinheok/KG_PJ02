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
	<h2>대충 검색 결과</h2>
	
	<% request.setCharacterEncoding("utf-8"); %>
	
	<c:set var="val" value="${param.val }" />
	
	<jsp:useBean id="dao" class="board.Board1DAO" />
	
	<c:choose>
		<c:when test="${param.search == 'bnum' }">
			<c:set var="list" value="${dao.searchBnList(val) }" />
		</c:when>
		<c:when test="${param.search == 'name' }">
			<c:set var="list" value="${dao.searchNmList(val) }" />
		</c:when>
		<c:when test="${param.search == 'title' }">
			<c:set var="list" value="${dao.searchTtList(val) }" />
		</c:when>
		<c:when test="${param.search == 'content' }">
			<c:set var="list" value="${dao.searchCtList(val) }" />
		</c:when>
	</c:choose>
	
	<table border="1" align="center">
		<tr>
			<td>번호</td> <td>작성자</td> <td>제목</td> <td>조회수</td> <td>등록일</td>
		</tr>
		
		<c:choose>
				<c:when test="${list.size() == 0 }">
					<tr>
						<th colspan="5">검색 결과가 없습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.bnum }</td> <td>${dto.name }</td>
							<td>
								<c:forEach begin="1" end="${dto.indent }">└</c:forEach>
								<a href="content_view.jsp?bnum=${dto.bnum }">${dto.title }</a>
							</td> 
							<td>${dto.hit }</td> <td>${dto.savedate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5" align="center">
					<input type="button" onclick="location.href='boardList.jsp'" value="목록">
				</td>
			</tr>
	</table>
	
</body>
</html>