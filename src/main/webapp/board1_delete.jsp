<%@page import="board.Board1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Board1DAO dao = new Board1DAO();
		dao.delete(request.getParameter("bnum"));
	%>
	<script type="text/javascript">
		alert("삭제가 완료되었습니다.")
		location.href = "boardList.jsp"
	</script>

</body>
</html>