<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<jsp:useBean id="dto" class="dto.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%	
	boolean result = dao.updateMember(dto);
	if(result) {
	%>
		<script>alert("회원수정이 완료 되었습니다!"); location.href = 'index.jsp';</script>
	<%	
	} else {
		%>
		<script>alert("회원수정이 실패 했습니다."); location.href = 'index.jsp';</script>
	<%	
	}
%>
