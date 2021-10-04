<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css" media="screen">
<title>글 상세 내용 화면</title>
</head>
<body>
<tr height="50"><td>
</td></tr>
<!-- 본문 표시 코드 -->
<tr height="500" valign="top"><td>
<h1>상세 내용</h1>
<table>
<tr>
<%-- td는 칸, th는 라벨 같은 태그 - 색깔 지정 가능 --%>
<%-- 라벨 : 데이터
	  라벨 : 데이터 형태로 글 상세내용 출력
 --%>
<th>작성자 이름</th>
<td>${board.name}</td>
</tr>
<tr>
<th>제목</th>
<td>${board.subject}</td>
</tr>
<tr>
<th>내용</th> 
<td>${board.content}</td>
</tr>
<%-- 댓글, 수정, 삭제 등의 기능을 실행할 수 있는 링크.
	  댓글은 어떤 글에 댓글을 다는지 알아야 하기 때문에 게시글 번호가,
	  수정은 어떤 글을 수정할 건지와 함께 수정 하려는 사람이 누구인지 알아야 하기 때문에 게시글 번호+userid,
	  삭제도 수정과 마찬가지로 누가 어떤 글을 삭제하려는지 알아야 하기 때문에 게시글 번호+userid+replynumber 까지 넘겨 받아야 한다.
	 A라는 사람이 B가 쓴 글을 수정 또는 삭제하지 못하게 해야 하기 때문에 필요한 값들.
	  각 요청 파라미터와 함께 전부 BoardServlet으로 넘겨주면 서블릿에서 각 작업 처리.
 --%>
<tr>
<td colspan=2><h3 align=center><a href='<c:url value="/Board.do?action=list"/>'>목록</a>
<a href='<c:url value="/Board.do?action=reply&bbsno=${board.bbsno}"/>'>댓글</a>
<a href='<c:url value="/Board.do?action=update&bbsno=${board.bbsno}&userid=${board.userId}"/>'>수정</a>
<a href='<c:url value="/Board.do?action=delete&bbsno=${board.bbsno}&
replynumber=${board.replyNumber}&userid=${board.userId}"/>'>삭제</a></h3>
</td>
</tr>
</table>
</td></tr>
<tr height="50"><td>
</td></tr>
</body>
</html>