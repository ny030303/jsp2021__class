<%@page import="dto.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<PersonDTO> arr = new ArrayList<>();
	if(request.getParameter("selectRadio").equals("id")) {
		int id = Integer.parseInt(request.getParameter("id"));
		arr = dao.getIdPersons(id);
	} else {
		String dept = request.getParameter("dept");
		arr = dao.getDeptPersons(dept);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회결과</title>
<style type="text/css">
button {
	width: 120px;
	padding: 10px;
	margin: 5px;
}
</style>
</head>
<body>
<h2>직원 정보 조회 결과</h2>
<hr>
<table border="1">
	<tr>
		<td>성명</td>
		<td>사번</td>
		<td>직급</td>
		<td>직책</td>
		<td>연락처</td>
		<td>소속부서</td>
	</tr>
	<% for (PersonDTO p : arr) {%>
	<tr>
		<td><%=p.getName() %></td>
		<td><%=p.getId() %></td>
		<td><%=p.getPosition() %></td>
		<td><%=p.getDuty() %></td>
		<td><%=p.getPhone() %></td>
		<td><%=p.getDept() %></td>
	</tr>
	<%} %>
</table>
<button onclick="location.href='personListForm.jsp'">확인</button>
</body>
</html>