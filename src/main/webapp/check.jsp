<%@page import="member.MemberDAO"%>
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
	
	<%
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		MemberDAO dao = new MemberDAO();
		
		int result = dao.userChk(id, pwd);
		if( result == 1) { //로그인 성공
			session.setAttribute("login", id); //세션 생성
			out.print("<script>alert('" + id + "님 환영합니다');location.href='boardList.jsp'</script>");
			//response.sendRedirect("main.jsp");
		}else if( result == 0 ) { //비밀번호 틀림
	%>
			<script type="text/javascript">
				alert('비밀번호 틀림')
				location.href='login.jsp' //클라이언트에서 번역해서 서버로 요청해서 보내줌
			</script>
	<%	}else { //아이디 없음
	%>
		<script type="text/javascript">
			alert('존재하지 않는 아이디 입니다')
			location.href='login.jsp'
		</script>
	<%	} %>

</body>
</html>