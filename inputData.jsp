<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면</title>
<link rel="stylesheet" type="text/css" href="css/inputData.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	background-image:url('img/b.jpg');
	background-size:cover;
}
</style>
<script type="text/javascript">
	function createForm(){
		if(!create.name.value){
			alert("이름을 입력해주세요.");
			create.name.focus();
			return false;
		}
		if(!create.nickname.value){
			alert("닉네임을 입력해주세요.");
			create.name.focus();
			return false;
		}
		if(create.nickname.value.length>6){
			alert("닉네임은 6글자 이하로 만들어주세요.");
			create.nickname.focus();
			return false;
		}
		if(!create.email.value){
			alert("이메일을 입력해주세요.");
			create.email.focus();
			return false;
		}
		if(create.email.value.length<3){
			alert("이메일은 3글자 이상으로 만들어주세요.");
			create.email.focus();
			return false;
		}
		if(create.email.value.length>15){
			alert("이메일은 15글자 이하로 만들어주세요.");
			create.email.focus();
			return false;
		}
		if(!create.pw.value){
			alert("비밀번호를 입력해주세요.");
			create.pw.focus();
			return false;
		}
		if(create.pw.value.length<8){
			alert("비밀번호는 8글자 이상으로 만들어주세요.");
			create.pw.focus();
			return false;
		}
		if(create.pw.value.length>15){
			alert("비밀번호는 25글자 이하로 만들어주세요.");
			create.pw.focus();
			return false;
		}
		if(!create.pwCheck.value){
			alert("비밀번호 확인란에 입력해주세요");
			create.pwCheck.focus();
			return false;
		}
		if(create.pw.value != create.pwCheck.value){
			alert("입력하신 비밀번호가 같지 않습니다.");
			create.pwCheck.focus();
			return false;
		}
		if(!create.phone.value){
			alert("전화번호를 입력해주세요.");
			create.phone.focus();
			return false;
		}
		if(!create.gender.value){
			alert("성별을 입력해주세요.");
			create.gender.focus();
			return false;
		}
		if(!create.age.value){
			alsert("나이를 입력해주세요");
			create.age.focus();
			return false;
		}
	}
	
</script>
</head>
<body>
<div class="form">
	<form action="/museum/Member.do?action=insert" name="create" method="post" onsubmit="return createForm()">
		이름 : <input type="text" name="name"><br>
		닉네임 : <input type="text" name="nickname"><br>
		이메일 : <input type="text" name="email">@
		<select name="emailType">
			<option value="naver">naver.com</option>
			<option value="google">google.com</option>
			<option value="gmail">gmail.com</option>
		</select><br>
		비밀번호 : <input type="password" name="pw"><br>
		비밀번호 확인 : <input type="password" name="pwCheck"><br>
		전화번호 : <input type="tel" name="phone" pattern="[0][1][0](\s|-|)[0-9]{4}(\s|-|)[0-9]{4}(\s|){5}"><br>
		성별 : <select name="gender">
				<option value="남자">남자</option>
				<option value="여자">여자</option>
			</select><br>
		나이 : <input type="number" name="age" min="1" max="100" step="1"><br>
		관심사 :<label for="1"><input type="checkbox" name="hobby" id="1"value="1">고대사</label> 
		<label for="2"><input type="checkbox" name="hobby" id="2"value="2">고려사</label>
		<label for="3"><input type="checkbox" name="hobby" id="3"value="3">조선사</label>
		<label for="4"><input type="checkbox" name="hobby" id="4"value="4">현대사</label>
		<label for="5"><input type="checkbox" name="hobby" id="5"value="5">근대사</label><br>
		생년월일 
		<select name="birthyy" class="birthyy">
			<option value="1995">1995</option>
			<option value="1996">1996</option>
			<option value="1997">1997</option>
			<option value="1989">1989</option>
			<option value="1990">1990</option>
			<option value="1991">1991</option>
			<option value="1992">1992</option>
			<option value="1993">1993</option>
			<option value="1994">1994</option>	
			<option value="1995">1995</option>
			<option value="1996">1996</option>
			<option value="1997">1997</option>
			<option value="1998">1998</option>
			<option value="1999">1999</option>
			<option value="2000">2000</option>
			<option value="2001">2001</option>
			<option value="2002">2002</option>
			<option value="2003">2003</option>
			<option value="2004">2004</option>
			<option value="2005">2005</option>
			<option value="2006">2006</option>
			<option value="2007">2007</option>
			<option value="2008">2008</option>
			<option value="2009">2009</option>
		</select>
		/
		<select name="birthmm" class="birthmm">
			<option value="01">01</option>
			<option value="02">02</option>
			<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
		</select>
		/
		<select name="birthdd" class="birthdd">
			<option value="01">01</option>
			<option value="02">02</option>
			<option value="03">03</option>
			<option value="04">04</option>
			<option value="05">05</option>
			<option value="06">06</option>
			<option value="07">07</option>
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
			<option value="25">25</option>
			<option value="26">26</option>
			<option value="27">27</option>
			<option value="28">05</option>
			<option value="29">29</option>
			<option value="30">30</option>
			<option value="31">31</option>
		</select><br>
		메일 수신 : <label for="01"><input type="radio" name="pick" id="01" value="동의" checked>동의</label>&nbsp;&nbsp;
		<label for="02"><input type="radio" name="pick" id="02" value="미동의">미동의</label><br>
		<input type="submit" value="가입">&nbsp;&nbsp;
		<input type="reset" value="취소">
	</form>
	</div>
</body>
</html>