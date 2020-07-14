CREATE TABLE bulletin_board(
num NUMBER PRIMARY KEY,
name VARCHAR2(10),
title VARCHAR2(50),
content VARCHAR2(2048),
regdate DATE,
recom NUMBER,
lookup NUMBER
);

CREATE SEQUENCE bulletin_board_seq;