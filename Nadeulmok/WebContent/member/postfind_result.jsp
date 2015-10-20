<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.dao.*"%>
<jsp:useBean id="dao" class="com.dao.ZipcodeDAO"/>
<%
    request.setCharacterEncoding("EUC-KR");
    String dong=request.getParameter("dong");
    int count=dao.postFindCount(dong);
    List<ZipcodeDTO> list=null;
    if(count!=0)
    	list=dao.postFindData(dong);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
td,th{
    font-family: 맑은 고딕;
    font-size: 9pt;
    color:white;
}
</style>
<script type="text/javascript">
function ok(zip,addr)
{
	parent.join_form.post.value=zip;
	parent.join_form.addr1.value=addr;
	parent.Shadowbox.close();
}
</script>
</head>
<body>
   <center>
     <%
        if(count==0)
        {
     %>
     <table border=0 width=400>
       <tr>
        <td align=center>검색한 결과가 없습니다</td>
       </tr>
     </table>
     <%
        }
        else
        {
     %>
            <table border=0 width=400>
              <tr bgcolor=#989898>
               <th width=20%>우편번호</th>
               <th width=80%>주소</th>
              </tr>
              <%
                 for(ZipcodeDTO d:list)
                 {
                	 String zip=d.getZipcode();
                	 String addr=d.getSido()+" "
                			   +d.getGugun()+" "
                			   +d.getDong()+" "
                			   +d.getBunji();
              %>
                     <tr>
                       <td width=20% align=center><%=zip %></td>
                       <td width=80% align=left><a href="javascript:ok('<%=zip %>','<%=addr%>')"><%=addr %></a></td>
                     </tr>
              <%
                 }
              %>
            </table>
     <%
        }
     %>
   </center>
</body>
</html>


