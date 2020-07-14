CREATE TABLE bulletin_board(
num NUMBER PRIMARY KEY,
name VARCHAR2(10) NOT NULL,
title VARCHAR2(50) NOT NULL,
content VARCHAR2(2048) NOT NULL,
regdate DATE,
recom NUMBER,
lookup NUMBER
);

CREATE SEQUENCE bulletin_board_seq;