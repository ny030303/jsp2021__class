<%@page import="dto.PersonDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dao" class="dao.HrdDAO"/>
<jsp:useBean id="dto" class="dto.PersonDTO"/>
<jsp:setProperty property="*" name="dto"/>


<%
	boolean result = dao.updatePerson(dto);
	if(result) {%> <script>alert("변경 완료"); location.href="main.jsp";</script>  <%}
	else {%> <script>alert("변경 실패"); location.href="main.jsp";</script>  <%}
%>