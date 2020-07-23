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

CREATE SEQUENCE bulletin_board_seq;