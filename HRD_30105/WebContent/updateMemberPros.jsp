<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="DBPKG.HrdDAO"/>
<jsp:useBean id="dto" class="dto.MemberDTO"/>
<jsp:setProperty property="*" name="dto"  />

<%
	String textDate = (String) request.getParameter("textdate");
	Date joinDate = Date.valueOf(textDate);
	dto.setJoindate(joinDate);
	System.out.println(dto.toString());
	
	boolean res= dao.updateMember(dto);
	if(res) {
%>
	<script type="text/javascript">alert("회원정보수정이 완료 되었습니다!");location.href = "index.jsp";</script>
<%	} else { %>
	<script type="text/javascript">alert("회원정보수정 실패");location.href = "index.jsp";</script>
<%	}
%>
