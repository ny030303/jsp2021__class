<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.MoneyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="dao.HrdDAO"/>
<% 
ArrayList<MoneyDTO> list = dao.getAllMoney(); 
DecimalFormat fo = new DecimalFormat();
%>
<jsp:include page="header.jsp"/>

<div id="main" class="wrapper">
<h3>회원매출조회</h3>
<table border="1">
	<thead>
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>고객등급</td>
			<td>매출</td>
		</tr>
	</thead>
	<tbody>
		<% for(MoneyDTO mem : list) { %>
		<tr>
			<td><a href="updateMember.jsp?custno=<%=mem.getCustno() %>"> <%=mem.getCustno() %></a></td>
			<td><%=mem.getCustname() %></td>
			<td>
				<%if(mem.getGrade().equals("A")) { %> VIP <%} %>
				<% if(mem.getGrade().equals("B")) { %> 일반 <%} %>
				<% if(mem.getGrade().equals("C")) { %> 직원 <%} %>
			</td>
			<td><%=fo.format(mem.getPrice()) %></td>
		</tr>
		<%} %>
	</tbody>
</table>
</div>
<jsp:include page="footer.jsp"/>