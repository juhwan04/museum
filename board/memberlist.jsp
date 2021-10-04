<%@page import="java.io.IOException"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ElCeil" uri="/WEB-INF/tlds/el-function.tld"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css" media="screen">
<title>게시글 목록</title>
</head>
<body>
<tr height="50"><td>
</td></tr>
<!-- 본문 표시 코드 -->
<tr height="500" valign="top"><td>
<h1>내가 쓴 글 목록</h1>
<h3>내가 작성한 글(답글)입니다.</h3>
<table>
<!-- 보낸 리스트에서 글을 하나씩 꺼냄 -->
<c:forEach var="board" items="${lists}">
<tr>
<!-- 하나씩 꺼내서 이름, 제목, 작성일, 조회수 출력 -->
<td>${board.nickName}</td>
<!-- 제목은 클릭하는 경우 상세내용을 보여줘야 하기에 BoardServlet에 action을 view로 보내줌 
	doGet()에서 action이 view경우 실행.  -->
<td><a href='<c:url value="/Board.do?action=view&bbsno=${board.bbsno}&page=${page}"/>'>${board.subject}</a></td>
<td>${board.writeDate}</td>
<td>조회수 ${board.readCount}</td>
</tr>
</c:forEach>
<!-- 글 목록 출력 종료. -->
</table>
<!-- 페이지 처리를 위해 넘겨받은 페이지를 토대로 페이지 값들 계산 -->
<h6 align="center">	
<!-- list.jsp 설명을 참조하세요. -->
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
<c:if test="${nowPageBlock gt 1}">
<a href='<c:url value="/Board.do?page=${startPage-1}&action=memberList" />'>◀</a>
</c:if>
<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
[<a href='<c:url value="/Board.do?page=${status.count}&action=memberList" />'>${status.count}</a>]
</c:forEach>
<c:if test="${nowPageBlock lt totalPageBlock}">
<a href='<c:url value="/Board.do?page=${endPage+1}&action=memberList"/>'>▶</a>
</c:if>
</h6>
</td></tr>
<!-- 본문 표시 코드 -->
<tr height="50"><td>
</td></tr>
</body>
</html>