<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.dao.*"%>
<jsp:useBean id="dao" class="com.dao.AdminDAO"/>
<%
	String strNo=request.getParameter("no");
	String strPage=request.getParameter("page");
	String strRn=request.getParameter("rn");
	if(strPage==null)
		strPage="1";
	int curpage=Integer.parseInt(strPage);
	AdminDTO d=dao.noticeContentData(Integer.parseInt(strNo));
	AdminDTO prev=dao.noticePrevTitle(Integer.parseInt(strNo));
	AdminDTO next=dao.noticeNextTitle(Integer.parseInt(strNo));
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
a{
	color:black;
	text-decoration:none;
}
</style>
</head>
<body>
	<center>
	<h3>공지사항</h3>
	<table width=1020>
			<tr>
				<td colspan=3><img src="image/menubar.png" border=0></td>
			</tr>
			<tr border=1 bordercolor=gray>
				
				<td width=75% align=left><b>&nbsp;&nbsp;&nbsp;&nbsp;<font size=5>공지사항</font></b>&nbsp;&nbsp;&nbsp;언어 나들목의 중요한 소식을 안내해 드립니다.</td>
				<td width=20%><input type="text"></td>
				<td width=5%><a href="notice.jsp"><img src="image/search.png" border=0></a></td>
			</tr>
		</table>
		<p>
		<table border=1 bordercolor="#c2c2be" width=1010 height=50>
			<tr align=center>
				<td width=60%><%=d.getTitle() %></td>
				<td width=15%>
				<img src="image/ptf.png">
				</td>
				<td width=10%>관리자</td>
				<td width=5%><%=d.getHit() %></td>
				<td width=10%><%=d.getRegdate() %></td>
			</tr>
			<br>
			<tr>
				<td colspan=5 height=800>
				<pre><%=d.getContent() %></pre></td>
			</tr>
		</table>
		<br>
		<table border=1 bordercolor="#c2c2be" width=1010 height=50>
			<tr>
			<%
				if(prev.getTitle()!=null||prev.getNo()!=0){
			%>
				<td width=5% height=30 align=center><a href="n_content.jsp?no=<%=prev.getNo() %>&page=<%=curpage%>"><img src="image/up_icon.png" border=0></a></td>
				<td width=95% height=30 align=left><a href="n_content.jsp?no=<%=prev.getNo() %>&page=<%=curpage%>">&nbsp;<%=prev.getTitle() %></a></td>
			<%
				}
				else{
			%>
				<td width=5% height=30 align=center><img src="image/up_icon.png" border=0></td>
				<td width=95% height=30 align=left>&nbsp;</td>
			<%
				}
			%>
			</tr>
			
			<tr>
			<%
				if(next.getTitle()!=null||next.getNo()!=0){
			%>
				<td width=5% height=30 align=center><a href="n_content.jsp?no=<%=next.getNo() %>&page=<%=curpage%>"><img src="image/down_icon.png" border=0></a></td>
				<td width=95% height=30 align=left><a href="n_content.jsp?no=<%=next.getNo() %>&page=<%=curpage%>">&nbsp;<%=next.getTitle() %></a></td>
			<%
				}
				else{
			%>
				<td width=5% height=30 align=center><img src="image/down_icon.png" border=0></td>
				<td width=95% height=30 align=left>&nbsp;</td>
			<%
				}
			%>
			</tr>
		</table>
		<br>
		<table border=0 width=1010>
			<tr align=center>
				<td><a href="notice.jsp?page=<%=strPage %>"><input type="button" value=&nbsp;목록&nbsp;></a></td>
			</tr>
		</table>
		<br><br><br><br><br>
	</center>
</body>
</html>









