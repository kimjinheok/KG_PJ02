<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style type="text/css">
		* { margin: 0; }
		.hdv { background-color:beige; margin: auto; }
		.title { text-shadow: 10px 10px 15px; font-size: 50pt; text-align: center; }
		img { position: absolute; left: 100px; top: 0; z-index: 1; }
		h1 a {text-decoration: none; color: #785D12;}
		nav { margin-top: 30px;  background-color: #785D12; }
		nav ul { display: flex; list-style: none; }
		nav ul li { padding: 10px; margin: auto; }
		nav ul li a { text-decoration: none; color: white; }
		nav ul li:hover { background-color: #783C12;}
	</style>

</head>
<body>
	<div class="hdv">
	<h1 class="title" ><a href="login.jsp">my pet</a></h1>
	<img src="3.png" width="120" height="120">
	<nav>
		<ul>
			<li><a href="#">공지사항</a></li>
			<li><a href="boardList.jsp">우리의 이야기</a></li>
			<li><a href="#">shop</a></li>
			<c:choose>
			 	<c:when test="${login != null }">
			 		<li><a href="#">나의 정보</a></li>
			 		<li><a href="logout.jsp">로그아웃</a></li>
			 	</c:when>
			 	<c:otherwise>
			 		<li><a href="#">회원가입</a></li>
			 		<li><a href="login.jsp">로그인</a></li>
			 	</c:otherwise>
			 </c:choose>
		</ul>
	</nav>
	</div>
</body>
</html>