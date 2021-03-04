<%@page import="java.sql.Date"%>
<%@page import="my.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println(request.getParameter("pass"));	
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="my.member.MemberDTO"/>
<jsp:useBean id="dao" class="my.member.MemberDAO"/>
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Boolean rst = false;
	
	if(request.getParameter("pass").equals(request.getParameter("rePass"))) {
		// 비번과 확인비번 같을 때만
		String id = (String)session.getAttribute("loginId");
		dto.setId(id);
		rst = dao.updateMember(dto);
	}
	
	if(rst) {
%>
	<script type="text/javascript">
		location.href="loginForm.jsp";
	</script>
<%
	} else {
%>
	<script type="text/javascript">
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>