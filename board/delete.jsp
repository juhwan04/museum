<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css" media="screen">
<script>
	function Form(){
		if(!data.password.value){
			alert("비밀번호를 입력해주세요");
		}
	}
</script>
<title>글 삭제 화면</title>
</head>
<body>
<tr height="50">
</tr>
<tr height="500" valign="top">
<td>
<h1>글 삭제 화면</h1>
<h3>글 삭제 비밀번호 입력</h3>
<!-- 글 삭제는 서블릿의 post에서 -->
<form action='<c:url value="/Board.do"/>' method="post" name="data" onsubmit="return Form()">
<!-- 서블릿에서 보낸 값들을 그대로 hidden으로 받아두었다가 post에 다시 보내줌 -->
<input type="hidden" name="action" value="${action}"> 
<input type="hidden" name="bbsno" value="${bbsno}"> 
<input type="hidden" name="replynumber" value="${replynumber}">
<!-- 사용자는 비밀번호만 입력. --> 
<input type="password" name="password"> 
<input type="submit" value="삭 제">
</form>
</td>
</tr>
<tr height="50">
</tr>
</body>
</html>