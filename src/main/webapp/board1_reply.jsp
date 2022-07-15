<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="board.Board1DTO" />
	<jsp:setProperty property="*" name="dto"/>
	
	<jsp:useBean id="dao" class="board.Board1DAO" />
	${dao.reply(dto) }
	
	<script type="text/javascript">
		alert("답변 작성이 완료되었습니다.")
		location.href = "boardList.jsp"
	</script>
</body>
</html>