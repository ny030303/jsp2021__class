<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<jsp:useBean id="dao" class="DBPKG.HrdDAO"/>
<%
	ArrayList<MemberDTO> list = dao.getAllMember();
%>
<section id="mlist">
<h4>회원목록조회/수정</h4>
<table border="1">
<tbody>
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>전화번호</td>
		<td>통신사</td>
		<td>가입일자</td>
		<td>고객등급</td>
		<td>거주지역</td>
	</tr>
</tbody>
<% for(MemberDTO member : list) { %>
<tr>
	<td><a href="updateMember.jsp?custno=<%=member.getCustno()%>"><%= member.getCustno()%></a></td>
	<td><%= member.getCustname()%></td>
	<td><%= member.getPhone() %></td>
	<td><%= member.getAddress()%></td>
	<td><%= member.getJoindate()%></td>
	<td><% if(member.getGrade().equals("A")){%>VIP
	 <%}else if(member.getGrade().equals("B")){%>일반
	 <% }else if(member.getGrade().equals("C")){%>직원<% }%></td>
	<td>
		<% if(member.getCity().equals("01")){%>서울<%}
	 else if(member.getCity().equals("10")){%>인천<%}
	 else if(member.getCity().equals("20")){%>성남<%}
	 else if(member.getCity().equals("30")){%>대천<%}
	 else if(member.getCity().equals("40")){%>광주<%}
	 else if(member.getCity().equals("60")){%>부산<%} %>
	</td>
</tr>
<%} %>
</table>
</section>

<jsp:include page="footer.jsp"/>
