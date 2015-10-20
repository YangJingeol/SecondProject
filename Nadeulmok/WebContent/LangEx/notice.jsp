<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.dao.*,java.text.*"%>
<jsp:useBean id="dao" class="com.dao.AdminDAO"/>
<%
	String strPage=request.getParameter("page");
	if(strPage==null)
		strPage="1";
	int curpage=Integer.parseInt(strPage);
	List<AdminDTO> list=dao.noticeListData(curpage);
	int totalpage=dao.noticeTotalPage();
	int count=dao.noticeRowCount();
	count=count-((curpage*10)-10);

	int block=5;
	int fromPage=((curpage-1)/block*block)+1;
	int toPage=((curpage-1)/block*block)+block;
	if(toPage>totalpage)
		toPage=totalpage;
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
		<table border=1 bordercolor="#c2c2be" width=1010 height=60>
			<tr align=center>
				<th width=10%>번호</th>
				<th width=60%>제목</th>
				<th width=15%>등록일</th>
				<th width=15%>조회수</th>
			</tr>
		</table>
		<table border=0 width=1010>
			<%
				for(AdminDTO d:list){
			%>
			<tr align=center height=45>
				<td width=10%><%=d.getNo() %></td>
				<td width=60%>
				<a href=n_content.jsp?no=<%=d.getNo() %>&page=<%=curpage%>><%=d.getTitle() %></a>
				</td>
				<td width=15%><%=d.getRegdate().toString() %></td>
				<td width=15%><%=d.getHit() %></td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
		<table border=1 bordercolor="#c2c2be" width=1010 height=50>
			<tr>
				<%
					if(curpage>block){
				%>
				<td align=center width=5%><a href="notice.jsp?page=1"><img src="image/prevEnd_icon.gif" border=0></a></td>
				<td align=center width=5%>
					<a href="notice.jsp?page=<%=curpage-1%>"><img src="image/prev_icon.gif" border=0></a>
				</td>
				<%
					}
					if(curpage<=block){
				%>
					<td align=center width=5%><a href="notice.jsp?page=1"><img src="image/prevEnd_icon.gif" border=0></a></td>
					<td align=center width=5%>
						<a href="notice.jsp?page=<%=curpage>1?curpage-1:curpage%>"><img src="image/prev_icon.gif" border=0></a>
					</td>
				<%
					}
				%>
				<td align=center width=60%>
				<%
					for(int i=fromPage;i<=toPage;i++){
						if(i==curpage){
				%>
							 <span style="color:black"><%=i %></span> |
				<%			
						}
						else{
				%>
							 <span style="color:#c2c2be"><a href="notice.jsp?page=<%=i%>"><%=i %></a></span> |
				<%
						}
					}
				%>	
				</td>
				<%
					if(toPage<totalpage){
				%>
					<td align=center width=5%><a href="notice.jsp?page=<%=toPage+1%>"><img src="image/next_icon.gif" border=0></a></td>
					<td align=center width=5%><a href="notice.jsp?page=<%=totalpage%>"><img src="image/nextEnd_icon.gif" border=0></a></td>
				<%		
					}
					if(toPage>=totalpage){
				%>
					<td align=center width=5%><a href="notice.jsp?page=<%=curpage<totalpage?curpage+1:curpage%>"><img src="image/next_icon.gif" border=0></a>
					<td align=center width=5%><a href="notice.jsp?page=<%=totalpage%>"><img src="image/nextEnd_icon.gif" border=0></a>
				<%		
					}
				%>
			</tr>
		</table>
		<br><br><br><br><br>
	</center>
</body>
</html>









