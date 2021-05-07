<%@page import="dto.MemberVoteDTO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<MemberVoteDTO> list = dao.getAllMemberVote();

%>
<jsp:include page="header.jsp"/>
<section>
<h2>후보조회</h2>

<table border="1">
	<thead>
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>총투표건수</td>
		</tr>
	</thead>
	<tbody>
		<%for(MemberVoteDTO dto : list) { %>
		<tr>
			<td><%=dto.getM_NO() %></td>
			<td><%=dto.getM_NAME() %></td>
			<td><%=dto.getM_NO_NUM() %></td>
		</tr>
		<%} %>
	</tbody>
</table>
</section>
<jsp:include page="footer.jsp"/>