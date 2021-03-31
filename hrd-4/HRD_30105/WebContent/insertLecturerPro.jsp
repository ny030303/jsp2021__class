<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<jsp:useBean id="dto" class="dto.LecturerDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	boolean result = dao.insertLecturer(dto);
if(result) {
%>
<script>alert("등록되었습니다.");location.href="lecturerList.jsp";</script>
<%
} else {
%>
<script>alert("등록 실패");location.href="lecturerList.jsp";</script>
<%	
}
%>