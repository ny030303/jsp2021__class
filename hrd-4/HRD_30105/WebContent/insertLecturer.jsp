<%@page import="javax.naming.Context"%>
<%@page import="dto.LecturerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%

%>
<jsp:include page="header.jsp"/>
	<div class="insert">
	<h2>강사 추가</h2>
		<form action="insertLecturer.jsp" method="post">
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="idx"></td>
				</tr>
				<tr>
					<td>강사명</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>전공</td>
					<td><input type="text" name="major"></td>
				</tr>
				<tr>
					<td>세부전공</td>
					<td><input type="text" name="field"></td>
				</tr>
			</table>
			<input type="submit" value="완료">
		</form>
		<button onclick="location.href='lecturerList.jsp'">목록</button>
	</div>
<jsp:include page="footer.jsp"/>

<%
	if(request.getMethod().equals("POST")) {
		System.out.println("post in");
		if(request.getParameter("idx").equals("")) { %> <script>alert("번호는 비울 수 없습니다.")</script> <%}
		else if(request.getParameter("name").equals("")) { %> <script>alert("강사명은 비울 수 없습니다.")</script> <%}
		else if(request.getParameter("major").equals("")) { %> <script>alert("전공은 비울 수 없습니다.")</script> <%}
		else if(request.getParameter("field").equals("")) { %> <script>alert("세부전공은 비울 수 없습니다.")</script> <%}
		else {
			pageContext.forward("insertLecturerPro.jsp");
		}
	}
%>