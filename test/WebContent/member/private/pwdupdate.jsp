<%@page import="test.memberdao.MemberDao"%>
<%@page import="test.memberdto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	String id =(String)session.getAttribute("id");
	
	String pwd =request.getParameter("pwd");
	String newPwd = request.getParameter("newPwd");
	
	
	MemberDto dto = new MemberDto();
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	dto.setId(id);
	boolean isSuccess= MemberDao.getInstance().updatePwd(dto);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if (isSuccess){ %>
	<script>
		alert("비밀번호를 수정했습니다");
		location.href = "${pageContext.request.contextPath}/"
	</script>
<%} else {%>
		<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href = "${pageContext.request.contextPath}/member/private/pwdupdate_form.jsp"
		</script>
		
	
	
<%} %>
</body>
</html>