<%@page import="test.commentdto.CommentDto"%>
<%@page import="test.commentdao.CommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String comment = request.getParameter("comment");
String name = request.getParameter("name");
String boardnum= request.getParameter("num");

CommentDao dao = CommentDao.getInstance();
CommentDto dto  = new CommentDto();
dto.setName(name);
dto.setContent(content);
dto.setBoardnum(boardnum);
dao.
System.out.println(comment);
%>

{"comment":<%=comment%>}

