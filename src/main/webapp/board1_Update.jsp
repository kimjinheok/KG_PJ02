<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript">
	function chkData() {
		if (document.getElementById('title').value == "") {
			alert("제목을 입력해주세요")
			title.focus()
		} else if (document.getElementById('content').value == "") {
			alert("내용을 입력해주세요");
			content.focus()
		} else {
			fo.submit();
		}
	}
	</script>

</head>
<body>
	<h2>수정 폼</h2>
	<jsp:useBean id="dao" class="board.Board1DAO" />
	
	<c:set var="dto" value="${dao.updateContent(param.bnum) }" />
	<form id="fo" action="modify.jsp" method="post">
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
				<td><input type="text" name="title" id="title" value="${dto.title }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" id="content">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="chkData()">
					<input type="button" value="취소" onclick="location.href='boardList.jsp'">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>