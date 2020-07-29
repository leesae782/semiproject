<%@page import="test.commentdto.CommentDto"%>
<%@page import="test.commentdao.CommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String content = request.getParameter("content");
String name = request.getParameter("name");
int boardnum= Integer.parseInt(request.getParameter("num"));

CommentDao dao = CommentDao.getInstance();
CommentDto dto  = new CommentDto();
dto.setName(name);
dto.setContent(content);
dto.setBoardnum(boardnum);


boolean isSuccess = dao.insert(dto);

System.out.println(content);
System.out.println(name);
System.out.println(boardnum);
%>

{"isSuccess":<%=isSuccess%>}

