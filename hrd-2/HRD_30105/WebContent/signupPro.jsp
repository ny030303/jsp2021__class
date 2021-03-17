<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="dao.BookDAO"/>
<jsp:useBean id="dto" class="dto.MemDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	dto.setJoindate(Date.valueOf(request.getParameter("textdate")));
	boolean res = dao.insertMem(dto);
	if(res) {
%>
	<script>alert("회원가입 성공"); location.href="index.jsp";</script>
<%		
	} else {
%>
	<script>alert("회원가입 실패"); location.href="index.jsp";</script>
<%		
	}
%>