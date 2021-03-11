<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="DBPKG.HrdDAO"/>
<jsp:useBean id="dto" class="dto.MemberDTO"/>
<jsp:setProperty property="*" name="dto"  />
<%
	String jdate = (String)request.getParameter("textdate");
	String textDate = jdate.substring(0,4)+"-"+jdate.substring(4,6)+"-"+jdate.substring(6,8);
	System.out.println(textDate);
	Date joinDate = Date.valueOf(textDate);
	dto.setJoindate(joinDate);
	System.out.println(dto.toString());
	boolean res= dao.insertMember(dto);
	if(res) {
%>
	<script type="text/javascript">alert("회원등록이 완료 되었습니다!");location.href = "index.jsp";</script>
<%	} else { %>
	<script type="text/javascript">alert("회원등록 실패");location.href = "index.jsp";</script>
<%	}
%>
