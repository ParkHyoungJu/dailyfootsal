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