<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="dao.HrdDAO"/>

<%
	int newCustno = dao.getMaxCustno() + 1;
%>
<jsp:include page="header.jsp"/>

<div id="insertMember" class="wrapper">
<h3>홈쇼핑 회원 등록</h3>
<form action="insertMember.jsp" method="post">
	<table border="1">
		<tr>
			<td>회원번호(자동발생)</td>
			<td><input type="text" name="custno" readonly="readonly" value="<%= newCustno %>"></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname" value=""></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone" value="" placeholder="010-3333-3333"></td>
		</tr>
		<tr>
			<td>통신사</td>
			<td>
				<input type="radio" name="address" value="SK" checked="checked">SK
				<input type="radio" name="address" value="KT">KT
				<input type="radio" name="address" value="LG">LG
			</td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="textjoindate"  value="" placeholder="2010-03-03"></td>
		</tr>
		<tr>
			<td>고객등급[A:VIP,B:일반,C:직원]</td>
			<td>
				<select name="grade">
					<option value="A">VIP</option>
					<option value="B">일반</option>
					<option value="C">직원</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td>
				<input type="text" name="city" value="">
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="등록">
				<input type="button" onclick="location.href = 'selectMember.jsp'" value="조회">
			</td>
		</tr>
	</table>
</form>
</div>
<jsp:include page="footer.jsp"/>

<%
	if(request.getMethod().equals("POST")) {
		if(request.getParameter("custno").equals("")) {%> <script>alert("회원번호가 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("custname").equals("")) {%> <script>alert("회원성명이 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("phone").equals("")) {%> <script>alert("회원전화가 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("address").equals("")) {%> <script>alert("통신사가 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("textjoindate").equals("")) {%> <script>alert("가입일자가 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("grade").equals("")) {%> <script>alert("고객등급이 입력되지 않았습니다.");</script><%}
		else if(request.getParameter("city").equals("")) {%> <script>alert("도시코드가 입력되지 않았습니다."); </script><%}
		else {
			pageContext.forward("insertMemberPro.jsp");
		}
	}
%>