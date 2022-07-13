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
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dao" class="board.Board1DAO" />
	${dao.insert(param.id, param.name, param.title, param.content) }
	<c:redirect url="boardList.jsp" />
</body>
</html>