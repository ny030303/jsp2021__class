<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<% 
ArrayList<MemberDTO> list = dao.getAllMember(); 

%>
<jsp:include page="header.jsp"/>

<div id="memlist" class="wrapper">
<h3>회원목록조회/수정</h3>
<table border="1">
	<thead>
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>전화번호</td>
			<td>통신사</td>
			<td>가입일자</td>
			<td>고객등급</td>
			<td>거주지역</td>
		</tr>
	</thead>
	<tbody>
		<% for(MemberDTO mem : list) { %>
		<tr>
			<td><a href="updateMember.jsp?custno=<%=mem.getCustno() %>"> <%=mem.getCustno() %></a></td>
			<td><%=mem.getCustname() %></td>
			<td><%=mem.getPhone() %></td>
			<td><%=mem.getAddress() %></td>
			<td><% String a = mem.getJoindate() + ""; %> <%=a.substring(0,4) %>년 <%=a.substring(5,7)%>월  <%=a.substring(8,10)%>일</td>
			<td>
				<%if(mem.getGrade().equals("A")) { %> VIP <%} %>
				<% if(mem.getGrade().equals("B")) { %> 일반 <%} %>
				<% if(mem.getGrade().equals("C")) { %> 직원 <%} %>
			</td>
			<td><%if(mem.getCity() == 01) { %> 서울 <%} %>
				<% if(mem.getCity() == 10) { %> 인천 <%} %>
				<% if(mem.getCity() == 20) { %> 성남 <%} %>
				<% if(mem.getCity() == 30) { %> 대전 <%} %>
				<% if(mem.getCity() == 40) { %> 광주 <%} %>
				<% if(mem.getCity() == 60) { %> 부산 <%} %>
			</td>
		</tr>
		<%} %>
	</tbody>
</table>
</div>
<jsp:include page="footer.jsp"/>