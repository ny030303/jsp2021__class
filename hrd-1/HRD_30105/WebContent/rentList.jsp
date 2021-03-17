<%@page import="dto.MemRentDTO"%>
<%@page import="dto.MemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.BookDAO"/>
<jsp:include page="header.jsp"/>

<% ArrayList<MemRentDTO> arr = dao.getAllMemberRent(); %>
<div class="rentlist">
	<h2>회원별 대여현황</h2>
	<table>
		<thead>
			<tr>
				<td>회원번호</td>
				<td>회원이름</td>
				<td>대여횟수</td>
			</tr>
		</thead>
		<tbody>
		<%for(MemRentDTO mr : arr) {%>
			<tr>
				<td><%=mr.getCustno() %></td>
				<td><%=mr.getCustname() %></td>
				<td><%=mr.getCountNum() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	
	<h2>도서별 대여 현황</h2>
	<table>
		<thead>
			<tr>
				<td>도서번호</td>
				<td>대여횟수</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>도서번호</td>
				<td>대여횟수</td>
			</tr>
		</tbody>
	</table>
</div>



<jsp:include page="footer.jsp"/>