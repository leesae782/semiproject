CREATE TABLE bulletin_board(
    num        NUMBER          PRIMARY KEY, 
    name       VARCHAR2(40)    NOT NULL, 
    title      VARCHAR2(80)    NOT NULL, 
    content    CLOB            NOT NULL, 
    regdate    DATE            NOT NULL, 
    recom      NUMBER          NULL, 
    lookup     NUMBER          NULL, 
    kinds      VARCHAR2(20)    NOT NULL 
);

CREATE SEQUENCE bulletin_board_seq;