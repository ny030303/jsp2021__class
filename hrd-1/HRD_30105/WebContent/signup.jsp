<%@page import="DBPKG.HrdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="DBPKG.HrdDAO"/>

<jsp:include page="header.jsp"/>

<%	int lastCustno = dao.getLastCustno(); %>
<section style="text-align: center;" id="signup">
<h4>홈쇼핑 회원 등록</h4>
<form action="signup.jsp" method="post">
<table border="2">
	<tr>
		<td>회원번호(자동발생)</td>
		<td style="text-align: left"><input type="text" name="custno" value="<%=lastCustno+1 %>" readonly required></td>
	</tr>
	<tr>
		<td>회원성명</td>
		<td style="text-align: left"><input type="text" name="custname" value=""></td>
	</tr>
	<tr>
		<td>회원전화</td>
		<td style="text-align: left"><input type="text" name="phone" value=""></td>
	</tr>
	<tr>
		<td>통신사</td>
		<td style="text-align: left">
			<input type="radio" name="address" checked="checked" value="SK">SK
			<input type="radio" name="address" value="KT">KT
			<input type="radio" name="address" value="LG">LG
		</td>
	</tr>
	<tr>
		<td>가입일자</td>
		<td style="text-align: left"><input type="text" name="textdate" value="" maxlength="8"></td>
	</tr>
	<tr>
		<td>고객등급[A:VIP,B:일반,C:직원]</td>
		<td style="text-align: left">
			<select name="grade">
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>도시코드</td>
		<td style="text-align: left"><input type="number" name="city" value="" maxlength="2"></td>
	</tr>
	<tr>
		<td style="text-align: center" colspan="2">
			<input type="submit" value="등록" >
			<input type="button" value="조회" onclick="location.href = 'memberList.jsp'" >
		</td>
	</tr>
</table>
</form>
</section>

<jsp:include page="footer.jsp"/>

<%
if(request.getMethod().equals("POST")) {
		if(request.getParameter("custname").equals("")) %><script type="text/javascript">alert("회원성명이 입력되지 않았습니다");</script><%
		else if(request.getParameter("phone").equals("")) %><script type="text/javascript">alert("회원전화가 입력되지 않았습니다");</script><%
		else if(request.getParameter("address").equals("")) %><script type="text/javascript">alert("통신사가 입력되지 않았습니다");</script><%
		else if(request.getParameter("textdate").equals("")) %><script type="text/javascript">alert("가입일자가 입력되지 않았습니다");</script><%
		else if(request.getParameter("grade").equals("")) %><script type="text/javascript">alert("고객등급이 입력되지 않았습니다");</script><%
		else if(request.getParameter("city").equals("")) %><script type="text/javascript">alert("거주도시가 입력되지 않았습니다");</script><%
		else {pageContext.forward("signupPros.jsp");}
	}
%>