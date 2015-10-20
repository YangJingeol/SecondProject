<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
// $(function(){ $('#postPrint').html("<>")} )
window.onload=function()
{
	var div=document.getElementById("postPrint");
	div.innerHTML="<font color=white>동/읍/면을 입력하세요</font>";
}
</script>
<style type="text/css">
#postBody{
  color:white;
}
</style>
</head>
<body id="postBody">
  <center>
  <table border=0 width=400>
   <tr>
     <td align=center>
     <form method="post" action="postfind_result.jsp">
     입력:<input type=text name=dong size=15>
      <input type=submit value=검색>
     </form>
     </td>
   </tr>
  </table>
  <div id="postPrint"></div>
  </center>
</body>
</html>