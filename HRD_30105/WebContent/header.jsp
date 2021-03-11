<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* {margin: 0; padding: 0; box-sizing: border-box;}
	h4 {text-align: center; margin: 10px 0;}
	h2, footer {
		text-align: center;
		background-color: #555;
		color: #fff;
	}
	a {text-decoration: none; color: #fff;}
	header  ul { list-style: none; display: flex; background-color: #777;}
	header  ul > li { margin: 5px 15px; color: #fff; }
	footer {position: fixed; bottom: 0; width: 100%; padding: 15px 0;}
	#signup table {width: 700px; margin: 0 auto;}
	#mlist table {width: 1200px; margin: 0 auto; text-align: center;}
	#moneyList table {width: 700px; margin: 0 auto; text-align: center;}
	#update table {width: 700px; margin: 0 auto;}
</style>
</head>
<body>
<header>
	<h2>쇼핑몰 회원관리 ver1.0</h2>
	<nav>
		<ul>
			<li><a href="signup.jsp">회원등록</a></li>
			<li><a href="memberList.jsp">회원목록조회/수정</a></li>
			<li><a href="moneyList.jsp">회원매출조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
</header>