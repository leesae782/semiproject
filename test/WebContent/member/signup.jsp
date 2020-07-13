<%@page import="test.memberdao.MemberDao"%>
<%@page import="test.memberdto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	
	MemberDto dto = new MemberDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNick(nick);
	dto.setEmail(email);
	
	MemberDao dao = MemberDao.getInstance();
	
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%if(isSuccess){ %>
		<script> 
		alert("회원가입이 정상적으로 되었습니다.")
		location.href = "${pageContext.request.contextPath}/index.jsp";
		</script>
	<%} else{ %>
		<script> alert("회원가입을 실패하였습니다.")
		location.href = "${pageContext.request.contextPath}/member/signup_form.jsp";
		</script>
	<%} %>
</body>
</html>