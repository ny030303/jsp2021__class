<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* {padding: 0; margin: 0; box-sizing: border-box; text-align: center;}
	ul {list-style: none;}
	table {width: 600px; margin: 0 auto;}
	a {color: #000;text-decoration: none;}
	header ul li a {color: #fff;}
	header ul { width: 100%; background-color: #222; display: flex;}
	header ul li {padding: 10px 20px;}
	header {margin-bottom: 10px;}
	footer {width: 100%; background: #555; padding: 10px; color:#fff; text-align: center; position: fixed; bottom: 0; left: 0;}
</style>
</head>
<body>
<header>
	<ul>
		<li><a href="index.jsp">회원목록리스트</a></li>
		<li><a href="insertOrder.jsp">주사접종등록</a></li>
		<li><a href="selectOrder.jsp">주사접종목록리스트</a></li>
		<li><a href="selectIngection.jsp">백신별접종목록리스트</a></li>
	</ul>
</header>