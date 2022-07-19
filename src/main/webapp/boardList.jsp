<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		h2 { color: #785D12;}
		table {margin: 0 auto; width: 70%; border: 1px solid #993800; padding: 20px; border-radius: 15px; background-color: beige; }
		button { padding: 5px 5px; align: float-right; border-radius: 5px; border: #FFA46C; background-color: #FFA46C; }
		button:active {border-radius: 5px; background-color: #993800;}
		input { border-radius: 15px; height: 25px; border: 1px solid #993800; width: 30%; }
		#box { background-color: #F5D2BE; border-radius: 15px;}
	</style>
	
	<script type="text/javascript">
	function chkData() {
		if (document.getElementById('val').value == "") {
			alert("검색할 내용을 입력해주세요")
			val.focus()
		} else {
			fo.submit();
		}
	}
	</script>

</head>
<body>
	<%@include file="header.jsp" %>
	
	<h2 align="center"> 우리의 이야기 게시판 </h2>
	<br>
	
	<jsp:useBean id="dao" class="board.Board1DAO" />
	
	<c:set var="totalPage" value="${dao.getTotalPage() }" />
	
	<c:set var="pc" value="${dao.pagingNum(param.start) }" />
	
	<c:set var="list" value="${dao.list(pc.startPage, pc.endPage) }" />
	<form id="fo" action="board_searchList.jsp" method="get">
		<table border="1">
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
				<td colspan="5" align="center">
					<c:choose>
						<c:when test="${param.start == null }">
							<c:set var="s" value="1" />
						</c:when>
						<c:otherwise>
							<c:set var="s" value="${param.start }" />
						</c:otherwise>
					</c:choose>
					총 게시글 [${totalPage }]&nbsp;&nbsp;
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
					
					&nbsp;&nbsp; 현재 페이지 : ${s }/ ${pc.totEndPage } &nbsp;
					 <c:choose>
					 	<c:when test="${login != null }">
					 		<button type="button" onclick="location.href='write.jsp'">글작성</button>
					 	</c:when>
					 </c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<select size="1" name="search" id="box">
						<option value="bnum">번호
						<option value="name">작성자
						<option value="title">제목
						<option value="content">내용
					</select>
					<input type="text" name="val" id="val">
					<button type="button" onclick="chkData()">검색</button>
				</td>
			</tr>
		</table>
	</form>
	<%@include file="footer.jsp" %>
</body>
</html>