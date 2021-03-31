<%@page import="dto.CourseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<CourseDTO> arr = dao.getAllCourse();
	int num = dao.getSizeNum();
%>
<jsp:include page="header.jsp"/>
<div class="main">
<p>총 <%=num %>개의 교과목이 있습니다.</p>
<table border="1">
	<tr>
		<td>과목코드</td>
		<td>과목명</td>
		<td>학점</td>
		<td>담당강사</td>
		<td>요일</td>
		<td>시작시간</td>
		<td>종료시간</td>
		<td>관리</td>
	</tr>
	<% for(CourseDTO course : arr) { %>
		<tr>
			<td><%=course.getId() %></td>
			<td><%=course.getName() %></td>
			<td><%=course.getCredit() %></td>
			<td><%=course.getLecturer() %></td>
			<td>
				<% if(course.getWeek() == 1) {%>월<%}%>
				<% if(course.getWeek() == 2) {%>화<%}%>
				<% if(course.getWeek() == 3) {%>수<%}%>
				<% if(course.getWeek() == 4) {%>목<%}%>
				<% if(course.getWeek() == 5) {%>금<%}%>
				<% if(course.getWeek() == 6) {%>토<%}%>
			</td>
			<td><%=course.getStart_hour() %></td>
			<td><%=course.getEnd_end() %></td>
			<td>
				<a href="updateCourse.jsp?id=<%=course.getId() %>">수정</a> / <a href="deleteCourse.jsp?id=<%=course.getId() %>">삭제</a>
			</td>
		</tr>
	<%} %>
</table>
<button onclick="location.href='insertCourse.jsp'">작성</button>
</div>


<jsp:include page="footer.jsp"/>