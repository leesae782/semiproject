<%@page import="test.dao.bulletin_dao"%>
<%@page import="test.dto.bulletin_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title=request.getParameter("subject");
	String content=request.getParameter("summernote");
	bulletin_dto dto=new bulletin_dto();
	dto.setBulletin_title(title);
	dto.setBulletin_content(content);
	boolean isSuccess=bulletin_dao.getInstance().bulletin_insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p> 
			<a href="${pageContext.request.contextPath }/funny/funny.jsp">확인</a> 
		</p>
	<%}else{ %>
		<p>
			글 저장이 실패 되었습니다. 
			<a href="${pageContext.request.contextPath }/funny/funny.jsp">다시 작성하기</a>
		</p>
	<%} %>
</body>
</html>