<%@page import="test.dao.BulletinDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//해당 글을 삭제한다.
	boolean isSuccess= BulletinDao.getInstance().bulletin_delete(num);
	//리다일렉트 응답한다. (클라이언트에게 특정 경로로 요청을 다시 하라고 강요하기)
	String url = request.getParameter("url");
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
		
		location.href = "<%=url%>";
	</script>
<% } else {%>
 <a href="${pageContext.request.contextPath }/index.jsp">실패 다시</a>
<%} %>

</body>
</html>