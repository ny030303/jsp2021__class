<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="dao" class="dao.HrdDAO"/>
 <jsp:useBean id="dto" class="dto.EmpDTO"/>
 <jsp:setProperty property="*" name="dto"/>
<%
	boolean res = dao.insertEmp(dto);
	if(res) {
	%><script>alert("등록 완료"); location.href = "index.jsp";</script><%
	} else {
		%><script>alert("등록 실패"); location.href = "index.jsp";</script><%
	}
%>