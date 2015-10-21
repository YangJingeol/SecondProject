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

$(function(){
	$('#btnSub').click(function(){
		var email=$('#useremail').val();
		if(email=="")
		{
			$('#emailnull').text("�̸����� �Է��ϼ���");
			return;
		}
		$('#emailnull').text("");
		
		var pwd=$('#userpwd').val();
		if(pwd=="")
		{
			$('#pwdnull').text("��й�ȣ�� �Է��ϼ���");
			$('#userpwd').focus();
			return;
		}
		$('#userpwd').text("");
		
		
		var name=$('#username').val();
		if(name=="")
		{
			$('#namenull').text("�̸��� �Է��ϼ���");
			$('#username').focus();
			return;
		}
		$('#username').text("");

		var nickname=$('#usernickname').val();
		if(nickname=="")
		{
			$('#nicknamenull').text("������ �Է��ϼ���");
			$('#usernickname').focus();
			return;
		}
		$('#usernickname').text("");
		
		var age=$('#userage').val();
		if(age=="")
		{
			$('#agenull').text("���̸� �Է��ϼ���");
			$('#userage').focus();
			return;
		}
		
		var tel=$('#usertel').val();
		if(tel=="")
		{
			$('#telnull').text("��ȭ��ȣ�� �Է��ϼ���");
			$('#usertel').focus();
			return;
		}
		$('#usertel').text("");
		
		var intro=$('#userintro').val();
		if(intro=="")
		{
			$('#intronull').text("�Ұ��� �Է��ϼ���");
			$('#userintro').focus();
			return;
		}
		$('#userintro').text("");
		
		var photo=$('#userphoto').val();
		if(photo=="")
		{
			$('#photonull').text("������ �Է��ϼ���");
			$('#userphoto').focus();
			return;
		}
		$('#userphoto').text("");
		
		$('#joinForm').submit();
	});
});

$(function(){
	$('#useremail').keyup(function(){
		  $('#emailnull').text("");
	}); 
	$('#usertel').keyup(function(){
		  $('#telnull').text("");
	}); 
	
	$('#userintro').keyup(function(){
		  $('#intronull').text("");
	});
	
	$('#userphoto').keyup(function(){
		  $('#photonull').text("");
	});
	$('#usernickname').keyup(function(){
		  $('#nicknamenull').text("");
	}); 
	
	$('#username').keyup(function(){
		  $('#namenull').text("");
	}); 
	
	$('#userbday').text("");
	$('#userbday').keyup(function(){
		  $('#agenull').text("");
	}); 
});


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
	  $('#userpwd').keyup(function(){
		  $('#pwdnull').text("");
	   $('font[name=pwdcheck]').text('');
	  }); //#user_pass.keyup

	  $('#userpwdcheck').keyup(function(){
	   if($('#userpwd').val()!=$('#userpwdcheck').val()){
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
	  var inputtedPhoneNumber = $("#usertel").val();
	  var phoneNumberRegex = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
	  if(!phoneNumberRegex.test(inputtedPhoneNumber)) {
	  	 $('font[name=telcheck1]').text('');
		 $('font[name=telcheck]').html("�߸��� ������ ��ȭ��ȣ�Դϴ�.");
		 $("#usertel").val("").focus();
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
	    <input type=text name="email" id="useremail" readonly>
	    <input type=button value=�ߺ�üũ id="useridBtn" onclick="idcheck()">
	    <span style="text-align: center; color:red;" id="emailnull"></span>
    </p>
    
    <p>
	    <label for="userpwd">��й�ȣ</label>
	    <input type=password name="pwd" id="userpwd">
	    <input type=password name="pwdcheck" id="userpwdcheck" placeholder="���Է�">
	    <font name = "pwdcheck" size="2" color="red"></font>
	    <span style="text-align: center; color:red;" id="pwdnull"></span>
    </p>
    
    <p>
	    <label for="username">�̸�</label>
	    <input type=text name="name" id="username">
	    <span style="text-align: center; color:red;" id="namenull"></span>
	</p>
   
    <p>
	    <label for="usernickname">����</label>
	    <input type=text name="nickname" id="usernickname">
	    <span style="text-align: center; color:red;" id="nicknamenull"></span>
    </p>
   
    <p>
	    <label for="usersex">����</label>
	    <input type=radio name="sex" id="usersex" checked value="����">����
	    <input type=radio name="sex" id="usersex" value="����">����
    </p>
  
    <p>
	    <label for="userbday">�������</label>
	    <input type=date name="age1" id="userbday" onblur="ck_age()">
	    <input type="text" name="age" id="userage" size=3 maxlength=3 readonly>��
	    <span style="text-align: center; color:red;" id="agenull"></span>
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
    <input type=text name="tel" id="usertel" onkeyup="phoneCheck(this)" maxlength="13" onblur=ck_phone()>
    <font name="telcheck" size="2" color="red"></font>
    <font name="telcheck1" size="2" color="blue"></font>
    <span style="text-align: center; color:red;" id="telnull"></span>
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
    <label for="userintro" style="margin-top: 20px">�ڱ�Ұ�</label>
    <span id="intoStyle">
    <textarea rows="8" cols="50" id= userintro name=intro></textarea>
    </span>
    <br>
    <span style="text-align: center; color:red;" id="intronull"></span>
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
   		 <input type=text name="photo" id="userphoto">
    	 <span style="text-align: center; color:red;" id="photonull"></span>
    </p>
   
    <p class="btnSubmit">
	    <input type=button id="btnSub" value=ȸ������>
	    <input type=button id="btnCancel" value=�������>
    </p>
    </form>
  </div>
</body>
</html>

