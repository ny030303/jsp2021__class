<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리 프로그램</title>
</head>
<style>
* {padding: 0;margin: 0; box-sizing: border-box; }
a {text-decoration: none; color: #000}
ul {list-style: none;}

header {text-align: center;}
header ul {display: flex; width: 100%; }
header ul li {padding: 10px 20px; width: 100%; background-color: #333;}
header ul li a {color: #fff; display: block; width: 100%;}
.main {width: 1200px; margin: 0 auto;}

.emp-list {width: 1200px; margin: 0 auto;}
.emp-list table {width: 100%; text-align: center; }

.salary-list {width: 1200px; margin: 0 auto;}
.salary-list table {width: 100%; text-align: center; }
footer {text-align: center; padding: 10px;border-top: 1px solid #aaa;}
</style>
<body>
	<header>
		<h2>사원 관리 프로그램</h2>
		<ul>
			<li><a href="index.jsp">홈으로</a></li>
			<li><a href="insertEmp.jsp">사원등록</a></li>
			<li><a href="salaryList.jsp">사원급여 조회</a></li>
			<li><a href="empList.jsp">사원목록 조회/수정</a></li>
		</ul>
	</header>