<%@page import="dto.EmpDTO"%>
<%@page import="com.sun.xml.internal.ws.client.ResponseContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
   <jsp:useBean id="dao" class="dao.HrdDAO"/>
<%	
	EmpDTO user = new EmpDTO();
	int empno  = Integer.parseInt(request.getParameter("empno"));
	System.out.println(empno);
	user = dao.getAEmp(empno);
%>

<jsp:include page="header.jsp"/>

<div class="update-emp">
	<form action="updateEmp.jsp" method="POST">
		<table border="1">
			<tr>
				<td>사원번호</td>
				<td><input type="text" name="empno" value="<%=user.getEmpno()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>사원이름</td>
				<td><input type="text" name="empname" value="<%=user.getEmpname()%>"></td>
			</tr>
			<tr>
				<td>입사일자</td>
				<td><input type="text" name="joindate" value="<%=user.getJoindate()%>"></td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
					<select name="rank">
						<option value="A" <%if(user.getRank().equals("A")){ %> selected <%} %>>사원</option>
						<option value="B" <%if(user.getRank().equals("B")){ %> selected <%} %>>대리</option>
						<option value="C" <%if(user.getRank().equals("C")){ %> selected <%} %>>과장</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>부서입력</td>
				<td>
					<select name="dept">
						<option value="A" <%if(user.getDept().equals("A")){ %> selected <%} %>>디자인</option>
						<option value="B" <%if(user.getDept().equals("B")){ %> selected <%} %>>백엔드</option>
						<option value="C" <%if(user.getDept().equals("C")){ %> selected <%} %>>프론트</option>
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
			pageContext.forward("updateEmpPro.jsp");
		}
	} 
%>