<%@page import="test.testDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//1번
	testDAO instance = testDAO.getInstance();
	instance.create();
	//2번
	instance.insert();
%>
</body>
</html>