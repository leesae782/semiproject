<%@page import="test.dao.bulletin_dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//해당 글을 삭제한다.
	bulletin_dao.getInstance().bulletin_delete(num);
	//리다일렉트 응답한다. (클라이언트에게 특정 경로로 요청을 다시 하라고 강요하기)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/funny/funny.jsp");
%>    
