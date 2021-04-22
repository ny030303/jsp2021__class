<%@page import="dto.CustDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<CustDTO> list = dao.getAllCust();
%>
<jsp:include page="header.jsp"/>

<h3>회원 목록 리스트</h3>
<table border="1">
	<thead>
		<tr>
			<td>회원코드</td>
			<td>회원이름</td>
			<td>생년월일</td>
			<td>전화전호</td>
			<td>성별</td>
			<td>도시코드</td>
		</tr>
	</thead>
	<tbody>
		<% for(CustDTO dto : list) { 
			String birth = dto.getP_birth() + "";
		%>
		<tr>
			<td><%=dto.getP_no() %></td>
			<td><%=dto.getP_name() %></td>
			<td><%=birth.substring(0,4)%>년 <%=birth.substring(4,6)%>일 <%=birth.substring(6,8)%>일</td>
			<td>0<%=dto.getP_tel1() %>-<%=dto.getP_tel2() %>-<%=dto.getP_tel3() %></td>
			<td>
				<% if(dto.getP_gender().equals("F")) {%> 여 <%} %>
				<% if(dto.getP_gender().equals("M")) {%> 남 <%} %>
			</td>
			<td>
				<% if(dto.getP_city() == 10) {%>서울<%} %>
				<% if(dto.getP_city() == 20) {%>경기<%} %>
				<% if(dto.getP_city() == 30) {%>부산<%} %>
				<% if(dto.getP_city() == 40) {%>대구<%} %>
			</td>
		</tr>
		<%} %>
	</tbody>
</table>

<jsp:include page="footer.jsp"/>