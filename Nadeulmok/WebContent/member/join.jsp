<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
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
	 join_form.age.value=(year-ck)+1; // �츮���� ���� ǥ�� +1 ���� 
} 

Shadowbox.init({
   players:["iframe"]		
});
function idcheck()
{
	Shadowbox.open({
		content:'idcheck.jsp',
		player:'iframe',
		title:'���̵� �ߺ�üũ',
		width:300,
		height:150
	});
}
function postfind()
{
	Shadowbox.open({
		content:'postfind.jsp',
		player:'iframe',
		title:'�����ȣ �˻�',
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
	    $('font[name=pwdcheck]').html("��ȣ�� ��ġ���� �ʽ��ϴ�.");
	   }else{
	    $('font[name=pwdcheck]').text('');
	    $('font[name=pwdcheck]').html("��ȣ�� ��ġ�մϴ�.");
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
		 $('font[name=telcheck]').html("�߸��� ������ ��ȭ��ȣ�Դϴ�.");
	  }
	  else
	 {
	  	$('font[name=telcheck]').text('');
	 	$('font[name=telcheck1]').html("�ùٸ� �����Դϴ�.");
	  }
  }
</script>
</head>
<body>
  <div id="wrapper">
 	<center><h3>ȸ�� ���� â</h3></center>
    <form id="joinForm" name="join_form" action="join_ok.jsp">
    <p>
    <label for="userid">���̵�(E-mail)</label>
    <input type=text name="email" id="userid" readonly>
    <input type=button value=�ߺ�üũ id="useridBtn" onclick="idcheck()">
    </p>
    <p>
    <label for="userpwd">��й�ȣ</label>
    <input type=password name="pwd" id="pwd">
    <input type=password name="pwdCheck" id="pwdCheck" placeholder="���Է�">
    <font name = "pwdcheck" size="2" color="red"></font>
    </p>
    <p>
    <label for="username">�̸�</label>
    <input type=text name="name" id="username">
    <font name = "namecheck" size="2" color="red"></font>
    </p>
    <p>
    <label for="usernickname">����</label>
    <input type=text name="nickname" id="usernickname">
    </p>
    <p>
    <label for="usersex">����</label>
    <input type=radio name="sex" id="usersex" checked value="����">����
    <input type=radio name="sex" id="usersex" value="����">����
    </p>
    <p>
    <label for="userbday">�������</label>
     <input type=date name="age1" id="userbday" onblur="ck_age()">
    <input type="text" name="age" size=3 maxlength=3 readonly>��
    </p>
    <p>
    <label for="usernation">����</label>
      <select id="usernation" name="nation">
	      <option>�ѱ�</option>
	      <option>�̱�</option>
	      <option>�߱�</option>
	      <option>����</option>
	      <option>�Ϻ�</option>
	      <option>�븸</option>
	      <option>�ʸ���</option>
	      <option>����</option>
	      <option>������</option>
	      <option>��Ż����</option>
	    </select>
    </p>
    
    <p>
    <label for="usertel">��ȭ��ȣ</label>
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
    <label for="userlanguage">���</label>
    <select id="userlanguage" name="lang">
	      <option>�ѱ���</option>
	      <option>����</option>
	      <option>�߱���</option>
	      <option>���Ͼ�</option>
	      <option>�Ϻ���</option>
	    </select>
    </p>
    
    <p>
    <label for="userintro" id = introduce style="margin-top: 20px">�ڱ�Ұ�</label>
    <span id="intoStyle">
    <textarea rows="8" cols="50" name=intro></textarea>
    </span>
    </p>
    
    <p>
    <label for="userpost">�ּ�</label>
    <span id="cellStyle">
     <input type=text name=post id="userpost" readonly>
     <input type=button value="�����ȣ�˻�" id="userpostBtn" onclick="postfind()">
     <input type=text name=addr1 id="useraddr1" readonly>
     <input type=text id="useraddr2">
    </span>
    </p>
     <p>
    <label for="usernickname">����</label>
    <input type=text name="photo" id="usernickname">
    </p>
   
    <p class="btnSubmit">
    <input type=submit id="btnSub" value=ȸ������>
    <input type=button id="btnCancel" value=�������>
    </p>
    </form>
  </div>
</body>
</html>


