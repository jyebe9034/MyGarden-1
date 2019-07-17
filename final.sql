-- 회원정보DB
create table members(
m_email varchar(30) primary key,
m_pw varchar(100),
m_name varchar(20),
m_phone varchar(20),
m_zipcode varchar(20),
m_address1 varchar(150),
m_address2 varchar(150),
m_joindate timestamp default sysdate,
m_ipaddress varchar(20),
m_grade varchar(10) default 'public',
m_social varchar(12) default 'MG',
m_point number default 0,
m_gender varchar(6), 
m_birth date,
m_garden varchar(100) unique,
m_profile varchar(200),
m_realpath varchar(300)
);
drop table members;
select * from members;
select m_pw from members where m_email = 'gmail@gmail';
delete from members where m_Email = 'espanoir0419@naver.com';
commit;
insert into members(m_email) values('admin@admin');
select sysdate from dual;

create table test(
birth date
);
insert into test values (to_date('18/1/1', 'yy/mm/dd'));
insert into test values (to_date('1/1', 'yy/mm/dd'));
select * from test;