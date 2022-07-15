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
	<jsp:useBean id="dto" class="board.Board1DTO" />
	<jsp:setProperty property="*" name="dto"/>
	${dao.update(dto) }
	
	<script type="text/javascript">
		alert("게시글 수정이 완료되었습니다.")
		location.href = "content_view.jsp?bnum=${dto.bnum }"
	</script>
	
</body>
</html>