create table tbl_cust_201004 (
	p_no	char(4) not null primary key,
	p_name	varchar2(20),
	p_birth	char(8),
	p_tel1	char(3),
	p_tel2	char(4),
	p_tel3	char(4),
	p_city	char(2),
	p_gender	char(1)
);

select * from tbl_cust_201004 order by p_no;

insert into tbl_cust_201004 values(1001, 'name1', 20020202, 010,3333,3333,10,'F');
insert into tbl_cust_201004 values(1002, 'name2', 20020202, 010,3333,3333,10,'M');
insert into tbl_cust_201004 values(1003, 'name3', 20020202, 010,3333,3333,10,'F');

drop table tbl_cust_201004;
drop table tbl_order_201004;
drop table tbl_ingection_201004;

create table tbl_order_201004 (
	p_seno	number(8),
	i_code	char(5) not null,
	p_no	char(4) not null,
	p_date	date,
	constraint pk1 primary key(i_code, p_no)
);

select * from tbl_order_201004 order by p_seno, p_no;

insert into tbl_order_201004 values(20200001, 'A0001', 1001, SYSDATE);

create table tbl_ingection_201004 (
	i_code	char(5) not null primary key,
	i_name	varchar2(20)
);

insert into tbl_ingection_201004 values('A0001', '코로나');

select b.p_seno, a.p_no, a.p_name, b.i_code, c.i_name, b.p_date  
from tbl_cust_201004 a, 
tbl_order_201004 b,
tbl_ingection_201004 c
where a.p_no = b.p_no AND b.i_code = c.i_code
order by b.p_seno, a.p_no;


select a.i_code, b.i_name, count(a.i_code) num from tbl_order_201004 a, tbl_ingection_201004 b group by  a.i_code, b.i_name order by a.i_code;
