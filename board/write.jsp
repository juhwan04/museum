<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/default.css" media="screen">
<%-- 타이틀부터 글 입력, 수정, 댓글에 따라서 변경 --%>
<title>${message}</title>
<script type="text/javascript">
function Form(){
	if(!data.subject.value){
		alert("제목을 입력해주세요");
		data.subject.focus();
		return false;
	}
	else if(!data.password.value){
		alert("비밀번호를 입력해주세요");
		data.password.focus();
		return false;
	}
	else if(data.password.value.length<4){
		alert("비밀번호를 4글자 이상으로 설정해주세요");
		data.password.focus();
		return false;
	}
	else if(!data.content.value){
		alert("내용을 입력해주세요");
		data.content.focus();
		return false;
	}
}
</script>
</head>
<body>
<tr height="50"><td>
</td></tr>
<!-- 본문 표시 코드 -->
<tr height="500" valign="top"><td>
<%-- 글 입력인지, 수정인지, 댓글인지를 출력할 메세지 --%>
<h1>${message}</h1>
<h3 align=center>글 내용을 작성해주세요.</h3>
<form action='<c:url value="/Board.do"/>' method="post" name="data" onsubmit="return Form()">
<table>
<tr>
<%-- 글 제목, 비밀번호, 내용 같은 경우 수정 또는 댓글시에는 데이터가 입력된 상태로 나옴
	제목에는 댓글 입력시 [re]글자를 붙여서 출력 - 서블릿에서 처리
	비밀번호는 나오지 않음 - board.password는 지우셔도 됩니다.
 --%>
<td>제목</td>
<td><input type="text" name="subject" size="20" value="${board.subject}"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="password" value="${board.password}"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea cols="30" rows="5" name="content">${board.content}</textarea></td>
</tr>
<tr>
<%-- 히든으로 넘겨야할 파라미터들. 수정, 댓글 시에는 게시글 번호, masterid, replynumber 등등이 필요함
	때문에 전부 히든파라미터로 서블릿에서 넘겨받아 입력값으로 넘겨주고, action은 이 페이지가 입력을 할 것인지
	수정을 할 것인지 댓글을 할 것인지 구분하는용도 - 서블릿에서 작성해 넘겨줌
	게시글 쓰기 클릭 - 서블릿 doGet()(action=insert) - 글 작성 화면(write.jsp) - 서블릿 doPost()(입력처리)
	게시글 수정 클릭 - 서블릿 doGet()(action=update+글 정보 출력) - 글 수정 화면(write.jsp) - 서블릿 doPost()(수정처리)
	게시글 답글 클릭 - 서블릿 doGet()(action=reply+글 정보(답글처리)출력 - 답글 입력 화면(write.jsp) - 서블릿 doPost()(답글처리)의 형태
 --%>
<td colspan="2"><input type="hidden" name="action" value="${action}"> 
<input type="hidden" name="bbsno" value="${board.bbsno}"> 
<input type="hidden" name="masterid" value="${board.masterId}"> 
<input type="hidden" name="replynumber" value="${board.replyNumber}">
<input type="hidden" name="replystep" value="${board.replyStep}"> 
<input type="hidden" name="userid" value="${board.userId}">
<input type="submit" value="저 장"> <input type="reset" value="취 소"></td>
</tr>
</table>
</form>
</td></tr>
<!-- 본문 표시 코드 -->
<tr height="50"><td>
</td></tr>
</body>
</html>