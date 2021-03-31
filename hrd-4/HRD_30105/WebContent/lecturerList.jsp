<%@page import="dto.LecturerDTO"%>
<%@page import="dto.CourseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<LecturerDTO> arr = dao.getLecturerNames();
%>
<jsp:include page="header.jsp"/>
<div class="main">
<table border="1">
	<tr>
		<td>번호</td>
		<td>강사명</td>
		<td>전공</td>
		<td>세부전공</td>
		<td>기능</td>
	</tr>
	<% for(LecturerDTO lecturer : arr) { %>
		<tr>
			<td><%=lecturer.getIdx() %></td>
			<td><%=lecturer.getName()%></td>
			<td><%=lecturer.getMajor() %></td>
			<td><%=lecturer.getField() %></td>
			<td>
				<a href="deleteLecturer.jsp?idx=<%=lecturer.getIdx() %>">삭제</a>
			</td>
		</tr>
	<%} %>
</table>
<button onclick="location.href='insertLecturer.jsp'">강사추가</button>
</div>


<jsp:include page="footer.jsp"/>