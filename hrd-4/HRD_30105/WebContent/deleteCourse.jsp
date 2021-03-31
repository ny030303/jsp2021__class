<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<% request.setCharacterEncoding("UTF-8"); %>
<%	String id = request.getParameter("id");%>
<%
	boolean result = dao.deleteCourse(id);
if(result) {
%>
<script>alert("삭제되었습니다.");location.href="index.jsp";</script>
<%
} else {
%>
<script>alert("삭제 실패");location.href="index.jsp";</script>
<%	
}
%>