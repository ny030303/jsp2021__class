<%@page import="dto.CourseDTO"%>
<%@page import="javax.naming.Context"%>
<%@page import="dto.LecturerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	String id = request.getParameter("id");
	CourseDTO course = dao.getCourse(id);
	System.out.println(course.toString());
	ArrayList<LecturerDTO> lList = dao.getLecturerNames();  
%>
<jsp:include page="header.jsp"/>
	<div class="insert">
	<h2>교과목 추가</h2>
		<form action="updateCourse.jsp" method="post">
			<table border="1">
				<tr>
					<td>교과목 코드</td>
					<td><input type="text" name="id" value="<%=course.getId()%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>과목명</td>
					<td><input type="text" name="name" value="<%=course.getName()%>"></td>
				</tr>
				<tr>
					<td>담당강사</td>
					<td>
					<select name="lecturer">
					<% for(LecturerDTO l : lList)  {%>
						<option value="<%=l.getIdx()%>" <%if(course.getLecturer().equals(l.getIdx()+"")) { %> selected<%} %>><%=l.getName() %></option>
					<%} %>
					</select>
					</td>
				</tr>
				<tr>
					<td>학점</td>
					<td><input type="text" name="credit" value="<%=course.getCredit()%>"></td>
				</tr>
				<tr>
					<td>요일</td>
					<td>
					<input type="radio" name="week" value="1" <%if(course.getWeek()==1) { %> checked<%} %>>월 
					<input type="radio" name="week" value="2" <%if(course.getWeek()==2) { %> checked<%} %>>화 
					<input type="radio" name="week" value="3" <%if(course.getWeek()==3) { %> checked<%} %>>수 
					<input type="radio" name="week" value="4" <%if(course.getWeek()==4) { %> checked<%} %>>목 
					<input type="radio" name="week" value="5" <%if(course.getWeek()==5) { %> checked<%} %>>금 
					<input type="radio" name="week" value="6" <%if(course.getWeek()==6) { %> checked<%} %>>토 
					
					</td>
				</tr>
				<tr>
					<td>시작</td>
					<td><input type="text" name="start_hour" value="<%=course.getStart_hour()%>"></td>
				</tr>
				<tr>
					<td>종료</td>
					<td><input type="text" name="end_end" value="<%=course.getEnd_end()%>"></td>
				</tr>
			</table>
			<input type="reset" value="취소">
			<input type="submit" value="완료">
		</form>
		<button onclick="location.href='index.jsp'">목록</button>
	</div>
<jsp:include page="footer.jsp"/>

<%
	if(request.getMethod().equals("POST")) {
		System.out.println("post in");
		if(request.getParameter("id").equals("")) { %> <script>alert("교과목 코드는 비울 수 없습니다.")</script> <%}
		else if(request.getParameter("name").equals("")) { %> <script>alert("과목명은 비울 수 없습니다.")</script> <%}
		else if(request.getParameter("lecturer").equals("")) { %> <script>alert("담당강사는 비울 수 없습니다.")</script> <%}
		else if(request.getParameter("credit").equals("")) { %> <script>alert("학점은 비울 수 없습니다.")</script> <%}
		else if(request.getParameter("week").equals("")) { %> <script>alert("요일은 비울 수 없습니다.")</script> <%}
		else if(request.getParameter("start_hour").equals("")) { %> <script>alert("시작칸은 비울 수 없습니다.")</script> <%}
		else if(request.getParameter("end_end").equals("")) { %> <script>alert("종료칸은 비울 수 없습니다.")</script> <%}
		else {
			pageContext.forward("updateCoursePro.jsp");
		}
	}
%>