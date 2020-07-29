<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String comment = request.getParameter("comment");
System.out.println(comment);
%>

{"comment":<%=comment%>}

