<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="dao.HrdDAO"/>

<%
	int custno = -1;

	custno = Integer.parseInt(request.getParameter("custno"));
	MemberDTO mem = dao.getAMember(custno);
%>
<jsp:include page="header.jsp"/>

<div id="updateMember" class="wrapper">
<h3>홈쇼핑 회원 등록</h3>
<form action="updateMember.jsp" method="post">
	<table border="1">
		<input type="hidden" name="custno" readonly="readonly" value="<%= mem.getCustno() %>">
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname" value="<%= mem.getCustname() %>"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" value="<%= mem.getPhone() %>" placeholder="010-3333-3333"></td>
		</tr>
		<tr>
			<td>통신사</td>
			<td>
				<input type="radio" name="address" value="SK" <%if (mem.getAddress().equals("SK")) { %> checked="checked" <%} %> >SK
				<input type="radio" name="address" value="KT"  <%if (mem.getAddress().equals("KT")) { %> checked="checked" <%} %>>KT
				<input type="radio" name="address" value="LG"  <%if (mem.getAddress().equals("LG")) { %> checked="checked" <%} %>>LG
			</td>
		</tr>
		<tr>
			<td>고객등급[A:VIP,B:일반,C:직원]</td>
			<td>
				<select name="grade">
					<option value="A" <%if (mem.getGrade().equals("A")) { %> selected="selected" <%} %>>VIP</option>
					<option value="B" <%if (mem.getGrade().equals("B")) { %> selected="selected" <%} %>>일반</option>
					<option value="C" <%if (mem.getGrade().equals("C")) { %> selected="selected" <%} %>>직원</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td>
				<input type="text" name="city" value="<%= mem.getCity() %>">
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="수정">
				<input type="button" onclick="location.href = 'selectMember.jsp'" value="조회">
			</td>
		</tr>
	</table>
</form>
</div>
<jsp:include page="footer.jsp"/>

<%
	if(request.getMethod().equals("POST")) {
		if(request.getParameter("custname").equals("")) {%> <script>alert("회원성명이 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("phone").equals("")) {%> <script>alert("회원전화가 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("address").equals("")) {%> <script>alert("통신사가 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("grade").equals("")) {%> <script>alert("고객등급이 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("city").equals("")) {%> <script>alert("도시코드가 입력되지 않았습니다."); </script><%}
		else {
			pageContext.forward("updateMemberPro.jsp");
		}
	}
%>