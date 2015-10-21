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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

function ck_age() 
{ 
	 var year=parseInt(new Date().getFullYear()); 
	 var age=document.getElementsByName('age1'); 
	 var ck=parseInt(age[0].value.substr(0,4)); 
	 join_form.age.value=(year-ck)+1; // 우리나라 나이 표시 +1 더함 
} 

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

$(function(){
	  $('#pwd').keyup(function(){
	   $('font[name=check]').text('');
	  }); //#user_pass.keyup

	  $('#pwdCheck').keyup(function(){
	   if($('#pwd').val()!=$('#pwdCheck').val()){
	    $('font[name=pwdcheck]').text('');
	    $('font[name=pwdcheck]').html("암호가 일치하지 않습니다.");
	   }else{
	    $('font[name=pwdcheck]').text('');
	    $('font[name=pwdcheck]').html("암호가 일치합니다.");
	   }
	 }); 
});

  function phoneCheck(obj) {
    var n = obj.value.replace(/\-/g, "");
    var len = n.length;
    var number=n;
   
    if(len > 3){
      number=n.substring(0, 3)+"-";
      if(len > 3 && len < 7){
        number+=n.substring(3);
      }else if(len > 6 && len < 11){
        number+=n.substring(3, 6)+"-"+n.substring(6);
      }else if(len == 11){
        number+=n.substring(3, 7)+"-"+n.substring(7);
      }
    }
    obj.value = number;
  }
  
  function ck_phone()
  {
	  var inputtedPhoneNumber = $("#tel").val();
	  var phoneNumberRegex = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
	  if(!phoneNumberRegex.test(inputtedPhoneNumber)) {
	  	 $('font[name=telcheck1]').text('');
		 $('font[name=telcheck]').html("잘못된 형식의 전화번호입니다.");
	  }
	  else
	 {
	  	$('font[name=telcheck]').text('');
	 	$('font[name=telcheck1]').html("올바른 형식입니다.");
	  }
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
    <input type=password name="pwd" id="pwd">
    <input type=password name="pwdCheck" id="pwdCheck" placeholder="재입력">
    <font name = "pwdcheck" size="2" color="red"></font>
    </p>
    <p>
    <label for="username">이름</label>
    <input type=text name="name" id="username">
    <font name = "namecheck" size="2" color="red"></font>
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
     <input type=date name="age1" id="userbday" onblur="ck_age()">
    <input type="text" name="age" size=3 maxlength=3 readonly>세
    </p>
    <p>
    <label for="usernation">국적</label>
      <select id="usernation" name="nation">
	      <option>한국</option>
	      <option>미국</option>
	      <option>중국</option>
	      <option>독일</option>
	      <option>일본</option>
	      <option>대만</option>
	      <option>필리핀</option>
	      <option>영국</option>
	      <option>프랑스</option>
	      <option>이탈리아</option>
	    </select>
    </p>
    
    <p>
    <label for="usertel">전화번호</label>
    <!-- <span id="cellStyle">
	    <select id="usertel" name="tel">
	      <option>010</option>
	      <option>011</option>
	      <option>017</option>
	    </select>
	    <input type=text name="tel2" id="usertel1">-
	    <input type=text name="tel3" id="usertel2">
    </span> -->
    <input type=text name="tel" id="tel" onkeyup="phoneCheck(this)" maxlength="13" onblur=ck_phone()>
    <font name="telcheck" size="2" color="red"></font>
    <font name="telcheck1" size="2" color="blue"></font>
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
     <input type=text name=post id="userpost" readonly>
     <input type=button value="우편번호검색" id="userpostBtn" onclick="postfind()">
     <input type=text name=addr1 id="useraddr1" readonly>
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


