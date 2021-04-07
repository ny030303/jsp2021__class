create table personnel (
	id			char(2) NOT NULL,
	name		varchar2(30) NOT NULL,
	dept		varchar2(20) NOT NULL,
	position	char(1),
	duty		varchar2(20),
	phone		varchar2(14),
	constraint personnel_pk primary key(id,name)
)

drop table personnel;

insert into PERSONNEL values(95, '박민우', '인사부',1,'상무','010-1234-5678');
insert into PERSONNEL values(96, '홍길동', '경리부',2,'과장','010-3333-4444');

update PERSONNEL set name=?,dept=?,position=?, duty=?, phone=? where id=?;

select * from personnel;

select * from personnel where dept = '인사부';
delete  from  PERSONNEL where id = 95 and name= '화하하';