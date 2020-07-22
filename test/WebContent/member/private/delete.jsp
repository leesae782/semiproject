<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String id = (String)session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	dao.delete(id);
	
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/delete.jsp</title>
</head>
<body>
	<script>
		alert("<%=id%>님 회원이 탈퇴되었습니다.");
		location.href="${pageContext.request.contextPath}"
	</script>
</body>
</html>