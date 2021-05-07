<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {padding: 0; margin: 0; box-sizing: border-box;}
	ul {list-style: none;}
	a {text-decoration: none;}
	header {width: 100%; padding: 20px;text-align: center; background: #333; color: #fff;}
	nav {width: 100%; background: #777;}
	nav ul {display: flex;}
	nav ul li {padding: 10px;}
	nav ul li a{color: #fff;}
	footer {position: fixed; bottom: 0; width: 100%; padding: 20px;text-align: center; background: #333; color: #fff;}
	section {width: 1200px; margin: 20px auto 100px auto; }
	table {text-align: center;}
</style>
</head>
<body>
<header>
	<h2>(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</h2>
</header>
<nav>
	<ul>
		<li><a href="selectMember.jsp">후보조회</a></li>
		<li><a href="insertVote.jsp">투표하기</a></li>
		<li><a href="selectVote.jsp">투표검수조회</a></li>
		<li><a href="selectMemberVote.jsp">후보자수</a></li>
		<li><a href="index.jsp">홈으로</a></li>
	</ul>
</nav>
