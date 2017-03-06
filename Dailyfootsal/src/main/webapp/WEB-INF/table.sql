CREATE TABLE d_users(
id VARCHAR2(20) PRIMARY KEY,
pwd VARCHAR2(20),
name VARCHAR2(20))

CREATE TABLE d_board(
num NUMBER(10) PRIMARY KEY,
title VARCHAR2(100),
name VARCHAR2(20),
contents CLOB,
regdate VARCHAR2(20))

CREATE SEQUENCE d_board_seq NOCACHE;

CREATE TABLE d_board_comment(
num NUMBER PRIMARY KEY,  --덧글의 글번호
writer VARCHAR2(100),
content VARCHAR2(500),
target_id VARCHAR2(100), --덧글의 대상이 되는 아이디
ref_group NUMBER,		 --덧글 그룹
comment_group NUMBER,	 --덧글 내에서의 그룹
regdate DATE
);