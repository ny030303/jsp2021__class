<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>

	<p>인사관리 메인메뉴</p>
	<button onclick="location.href='personListForm.jsp'">조회</button>
	<button onclick="location.href='insertPerson.jsp'">사원등록</button>
	<button onclick="location.href='updatePerson.jsp'">정보변경</button>
	<button onclick="location.href='deletePerson.jsp'">퇴사처리</button>
	<button onclick="parent.window.close()">종료</button>
	
<jsp:include page="footer.jsp"/>