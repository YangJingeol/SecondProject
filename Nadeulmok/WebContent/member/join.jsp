<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="join.css"/>
<link rel="stylesheet" type="text/css" href="../css/shadowbox.css"/>
<script type="text/javascript" src="../js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
   players:["iframe"]		
});
function idcheck()
{
	Shadowbox.open({
		content:'idcheck.jsp',
		player:'iframe',
		title:'아이디 중복체크',
		width:300,
		height:150
	});
}
function postfind()
{
	Shadowbox.open({
		content:'postfind.jsp',
		player:'iframe',
		title:'우편번호 검색',
		width:430,
		height:350
	});
}
</script>
</head>
<body>
  <div id="wrapper">
 	<center><h3>회원 가입 창</h3></center>
    <form id="joinForm" name="join_form" action="join_ok.jsp">
    <p>
    <label for="userid">아이디(E-mail)</label>
    <input type=text name="email" id="userid" readonly>
    <input type=button value=중복체크 id="useridBtn" onclick="idcheck()">
    </p>
    <p>
    <label for="userpwd">비밀번호</label>
    <input type=password name="pwd" id="userpwd">
    <input type=password name="pwd" id="userpwd2" placeholder="재입력">
    </p>
    <p>
    <label for="username">이름</label>
    <input type=text name="name" id="username">
    </p>
    <p>
    <label for="usernickname">별명</label>
    <input type=text name="nickname" id="usernickname">
    </p>
    <p>
    <label for="usersex">성별</label>
    <input type=radio name="sex" id="usersex" checked value="남자">남자
    <input type=radio name="sex" id="usersex" value="여자">여자
    </p>
    <p>
    <label for="userbday">생년월일</label>
    <input type=text name="age" id="userbday">
    </p>
    <p>
    <label for="usernation">국적</label>
      <select id="usernation" name="nation">
	      <option>한국</option>
	      <option>미국</option>
	      <option>중국</option>
	      <option>독일</option>
	      <option>일본</option>
	    </select>
    </p>
    
    <p>
    <label for="usertel">전화번호</label>
    <span id="cellStyle">
	    <select id="usertel" name="tel">
	      <option>010</option>
	      <option>011</option>
	      <option>017</option>
	    </select>
	    <input type=text name="tel2" id="usertel1">-
	    <input type=text name="tel3" id="usertel2">
    </span>
    </p>
    
    <p>
    <label for="userlanguage">언어</label>
    <select id="userlanguage" name="lang">
	      <option>한국어</option>
	      <option>영어</option>
	      <option>중국어</option>
	      <option>독일어</option>
	      <option>일본어</option>
	    </select>
    </p>
    
    <p>
    <label for="userintro" id = introduce style="margin-top: 20px">자기소개</label>
    <span id="intoStyle">
    <textarea rows="8" cols="50" name=intro></textarea>
    </span>
    </p>
    
    <p>
    <label for="userpost">주소</label>
    <span id="cellStyle">
     <input type=text id="userpost" readonly>
     <input type=button value="우편번호검색" id="userpostBtn" onclick="postfind()">
     <input type=text id="useraddr1" readonly>
     <input type=text id="useraddr2">
    </span>
    </p>
     <p>
    <label for="usernickname">사진</label>
    <input type=text name="photo" id="usernickname">
    </p>
   
    <p class="btnSubmit">
    <input type=submit id="btnSub" value=회원가입>
    <input type=button id="btnCancel" value=가입취소>
    </p>
    </form>
  </div>
</body>
</html>







