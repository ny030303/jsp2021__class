CREATE TABLE employee_tbl (
	empno 		number(5) NOT NULL primary key,
	empname 	varchar2(20),
	joindate	date,
	rank		char(1),
	dept		char(1)
);

INSERT INTO EMPLOYEE_TBL values (10001, '고영만', '2017-03-01', 'A', 'A');
INSERT INTO EMPLOYEE_TBL values (10002, '민준원', '2017-03-01', 'A', 'B');
INSERT INTO EMPLOYEE_TBL values (10003, '원성휘', '2017-03-01', 'B', 'A');
INSERT INTO EMPLOYEE_TBL values (10004, '휘현진', '2017-05-01', 'B', 'B');
INSERT INTO EMPLOYEE_TBL values (10005, '진유민', '2017-05-01', 'C', 'C');

select MAX(empno) empno from EMPLOYEE_TBL;
select empno, empname, to_char(joindate, 'YYYY-MM-DD'), rank, dept from EMPLOYEE_TBL;
update EMPLOYEE_TBL set empname=?, joindate=?, rank=?, dept=? where empno = ?;


drop table employee_tbl;

CREATE TABLE salary_tbl (
	empno 		number(5) NOT NULL,
	payday		date,
	pay			number(10),
	constraint pk_dual2 primary key(empno, payday)
);

INSERT INTO salary_tbl values (10006, sysdate, 0);
select * from salary_tbl;
select empno from salary_tbl group by empno, pay order by empno;
select a.empno, a.empname, sum(pay) pay from EMPLOYEE_TBL a, salary_tbl b where a.empno = b.empno group by a.empno, a.empname order by pay DESC

INSERT INTO salary_tbl values (10001, '2019-03-01', 1540000);
INSERT INTO salary_tbl values (10001, '2019-04-01', 1570000);
INSERT INTO salary_tbl values (10002, '2019-03-01', 1740000);
INSERT INTO salary_tbl values (10002, '2019-04-01', 1770000);
INSERT INTO salary_tbl values (10003, '2019-03-01', 2400000);
INSERT INTO salary_tbl values (10003, '2019-04-01', 2450000);
INSERT INTO salary_tbl values (10004, '2019-03-01', 3400000);
INSERT INTO salary_tbl values (10004, '2019-04-01', 3450000);
INSERT INTO salary_tbl values (10005, '2019-03-01', 4500000);
INSERT INTO salary_tbl values (10005, '2019-04-01', 4550000);