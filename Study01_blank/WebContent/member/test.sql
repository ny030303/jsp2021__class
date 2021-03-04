create table member(
	name 	varchar2(100),
	id		varchar2(100),
	pass	varchar2(100),
	birth	number(30),
	gender	varchar2(100),
	job		varchar2(100),
	address	varchar2(100),
	regDate	date
)


update member set pass=? birth=? gender=? job=? address=? regDate=? where id =?

DELETE FROM member WHERE id=? pass=?

values(?,?,?,?,?,?,?,sysdate)