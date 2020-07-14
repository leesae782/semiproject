<%@page import="test.dao.bulletin_dao"%>
<%@page import="test.dto.bulletin_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("summernote");
	bulletin_dto dto = new bulletin_dto();
	dto.setBulletin_title(title);
	dto.setBulletin_content(content);
	
	bulletin_dao dao = bulletin_dao.getInstance();
	dao.bulletin_insert(dto);
	/*
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/funny/funny.jsp");
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<p><%=title %></p>
</body>
</html>