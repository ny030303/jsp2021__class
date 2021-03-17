<%@page import="dto.MemDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.BookDAO"/>
<jsp:include page="header.jsp"/>

<% ArrayList<MemDTO> arr = dao.getAllMem(); %>
<div class="memlist">
	<h2>회원목록 조회 / 수정</h2>
	<table>
		<thead>
			<tr>
				<td>회원번호</td>
				<td>회원이름</td>
				<td>가입일자</td>
				<td>고객등급</td>
				<td>주소</td>
				<td>기능</td>
			</tr>
		</thead>
		<tbody>
		<% for(MemDTO mem : arr) { %>
			<tr>
				<td><%= mem.getCustno()%></td>
				<td><%= mem.getCustname()%></td>
				<td><%= mem.getJoindate()%></td>
				<td><%if(mem.getGrade().equals("A")){%>VIP<%}
					else if(mem.getGrade().equals("B")){%>일반<%} 
				else if(mem.getGrade().equals("C")){%>직원<%} %></td>
				<td><%= mem.getAddress()%></td>
				<!-- <td><button ><a href="updateMem.jsp?custno=<%=mem.getCustno() %>">수정</a></button></td> -->
				<td><button onclick="location.href='updateMem.jsp?custno=<%=mem.getCustno()%>'">수정</button></td>
				
			</tr>
		<%} %>
		</tbody>
	</table>
</div>

<jsp:include page="footer.jsp"/>