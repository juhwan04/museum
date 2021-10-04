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
<table class="layout">
<tr height="50">

</tr>
<!-- 본문 표시 코드 -->
<tr height="500" valign="top">
<td>
<h3>게시판 목록입니다.</h3>
<table>
<c:forEach var="board" items="${lists}">
<tr>
<%-- 하나씩 추출한 글들의 이름, 제목(누르면 상세내용 조회), 작성일, 조회수를 출력 --%>
<td>${board.name}</td>
<%-- 조회하려면 서블릿을 거쳐 가야 하기에 서블릿의 주소로 조회한다는 요청표시(action=view), 글을 조회하는데 필요한 bbsno도 같이 넘겨줌. --%>
<td><a href='<c:url value="/Board.do?action=view&bbsno=${board.bbsno}"/>'>${board.subject}</a></td>
<td>${board.writeDate}</td>
<td>${board.readCount}</td>
</tr>
</c:forEach>
<tr>
<td colspan=4>
<h6 align=center>
	<c:set var="totalPageBlock" value="${ElCeil:ElCeil(totalPageCount/10.0)}"/>
	<c:set var="nowPageBlock" value="${ElCeil:ElCeil(page/10.0)}"/>
	<c:set var="startPage" value="${(nowPageBlock-1)*10+1}"/>
<c:choose>
	<c:when test="${totalPageCount gt nowPageBlock*10}">
	<c:set var="endPage" value="${nowPageBlock*10}"/>
	</c:when>
	<c:otherwise>
	<c:set var="endPage" value="${totalPageCount}"/>
	</c:otherwise>
</c:choose>
<c:if test="${nowPageBlock gt 1}">
	<a href='<c:url value="/Board.do?action=list&page=${startPage-1}"/>'>◀</a>
</c:if>
	<c:forEach begin="${startPage}" end="${endPage}" var="i">
	[<a href='<c:url value="/Board.do?action=list&page=${i}"/>'>'>${i}</a>]
	</c:forEach>
<c:if test="${nowPageBlock lt totalPageBlock}">
	<a href='<c:url value="/Board.do?action=list&page=${endPage+1}"/>'>▶</a>
</c:if>	
</h6>
</td></tr>
</table>
<tr height="50">
</tr>
</table>
</body>
</html>




