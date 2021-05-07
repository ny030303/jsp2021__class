<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.HrdDAO"/>
<%
	ArrayList<MemberDTO> memList = dao.getAllMember();
%>

<script>
	function submitEvent() {
		let result = false;
		if(fm.V_JUMIN.value == "") {
			alert("주민번호가 입력되지 않았습니다!");
			fm.V_JUMIN.focus();
			
		} else if(fm.V_NAME.value == "") {
			alert("성명이 입력되지 않았습니다!");
			fm.V_NAME.focus();
			
		} 
		 else if(fm.M_NO.value == "") {
				alert("투표번호가 선택되지 않았습니다!");
				fm.M_NO.focus();
				
			}
		 else if(fm.V_TIME.value == "") {
				alert("투표시간이 입력되지 않았습니다!");
				fm.V_TIME.focus();
				
			}
		 else if(fm.V_AREA.value == "") {
				alert("투표장소가 입력되지 않았습니다!");
				fm.V_AREA.focus();
				
			}
		 else if(fm.V_CONFIRM[0].checked == false && fm.V_CONFIRM[1].checked == false) {
				alert("유권자확인이 선택되지 않았습니다!");
			}
		else {
			result = true;
		}
		return result;
	}
	
	function resetEvent() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		fm.V_JUMIN.focus();
		return true;
	}
</script>

<jsp:include page="header.jsp"/>
<section>
<h2>투표하기</h2>
<form name="fm" action="insertVote.jsp" method="post" onsubmit="return submitEvent()" onreset="return resetEvent()">

<table border="1">
	<tbody>
		<tr>
			<td>주민번호</td>
			<td><input type="text" name="V_JUMIN"> 예: 8906153154726</td>
		</tr>
		<tr>
			<td>성명</td>
			<td><input type="text"  name="V_NAME" placeholder="ex. 김유권"></td>
		</tr>
		<tr>
			<td>투표번호</td>
			<td>
				<select name="M_NO">
					<option value=""></option>
					<%for(MemberDTO m : memList) { %>
					
					<option value="<%=m.getM_NO() %>">[<%=m.getM_NO() %>] <%=m.getM_NAME() %></option>
					<%} %>
				</select>
			</td>
		</tr>
		<tr>
			<td>투표시간</td>
			<td><input type="text"  name="V_TIME" placeholder="ex. 0930"></td>
		</tr>
		<tr>
			<td>투표장소</td>
			<td><input type="text"  name="V_AREA" placeholder="ex.제1투표장"></td>
		</tr>
		<tr>
			<td>유권자확인</td>
			<td><input type="radio" name="V_CONFIRM" value="Y"> 확인 <input type="radio" name="V_CONFIRM" value="N"> 비확인</td>
		</tr>
		<tr>
			<td><input type="submit" value="투표하기" > <input type="reset" value="다시하기"></td>
		</tr>
	</tbody>
</table>

</form>
</section>
<jsp:include page="footer.jsp"/>

<%
	if(request.getMethod().equals("POST")) {
%>
		<jsp:useBean id="dto" class="dto.VoteDTO"/>
		<jsp:setProperty property="*" name="dto"/>
<%		
		
		dto.setV_JUMIN(request.getParameter("V_JUMIN"));
		dto.setV_NAME(request.getParameter("V_NAME"));
		dto.setM_NO(Integer.parseInt(request.getParameter("M_NO")));
		dto.setV_TIME(request.getParameter("V_TIME"));
		dto.setV_AREA(request.getParameter("V_AREA"));
		dto.setV_CONFIRM(request.getParameter("V_CONFIRM"));
		
		boolean res = dao.insertVote(dto);
		if(res) { %> <script>alert("정상적으로 등록 되었습니다!"); location.href = "index.jsp";</script><%}
		else { %> <script>alert("등록 실패했습니다."); location.href = "index.jsp";</script><%}
	}
%>