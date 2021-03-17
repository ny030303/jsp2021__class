<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="dao.BookDAO"/>
<jsp:include page="header.jsp"/>

<%	int maxNo = dao.getMaxCustno();  %>

<form action="signup.jsp" method="post">
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td><input name="custno" type="text" value="<%=maxNo+1%>" readonly="readonly" required="required"></td>
		</tr>
		<tr>
			<td>회원이름</td>
			<td><input name="custname" type="text" value=""></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input name="textdate" type="text" value="" placeholder="2015-02-03"></td>
		</tr>
		<tr>
			<td>고객등급</td>
			<td>
				<select name="grade">
					<option value="A">VIP</option>
					<option value="B">일반</option>
					<option value="C">직원</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>주소입력</td>
			<td><input name="address" type="text" value="" placeholder="경기 분당구 서현동"></td>
		</tr>
	</table>
	<input type="submit" value="등록">
</form>

<jsp:include page="footer.jsp"/>
<%
if(request.getMethod().equals("POST")) {
	if(request.getParameter("custname").equals("")) {%> <script>alert("회원이름은 공백이어서는 안됩니다.")</script> <%}
	else if(request.getParameter("custname").length() > 3) {%> <script>alert("회원이름은 3글자를 초과할 수 없습니다.")</script> <%}
	else if(request.getParameter("textdate").equals("")) {%> <script>alert("가입일자는 공백이어서는 안됩니다.")</script> <%}
	else if(request.getParameter("address").equals("")) {%> <script>alert("주소는 공백이어서는 안됩니다.")</script> <%}
	else {
		pageContext.forward("signupPro.jsp");
	}
}
%>
