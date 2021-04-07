<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="header.jsp"/>

<p>인사관리 사원 퇴사</p>
<form action="deletePerson.jsp" method="post">
	<table>
		<tr>
			<td>성명</td>
			<td>: <input type="text" name="name" placeholder="ex.홍길동"></td>
		</tr>
		<tr>
			<td>사원번호</td>
			<td>: <input type="number" name="id" placeholder="ex.43" ></td>
		</tr>
	</table>
<input type="submit" value="삭제" class="formSubmit"> 
</form>	
<button onclick="location.href='main.jsp'">취소</button>
<jsp:include page="footer.jsp"/>

<%
	if(request.getMethod().equals("POST")) {
		if(request.getParameter("name").equals("")) { %> <script>alert("성명 칸이 비었습니다.")</script> <% }
		else if(request.getParameter("id").equals("")) { %> <script>alert("사원 번호 칸이 비었습니다.")</script> <% }
		else {
			pageContext.forward("deletePersonPro.jsp");
		}
	}
			
%>
