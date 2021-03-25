<%@page import="com.sun.xml.internal.ws.client.ResponseContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
   <jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	int empno = dao.getMaxEmpno();
%>

<jsp:include page="header.jsp"/>

<div class="insert-emp">
	<form action="insertEmp.jsp" method="POST">
		<table border="1">
			<tr>
				<td>사원번호</td>
				<td><input type="text" name="empno" value="<%= empno+1 %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" name="empname" value=""></td>
			</tr>
			<tr>
				<td>입사일자</td>
				<td><input type="text" name="joindate" value=""></td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
					<select name="rank">
						<option value="A">사원</option>
						<option value="B">대리</option>
						<option value="C">과장</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>부서입력</td>
				<td>
					<select name="dept">
						<option value="A">디자인</option>
						<option value="B">백엔드</option>
						<option value="C">프론트</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="submit" value="등록">
	</form>
	
</div>

<jsp:include page="footer.jsp"/>

<%
	System.out.println(request.getMethod());
	if(request.getMethod().equals("POST")) {
		if(request.getParameter("empname").equals("")) {%><script>alert("사원이름은 공백일 수 없습니다.")</script> <%}	
		else if(request.getParameter("joindate").equals("")) {%><script>alert("입사일자는 공백일 수 없습니다.")</script> <%}	
		else if(request.getParameter("rank").equals("")) {%><script>alert("직급은 공백일 수 없습니다.")</script> <%}	
		else if(request.getParameter("dept").equals("")) {%><script>alert("부서는 공백일 수 없습니다.")</script> <%}
		else {
			pageContext.forward("insertEmpPro.jsp");
		}
	} 
%>