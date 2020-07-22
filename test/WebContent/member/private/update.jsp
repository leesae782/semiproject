<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("id");
	String nick = request.getParameter("nick");
	String email = request.getParameter("email");
	String profile=request.getParameter("profile");
	if(profile.equals("null")){//프로필 이미지를 수정하지 않으면 
		profile=null;
	}
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto =new MemberDto();
	dto.setId(id);
	dto.setNick(nick);
	dto.setEmail(email);
	dto.setProfile(profile);
	
	boolean isSuccess =dao.update(dto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/update.jsp</title>
</head>
<body>


<%if(isSuccess){%>
	<script>
		alert("회원정보를 수정하였습니다.")
		location.href="${pageContext.request.contextPath}/"
	</script>
<%} else { %>
	<script>
		alert("회원정보를 수정하지 못하였습니다..")
		location.href="${pageContext.request.contextPath}/member/private/update_form.jsp"
	</script>
		
<%} %>
</body>
</html>