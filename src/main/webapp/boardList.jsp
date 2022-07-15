<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		h2 { background-color: #FFDAA2; color: #785D12;}
	</style>

</head>
<body>
	<%@include file="header.jsp" %>
	<h2 align="center"> 대충 게시판 </h2>
	<hr>
	
	<h3>현재 로그인 정보<br> id : ${sessionScope.login }</h3>
	<hr>
	
	<jsp:useBean id="dao" class="board.Board1DAO" />
	
	<c:set var="totalPage" value="${dao.getTotalPage() }" />
	
	<c:set var="pc" value="${dao.pagingNum(param.start) }" />
	
	<c:set var="list" value="${dao.list(pc.startPage, pc.endPage) }" />
	
	<form action="board_searchList.jsp" method="get">
		<table border="1" align="center">
			<tr>
				<th>번호</th> <th>작성자</th> <th>제목</th> <th>조회수</th>
				<th>등록일</th>
			</tr>
			
			<c:choose>
				<c:when test="${list.size() == 0 }">
					<tr>
						<th colspan="5">게시글이 없습니다.</th>
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
				<td colspan="5">
					<c:choose>
						<c:when test="${param.start == null }">
							<c:set var="s" value="1" />
						</c:when>
						<c:otherwise>
							<c:set var="s" value="${param.start }" />
						</c:otherwise>
					</c:choose>
					총 게시글 [${totalPage }]
					<!-- 이전 버튼 -->
					<c:choose>
						<c:when test="${ s > 1 }">
							<button type="button" onclick="location.href='boardList.jsp?start=${s - 1}'">이전</button>
						</c:when>
						<c:otherwise>
							<button disabled>이전</button>
						</c:otherwise>
					</c:choose>
					
					<c:forEach var="cnt" begin="1" end="${ pc.totEndPage }" step="1">
						[<a href="boardList.jsp?start=${cnt }">
							${cnt}
						</a>]
						
					</c:forEach>
					
					<!-- 다음 버튼 -->
					<c:choose>
						<c:when test="${ s < pc.totEndPage }">
							<button type="button" onclick="location.href='boardList.jsp?start=${s + 1}'">다음</button>
						</c:when>
						<c:otherwise>
							<button disabled>다음</button>
						</c:otherwise>
					</c:choose>
					
					 ${s }/ ${pc.totEndPage } 
					 <c:choose>
					 	<c:when test="${login != null }">
					 		<input type="button" onclick="location.href='write.jsp'" value="글작성">
							<input type="button" onclick="location.href='logout.jsp'" value="로그아웃">
					 	</c:when>
					 	<c:otherwise>
					 		<input type="button" onclick="location.href='login.jsp'" value="로그인">
					 	</c:otherwise>
					 </c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<select size="1" name="search">
						<option value="bnum">번호
						<option value="name">작성자
						<option value="title">제목
						<option value="content">내용
					</select>
					<input type="text" name="val">
					<input type="submit" onclick="" value="검색">
				</td>
			</tr>
		</table>
	</form>
	
	<%@include file="footer.jsp" %>
</body>
</html>