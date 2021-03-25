<%@page import="dto.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>

<%
	ArrayList<EmpDTO> empList = dao.getAllEmp();
%>

<jsp:include page="header.jsp"/>
	<div class="emp-list">
	<h2>회원목록 조회/수정</h2>
		<table border="1">
			<tr style="font-weight: bold;">
				<td>사원정보</td>
				<td>사원이름</td>
				<td>입사일자</td>
				<td>직급</td>
				<td>부서</td>
				<td>기능</td>
			</tr>
			<%for(EmpDTO emp: empList) {%>
			<tr>
				<td><%=emp.getEmpno() %></td>
				<td><%=emp.getEmpname() %></td>
				<td><%=emp.getJoindate() %></td>
				<td>
				<% if(emp.getRank().equals("A")) {%>사원 <%} %>
				<% if(emp.getRank().equals("B")) {%>대리 <%} %>
				<% if(emp.getRank().equals("C")) {%>과장 <%} %>
				</td>
				<td>
				<% if(emp.getDept().equals("A")) {%>디자인 <%} %>
				<% if(emp.getDept().equals("B")) {%>백엔드 <%} %>
				<% if(emp.getDept().equals("C")) {%>프론트<%} %>
				</td>
				<td><button onclick="location.href = 'updateEmp.jsp?empno=<%=emp.getEmpno()%>'">수정</button></td>
			</tr>
			<%} %>
		</table>
	</div>
<jsp:include page="footer.jsp"/>
