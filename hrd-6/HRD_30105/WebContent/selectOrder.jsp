<%@page import="dto.GetOrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<GetOrderDTO> list = dao.getAllOrder();
%>
<jsp:include page="header.jsp"/>

<h3>주사접종 리스트</h3>
<table border="1">
	<thead>
		<tr>
			<td>접종받은 코드</td>
			<td>회원코드</td>
			<td>회원이름</td>
			<td>백신코드</td>
			<td>백신명</td>
			<td>접종날짜</td>
		</tr>
	</thead>
	<tbody>
		<% for(GetOrderDTO dto : list) { 
			String pdate = dto.getP_date() + "";
			String seno = dto.getP_seno() + "";
		%>
		<tr>
			<td><%=seno.substring(0,4)%>-<%=seno.substring(4,8)%></td>
			<td><%=dto.getP_no() %></td>
			<td><%=dto.getP_name() %></td>
			<td><%=dto.getI_code() %></td>
			<td><%=dto.getI_name() %></td>
			<td><%=dto.getP_date()%></td>
			
		</tr>
		<%} %>
	</tbody>
</table>

<jsp:include page="footer.jsp"/>