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
<script type="text/javascript">
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
    <input type=password name="pwd" id="userpwd">
    <input type=password name="pwd" id="userpwd2" placeholder="���Է�">
    </p>
    <p>
    <label for="username">�̸�</label>
    <input type=text name="name" id="username">
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
    <input type=text name="age" id="userbday">
    </p>
    <p>
    <label for="usernation">����</label>
      <select id="usernation" name="nation">
	      <option>�ѱ�</option>
	      <option>�̱�</option>
	      <option>�߱�</option>
	      <option>����</option>
	      <option>�Ϻ�</option>
	    </select>
    </p>
    
    <p>
    <label for="usertel">��ȭ��ȣ</label>
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
     <input type=text id="userpost" readonly>
     <input type=button value="�����ȣ�˻�" id="userpostBtn" onclick="postfind()">
     <input type=text id="useraddr1" readonly>
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







