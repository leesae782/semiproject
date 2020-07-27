
<%@page import="test.dao.BulletinDao"%>
<%@page import="test.dto.BulletinDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String url = request.getParameter("url");
	BulletinDto dto=new BulletinDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess=BulletinDao.getInstance().bulletin_update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("<%=num%>번 글을 수정했습니다.");
			location.href="<%=url%>";
		</script>
	<%}else{ %>
		<script>
			alert("글 수정 실패!");
			location.href="updateform.jsp?num=<%=num%>";
		</script>
	<%} %>
	
</body>
</html>