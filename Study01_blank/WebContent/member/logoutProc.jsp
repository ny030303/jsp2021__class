<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="my.member.MemberDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Refresh"
	content="3; url=loginForm_sub.jsp" charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		boolean rst = false;
		String id = (String) session.getAttribute("loginId");
	if(id != null) {
		session.removeAttribute("loginId");
		rst= true;
	}
	%>
	<%
		if (rst) {
			out.println("<h2>로그아웃 정상 처리되었습니다.</h2>");
		} else {
			out.println("<h2>로그아웃중 오류가 발생하였습니다.</h2>");
		}
	%>
	3초 뒤 로그인 페이지로 이동합니다.
</body>
</html>