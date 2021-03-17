create table mem_tbl_book (
	custno number(6) not null primary key,
	custname varchar2(20),
	joindate date,
	grade char(1),
	address varchar2(60)
)

select * from MEM_TBL_BOOK;
UPDATE MEM_TBL_BOOK set custname='박정', joindate='2019-02-15', grade='B', address='경기 분당구 ' where custno=10001;

INSERT INTO MEM_TBL_BOOK values(10001, '박정희', '2019-02-15', 'A', '경기 분당구 서현동');
INSERT INTO MEM_TBL_BOOK values(10002, '최선한', '2019-03-15', 'B', '경기 군포시 산본동');
INSERT INTO MEM_TBL_BOOK values(10003, '김순애', '2019-04-17', 'A', '경기 군포시 산본동');
INSERT INTO MEM_TBL_BOOK values(10004, '최정현', '2019-12-19', 'B', '경기 분당구 정자동');
INSERT INTO MEM_TBL_BOOK values(10005, '김영림', '2019-02-15', 'A', '경기 분당구 정자동');
INSERT INTO MEM_TBL_BOOK values(10006, '박새영', '2019-02-15', 'C', '경기 용인시 용인동');

create table rent_tbl_book (
	custno number(6) not null,
	bookno number(4) not null,
	rentdate date,
	returndate date,
	constraint rent_tbl_book primary key(custno, bookno)
)

INSERT INTO rent_tbl_book values(10001, 1234, '2019-02-15', '2019-02-15');
INSERT INTO rent_tbl_book values(10001, 1122, '2019-02-15', '2019-02-16');
INSERT INTO rent_tbl_book values(10002, 1234, '2019-03-15', '2019-02-15');
INSERT INTO rent_tbl_book values(10003, 1234, '2019-04-17', '2019-02-15');
INSERT INTO rent_tbl_book values(10004, 1122, '2019-12-19', '2019-02-15');
INSERT INTO rent_tbl_book values(10005, 1122, '2019-02-15', '2019-02-15');
INSERT INTO rent_tbl_book values(10005, 1113, '2019-02-15', '2019-02-15');
INSERT INTO rent_tbl_book values(10005, 1114, '2019-02-15', '2019-02-15');
INSERT INTO rent_tbl_book values(10006, 1113, '2019-02-15', '2019-02-15');

SELECT max(custno) custno from mem_tbl_book;


SELECT a.custno, a.custname, count(a.custno) num FROM mem_tbl_book a, rent_tbl_book b WHERE a.custno=b.custno group by a.custno, a.custname;