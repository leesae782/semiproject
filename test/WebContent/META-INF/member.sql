-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE member(
	id VARCHAR2(100) PRIMARY KEY,
	pwd VARCHAR2(100) NOT NULL,
	nick VARCHAR2(100) NOT NULL,
	email VARCHAR2(100) NOT NULL, 
	profile varchar2(100),
	regdate DATE
);
