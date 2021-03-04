<%@page import="java.sql.Date"%>
<%@page import="my.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
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
	if(request.getParameter("pass").equals(request.getParameter("repass"))) {
		// 비번과 확인비번 같을 때만
		String id = request.getParameter("id");
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setName(request.getParameter("name"));
		dto.setId(request.getParameter("id"));
		dto.setPass(request.getParameter("pass"));
		dto.setBirth(Integer.parseInt(request.getParameter("birth")));
		dto.setGender(request.getParameter("gender"));
		dto.setJob(request.getParameter("job"));
		dto.setAddress(request.getParameter("address"));
		//java.sql.Date d = java.sql.Date.valueOf(request.getParameter("regDate"));
		//dto.setRegDate(d);

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