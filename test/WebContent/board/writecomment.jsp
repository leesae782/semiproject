<%@page import="test.commentdto.CommentDto"%>
<%@page import="test.commentdao.CommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String comment = request.getParameter("comment");
String name = request.getParameter("name");
String boardnum= request.getParameter("num");


System.out.println(comment);
%>

{"comment":<%=comment%>}

