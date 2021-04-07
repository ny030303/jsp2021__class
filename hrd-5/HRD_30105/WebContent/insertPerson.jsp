<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="header.jsp"/>

<p>인사관리 사원등록</p>
<form action="insertPerson.jsp" method="post">
	<table>
		<tr>
			<td>성명</td>
			<td>: <input type="text" name="name" placeholder="ex.홍길동"></td>
		</tr>
		<tr>
			<td>사원번호</td>
			<td>: <input type="number" name="id" placeholder="ex.43" ></td>
		</tr>
		<tr>
			<td>소속부서</td>
			<td>: <input type="text" name="dept" placeholder="ex.인사부"></td>
		</tr>
		<tr>
			<td>직급</td>
			<td>: <input type="number" name="position" placeholder="ex. 1"></td>
		</tr>
		<tr>
			<td>직책</td>
			<td>: <input type="text" name="duty" placeholder="ex.사원"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>: <input type="text" name="phone" placeholder="ex.010-1234-5678"></td>
		</tr>
	</table>
	<input type="submit" value="등록" class="formSubmit"> 
</form>	
<button onclick="location.href='main.jsp'">취소</button>
<jsp:include page="footer.jsp"/>


<%
	if(request.getMethod().equals("POST")) {
		if(request.getParameter("name").equals("")) { %> <script>alert("성명 칸이 비었습니다.")</script> <% }
		else if(request.getParameter("id").equals("")) { %> <script>alert("사원 번호 칸이 비었습니다.")</script> <% }
		else if(request.getParameter("dept").equals("")) { %> <script>alert("소속부서 칸이 비었습니다.")</script> <% }
		else if(request.getParameter("position").equals("")) { %> <script>alert("직급 칸이 비었습니다.")</script> <% }
		else if(request.getParameter("duty").equals("")) { %> <script>alert("직책 칸이 비었습니다.")</script> <% }
		else if(request.getParameter("phone").equals("")) { %> <script>alert("연락처 칸이 비었습니다.")</script> <% }
		else {
			pageContext.forward("insertPersonPro.jsp");
		}
	}
			
%>