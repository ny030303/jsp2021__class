<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<% request.setCharacterEncoding("UTF-8"); %>
<%	int idx = Integer.parseInt(request.getParameter("idx"));%>
<%
	boolean result = dao.deleteLecturer(idx);
if(result) {
%>
<script>alert("삭제되었습니다.");location.href="lecturerList.jsp";</script>
<%
} else {
%>
<script>alert("삭제 실패");location.href="lecturerList.jsp";</script>
<%	
}
%>