<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function login()
	{
		var f=document.frm;
		if(f.id.value=="")
		{
			f.id.focus();
			return;
		}
		
		if(f.pwd.value=="")
		{
			f.pwd.focus();
			return;
		}
		f.submit();
	}
</script>
</head>

<body>
	
	<center>
		<form method = post action=Login name=frm>
		<table border = 0 width = 200>
			<tr>
				<td width = 20% align = center>ID</td>
				<td width = 80% align = left>
				<input type = text name=id size=12>
				</td>
				<td rowsapn = 2>
					<input type=button value=Login onclick=login()>
				</td>
			</tr>
			
			<tr>
				<td width=20% align=center>PW</td>
				<td width=80% align=left>
				<input type=password name=pwd size=12>
				</td>
			</tr>
		</table>	
	</form>
</center>
</body>
</html>