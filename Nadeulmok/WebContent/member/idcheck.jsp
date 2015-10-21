<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="com.dao.MemberDAO"/>
<%
	String email=request.getParameter("email");
	int count = 0;
	if(email == null)
		email = "default";
	count = dao.idcheck(email);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	var count = $('#useremail').focus();
	var hasId = $('#hasId').val();
	var hasEmail = $('#hasEmail').val();
	
	if(hasEmail != "default" && hasId == 1){
		$('#emailSpan').text("사용중인 아이디입니다.");
	}else if(hasEmail != "default" && hasId == 0){
		$('#emailSpan').text("사용 가능한 아이디입니다.");
		$("#useremail").val(hasEmail);
		
	}else{
		$('#emailSpan').text("");
	}
	
	$('#btnSub').click(function(){
		var email=$('#useremail').val();
		if(email=="")
		{
			$('#emailSpan').text("이메일을 입력하세요");
			$('#useremail').focus();
			return;
		}
		$('#emailSpan').text("");
		
		if(!$.trim($("#useremail").val()).match(/^([a-zA-Z0-9-])+\@(([a-zA-Z0-9-])+\.)+(net|com)+$/)){

			  $('#emailSpan').text("아이디는 이메일형식으로 입력해주세요. 이메일아이디 영문만, 이메일도메인 .com, .net만 가능합니다.");
			  $("#useremail").val("").focus();
			  return;
		}
		$('#idCheck').submit();
	});
});

function ok(){
	var hasEmail = $('#hasEmail').val();
	parent.join_form.email.value=hasEmail;
	parent.Shadowbox.close();
};
</script>
<title>Insert title here</title>
<style type = "text/css">
#idBody{
	color: white;
}
#idDiv{
	margin-top: 20px;
}
</style>
</head>
<body id = "idBody">
	<center>
		<div id="idDiv">
		<form id="idCheck" name="id_check" action="../member/idcheck.jsp" method="post">
			Email 입력 : <input type=text name = email id = useremail size=12>
			<input type=button id= "btnSub" value="아이디 체크">
			<br>
    		<span style="text-align: center;color:red;" id="emailSpan"></span>
			<input type = hidden value="<%=count %>" id="hasId">
			<input type = hidden value="<%=email %>" id="hasEmail">
			<%
				if(email != "default" && count == 0)
				{
			%>
				<br><br>
				<input type=button id= "checkBtn" value="확인" onclick=ok()>
			<% 
				} 
			%>
    	</form>
		</div>
	</center>
</body>
</html>