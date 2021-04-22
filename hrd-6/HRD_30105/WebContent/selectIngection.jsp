<%@page import="dto.IngectionDTO"%>
<%@page import="dto.GetOrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<IngectionDTO> list = dao.getAllIngection();
%>
<jsp:include page="header.jsp"/>

<h3>백신별접종 리스트</h3>
<table border="1">
	<thead>
		<tr>
			<td>백신코드</td>
			<td>백신명</td>
			<td>접종 수</td>
		</tr>
	</thead>
	<tbody>
		<% for(IngectionDTO dto : list) { %>
		<tr>
			<td><%=dto.getI_code() %></td>
			<td><%=dto.getI_name() %></td>
			<td><%=dto.getNum()%></td>
			
		</tr>
		<%} %>
	</tbody>
</table>

<jsp:include page="footer.jsp"/>