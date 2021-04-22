<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script>
 	function check() {
 		let result = false;
		if(fm.p_seno.value ==  "") {
			alert("접종받은 코드 칸이 비었습니다.");
			fm.p_seno.focus();
		} else if (fm.i_code.value ==  "") {
			alert("백신코드 칸이 비었습니다.");
			fm.i_code.focus();
		} else if (fm.p_no.value ==  "") {
			alert("회원코드 칸이 비었습니다.");
			fm.p_no.focus();
		} else if (fm.p_date.value ==  "") {
			alert("접종날짜 칸이 비었습니다.");
			fm.p_date.focus();
		} else {
			result = true;
		}
		return result;
	}
 	
 	function resetEvent() {
 		alert("지우고 다시입력합니다!");
 		fm.p_seno.focus();
 	}
 </script>
<jsp:include page="header.jsp"/>

<h3>주사 접종 등록</h3>
<form name="fm" action="insertOrder.jsp" method="post" onsubmit="return check()" onreset="return resetEvent()">
<table border="1">
	<tr>
		<td>접종받은 코드</td>
		<td><input type="text" name="p_seno" placeholder="예)20200001"></td>
	</tr>
	<tr>
		<td>백신코드</td>
		<td><input type="text" name="i_code" placeholder="A0001"></td>
	</tr>
	<tr>
		<td>회원코드</td>
		<td><input type="text" name="p_no" placeholder="1001"></td>
	</tr>
	<tr>
		<td>접종날짜</td>
		<td><input type="text" name="p_date_text" placeholder="2010-10-03"></td>
	</tr>
	<tr>
		<td><input type="submit" value="등록"><input type="reset" value="다시쓰기"></td>
	</tr>
</table>
</form>
<jsp:include page="footer.jsp"/>

<% if(request.getMethod().equals("POST")) { %>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<jsp:useBean id="dto" class="dto.OrderDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%	
		String tdate = request.getParameter("p_date_text");
		Date p_date = Date.valueOf(tdate);
		dto.setP_date(p_date);
		boolean insertRes = dao.insertOrder(dto);
		if(insertRes) {%> <script>alert("등록이 완료되었습니다!"); location.href = "index.jsp";</script><%}
		else {%> <script>alert("등록 실패했습니다."); location.href = "index.jsp";</script><%}
	}
%>