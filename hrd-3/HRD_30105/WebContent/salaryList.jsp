<%@page import="dto.SalaryDTO"%>
<%@page import="dto.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>

<%
	ArrayList<SalaryDTO> salaryList = dao.getAllSalaryList();
%>

<jsp:include page="header.jsp"/>
	<div class="salary-list">
	<h2>사원별 급여현황</h2>
		<table border="1">
			<tr style="font-weight: bold;">
				<td>회원번호</td>
				<td>회원이름</td>
				<td>총급여</td>
			</tr>
			<%for(SalaryDTO salary: salaryList) {%>
			<tr>
				<td><%=salary.getEmpno() %></td>
				<td><%=salary.getEmpname() %></td>
				<td><%=salary.getPay() %></td>
				
			</tr>
			<%} %>
		</table>
	</div>
<jsp:include page="footer.jsp"/>
