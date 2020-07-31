CREATE TABLE member
(
    id           VARCHAR2(100)    NOT NULL, 
    pwd          VARCHAR2(100)    NOT NULL, 
    nick         VARCHAR2(100)    NOT NULL, 
    email        VARCHAR2(100)    NOT NULL, 
    profile      VARCHAR2(100)    NULL, 
    regdate      DATE             NOT NULL, 
    quiz         NUMBER           NOT NULL, 
    quizcheck    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (id, nick, email)
);

CREATE SEQUENCE MEMBER_seq;

CREATE TABLE bulletin_board
(
    num        NUMBER          NOT NULL, 
    name       VARCHAR2(40)    NOT NULL, 
    title      VARCHAR2(80)    NOT NULL, 
    content    CLOB            NULL, 
    regdate    DATE            NOT NULL, 
    lookup     NUMBER          NULL, 
    kinds      VARCHAR2(20)    NOT NULL, 
    CONSTRAINT BULLETIN_BOARD_PK PRIMARY KEY (num)
);
CREATE SEQUENCE BULLETIN_BOARD_SEQ;

CREATE TABLE board_comment
(
    num         NUMBER          NOT NULL, 
    name        VARCHAR2(40)    NOT NULL, 
    content     CLOB            NOT NULL, 
    regdate     DATE            NOT NULL, 
    boardnum    NUMBER          NOT NULL, 
    CONSTRAINT BOARD_COMMENT_PK PRIMARY KEY (num)
);

ALTER TABLE board_comment
    ADD CONSTRAINT FK_board_comment_boardnum_bull FOREIGN KEY (boardnum)
        REFERENCES bulletin_board (num) ON DELETE CASCADE;

CREATE SEQUENCE BOARD_COMMENT_SEQ;