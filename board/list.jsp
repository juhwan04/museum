<%@page import="java.io.IOException"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- EL커스텀 함수를 이용하려면 지시자 태그 설정이 필요함 --%>
<%@ taglib prefix="ElCeil" uri="/WEB-INF/tlds/el-function.tld"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css" media="screen">
<title>게시글 목록</title>
</head>
<body>
<tr height="50">

</tr>
<!-- 본문 표시 코드 -->
<tr height="500" valign="top">
<td>
<a href='<c:url value="/Board.do?action=memberList"/>'>my글</a>&nbsp;
<a href="/museum/Board.do?action=write">글쓰기</a>&nbsp;
<a href="/museum/Member.do?action=myPage">박물관닷컴</a>
<h3>게시판 목록입니다.</h3>
<table>
<%-- 글 목록을 담은 list에서 글을 하나씩 추출 --%>
<c:forEach var="board" items="${lists}">
<tr>
<%-- 하나씩 추출한 글들의 이름, 제목(누르면 상세내용 조회), 작성일, 조회수를 출력 --%>
<td>${board.bbsno}<td>
<td>${board.nickName}</td>
<%-- 조회하려면 서블릿을 거쳐 가야 하기에 서블릿의 주소로 조회한다는 요청표시(action=view), 글을 조회하는데 필요한 bbsno도 같이 넘겨줌. --%>
<td><a href='<c:url value="/Board.do?action=view&bbsno=${board.bbsno}"/>'>${board.subject}</a></td>
<td>${board.writeDate}</td>
<td>조회수 ${board.readCount}</td>
</tr>
</c:forEach>
<%-- 글 작성자, 제목 등의 출력 종료. --%>
<tr>
<%-- 여기서부터 페이지 처리 코드 --%>
<td colspan=4>
<h6 align="center">
<%-- 현재 내가 표시해야할 페이지의 총 개수와 현재 무슨 페이지를 클릭했는지는 서블릿이 처리해서 넘겨 준 상태
	그 값들을 토대로 계산 - 총 페이지 개수가 11개다 = totalPageBlock은 2가 되어야 함. 페이지도 10개씩 출력.
	내가 누른게 1~10페이지 사이라면 nowPageBlock은 1. 
	startPage와 end는 항상 현재 페이지 블록에 의해서 결정 - (ex : 3페이지라면 시작페이지는 1, 끝 페이지는 10).
	 --%>
	<c:set var="totalPageBlock" value="${ElCeil:ElCeil(totalPageCount/10.0)}" />
	<c:set var="nowPageBlock" value="${ElCeil:ElCeil(page/10.0)}" />
	<c:set var="startPage" value="${(nowPageBlock-1)*10+1}" />
<c:choose>
	<c:when test="${totalPageCount gt nowPageBlock*10}">
	<c:set var="endPage" value="${nowPageBlock*10}" />
	</c:when>
	<c:otherwise>
	<c:set var="endPage" value="${totalPageCount}" />
	</c:otherwise>
</c:choose>
<%-- 내가 12페이지라면 ◀ 를 누른 경우 [1][2]...[10] 으로 돌아가야 함
	해당 형태들을 출력하는 코드. 현재 페이지 블록이 1보다 크다 = 현재 페이지가 10 이상이다. 그렇다면 ◀ 가 출력되어야 함.
	 --%>
	<c:if test="${nowPageBlock gt 1}">
		<a href='<c:url value="/Board.do?page=${startPage-1}&action=list" />'>◀</a>
	</c:if>
	<%-- varStatus 속성에는 count, index, first, last 등의 속성 이용 가능
		count - 몇 번 반복했는지, 1부터 시작. index - count와 같지만 0부터 시작. first - 첫 번째 반복인 경우 true, 나머지 false
		last - 마지막 반복인 경우 true, 나머지 false.
		status.count는 1부터 시작해 하나씩 증가하며 반복 = 페이지 출력 가능.
		[1][2][3] 등의 페이지를 출력해주는 코드.
	 --%>
	<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
		[<a href='<c:url value="/Board.do?page=${status.count}&action=list" />'>${status.count}</a>]
	</c:forEach>
	<%-- 현재 페이지 블록이 토탈 페이지 블록보다 작다 - 현재 내가 5페이지인 상태라고 가정했을 때, 총 출력할 페이지가 19페이지라면 [1][2]...[10] ▶ 과 같은 형태를 출력해야 함
	▶ 을 누른다면 [11][12]....[19]의 형태로 바뀌어야 할 것. --%>
	<c:if test="${nowPageBlock lt totalPageBlock}">
		<a href='<c:url value="/Board.do?page=${endPage+1}&action=list"/>'>▶</a>
	</c:if>
</h6>
</td>
</tr>
</table>
<tr height="50">

</tr>
</body>
</html>