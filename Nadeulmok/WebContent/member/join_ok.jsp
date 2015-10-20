<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.dao.*"%>

<jsp:useBean id="dao" class="com.dao.MemberDAO"/>
<jsp:useBean id="d" class="com.dao.MemberDTO"/>
<jsp:setProperty name="d" property="*"/>
<jsp:getProperty name="d" property="name"/>
<% 
    dao.memberJoin(d);
	response.sendRedirect("login.jsp");
%>