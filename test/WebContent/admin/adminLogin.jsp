<%@page import="java.net.URLEncoder"%>
<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


       
<%
	//목적지 정보도 미리 인코딩 해 놓는다.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	
	
	MemberDto dto = new MemberDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid = MemberDao.getInstance().isValid(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>

</head>
<body>
	<%if(isValid){%>
		<%if(id=="admin") %>
			<script>
				alert(" <%=id%> 님로그인되었습니다.");
				location.href = "adminPage.jsp";
				
			</script>
	<%}else {%>
		<script>
			alert("관리자 페이지입니다! 로그인 시도를 하지마세요");
			location.href = "${pageContext.request.contextPath }/index.jsp";
		</script>
	<%} %>
</body>
</html>