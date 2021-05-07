<%@page import="dto.VoteDTO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<VoteDTO> list = dao.getAllVote();

%>
<jsp:include page="header.jsp"/>
<section>
<h2>후보조회</h2>

<table border="1">
	<thead>
		<tr>
			<td>성명</td>
			<td>생년월일</td>
			<td>나이</td>
			<td>성별</td>
			<td>후보번호</td>
			<td>투표시간</td>
			<td>유권자확인</td>
		</tr>
	</thead>
	<tbody>
		<%for(VoteDTO dto : list) { 
			int year = Integer.parseInt(dto.getV_JUMIN().substring(0,2));
			if(year > 21) { // 03 > 21 => 1900 년도..
				year = year + 1900;
			} else {
				year = year + 2000;
			}
				
		%>
		<tr>
			<td><%=dto.getV_NAME() %></td>
			<td><%=year %>년<%=dto.getV_JUMIN().substring(2,4) %>월<%=dto.getV_JUMIN().substring(4,6) %>일</td>
			
			<td>만 <%=2021 - year -1 %>세</td>
			<td>
				<%if(dto.getV_JUMIN().substring(6,7).equals("1") || dto.getV_JUMIN().substring(6,7).equals("3")) { %>남<%} %>
				<%if(dto.getV_JUMIN().substring(6,7).equals("2") || dto.getV_JUMIN().substring(6,7).equals("4")) { %>여<%} %>
			</td>
			<td><%=dto.getM_NO() %></td>
			<td><%=dto.getV_TIME().substring(0,2) %>:<%=dto.getV_TIME().substring(2,4) %></td>
			<td><%if(dto.getV_CONFIRM().equals("Y")) {%>확인<% }%>
				<%if(dto.getV_CONFIRM().equals("N")) {%>미확인<% }%></td>
		</tr>
		<%} %>
	</tbody>
</table>
</section>
<jsp:include page="footer.jsp"/>