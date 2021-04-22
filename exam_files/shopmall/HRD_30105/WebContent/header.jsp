<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>

<style>
	* {margin: 0; padding: 0; box-sizing: border-box;}
	ul {list-style: none;}
	a {text-decoration: none; color: #000;}
	header h2 {background-color: #ddd; text-align: center; color: #fff; background: #333; padding: 10px 0;}
	header ul {display: flex; width: 100%; background-color: #777;}
	header ul li {margin: 5px 20px;}
	header ul li a {color: #fff}
	#main h3 {text-align: center;}
	.wrapper {display: block; width: 1200px; margin: 0 auto;}
	footer {position: fixed; bottom: 0; width: 100%; background-color: #333; color: #fff; text-align: center; padding: 10px;}
	.wrapper > h3 {text-align: center; margin: 10px;}
	table {width: 600px; margin: 0 auto;}
</style>
</head>
<body>

<header>
	<h2>쇼핑몰 회원관리 ver 1.0</h2>
	<ul>
		<li><a href="insertMember.jsp">회원등록</a></li>
		<li><a href="selectMember.jsp">회원목록조회/수정</a></li>
		<li><a href="selectMoney.jsp">회원매출조회</a></li>
		<li><a href="index.jsp">홈으로.</a></li>
	</ul>
</header>