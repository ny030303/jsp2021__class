<%@page import="dto.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<PersonDTO> deptArr = dao.getAllPerson();
%>
<jsp:include page="header.jsp"/>

<p>인사관리 조회</p>
<form action="personListForm.jsp" method="post">
	<input type="radio" name="selectRadio" value="id" checked="checked"> 사원번호로 조회 <input type="text" name="id"><br><br>
	<input type="radio" name="selectRadio" value="dept"> 부서명으로 조회 <select name="dept">
		<% for(PersonDTO person : deptArr) { %>
		<option value="<%=person.getDept()%>"><%=person.getDept() %></option>
		<%} %>
	</select>
	<br><br>
	<input type="submit" value="조회" class="formSubmit"> 
</form>	
<button onclick="location.href='main.jsp'">취소</button>
<jsp:include page="footer.jsp"/>

<%
	if(request.getMethod().equals("POST")) {
		if(request.getParameter("selectRadio").equals("id")) {
			String id = request.getParameter("id");
			if(id.equals("")) { %> <script>alert("사원 번호가 비었습니다.")</script> <% }
			else {
				
			}
		} else {
			String dept = request.getParameter("dept");
			if(dept.equals("")) { %> <script>alert("부서명이 비었습니다.")</script> <% }
			else {
				
			}
		}
	}
%>