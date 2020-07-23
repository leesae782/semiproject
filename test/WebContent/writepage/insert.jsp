<%@page import="test.dao.BulletinDao"%>
<%@page import="test.dto.BulletinDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String kinds= request.getParameter("kinds");
	BulletinDto dto = new BulletinDto();
	dto.setName(name);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setKinds(kinds);
	BulletinDao dao = BulletinDao.getInstance();
	boolean isSuccess = dao.bulletin_insert(dto);
	String url = request.getParameter("url");

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
<%if(isSuccess){ %>
	<script>
		alert("성공적으로 작성하였습니다.");
		location.href = "<%=url%>"
	</script>
<% } else {%>
 <a href="${pageContext.request.contextPath }/writepage/insertform.jsp">실패 다시</a>
<%} %>

</body>
</html>