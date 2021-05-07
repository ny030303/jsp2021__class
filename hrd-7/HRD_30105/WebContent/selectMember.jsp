<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<MemberDTO> list = dao.getAllMember();

%>
<jsp:include page="header.jsp"/>
<section>
<h2>후보조회</h2>

<table border="1">
	<thead>
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>소속정당</td>
			<td>학력</td>
			<td>주민번호</td>
			<td>지역구</td>
			<td>대표전화</td>
		</tr>
	</thead>
	<tbody>
		<%for(MemberDTO dto : list) { %>
		<tr>
			<td><%=dto.getM_NO() %></td>
			<td><%=dto.getM_NAME() %></td>
			<td><%=dto.getP_NAME() %></td>
			<td>
				<% if(dto.getP_SCHOOL() == 1) {%> 고졸 <%} %>
				<% if(dto.getP_SCHOOL() == 2) {%> 학사 <%} %>
				<% if(dto.getP_SCHOOL() == 3) {%> 석사 <%} %>
				<% if(dto.getP_SCHOOL() == 4) {%> 박사 <%} %>
			</td>
			<td><%=dto.getM_JUMIN().substring(0,6) %>-<%=dto.getM_JUMIN().substring(6,13) %></td>
			<td><%=dto.getM_CITY() %></td>
			<td><%=dto.getP_TEL1() %>-<%=dto.getP_TEL2() %>-<%=dto.getP_TEL3() %></td>
		</tr>
		<%} %>
	</tbody>
</table>
</section>
<jsp:include page="footer.jsp"/>