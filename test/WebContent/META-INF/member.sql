-- 사용자(회원) 정보를 저장할 테이블






CREATE TABLE member
(
    id         VARCHAR2(100)    NOT NULL, 
    pwd        VARCHAR2(100)    NOT NULL, 
    nick       VARCHAR2(100)    NOT NULL, 
    email      VARCHAR2(100)    NOT NULL, 
    profile    VARCHAR2(100)    NULL, 
    regdate    DATE             NOT NULL,
    quiznum    NUMBER
    quiz       VARCHAR2(100)    NOT NULL,
    CONSTRAINT MEMBER_PK PRIMARY KEY (id, nick, email)
)