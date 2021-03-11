<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.MoneyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<jsp:useBean id="dao" class="DBPKG.HrdDAO"/>
<%
	ArrayList<MoneyDTO> list = dao.getAllMoney();

DecimalFormat d = new DecimalFormat("###,###");
%>
<section id="moneyList">
<h4>회원매출조회</h4>
<table border="1">
<tbody>
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>고객등급</td>
		<td>매출</td>
	</tr>
</tbody>
<% for(MoneyDTO money : list) { %>
<tr>
	<td><%= money.getCustno()%></td>
	<td><%= money.getCustname()%></td>
	<td><% if(money.getGrade().equals("A")){%>VIP
	 <%}else if(money.getGrade().equals("B")){%>일반
	 <% }else if(money.getGrade().equals("C")){%>직원<% }%></td>
	<td>
		<%=d.format(money.getPrice() )%>
	</td>
</tr>
<%} %>
</table>
</section>

<jsp:include page="footer.jsp"/>
