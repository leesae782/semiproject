<%@page import="java.net.URLEncoder"%>
<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


       
<%
	//로그인후 가야하는 목적지 정보
	String url=request.getParameter("url");
	//목적지 정보도 미리 인코딩 해 놓는다.
	String encodedUrl=URLEncoder.encode(url);
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid = dao.isValid(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
</head>
<body>

<%if((MemberDao.getInstance().getisStop(id).getIsStop()==0)){ %>
	<%if(isValid){
		//로그인처리를한다 세션에다 id라는 키값에 id를 저장함
		session.setAttribute("id",id);
		%>
		<script>
			alert(" <%=id%> 님로그인되었습니다.");
			location.href = "<%=url %>";
			
		</script>
	<%} else{%>
		<script>
			alert("아이디 혹은 패스워드를 확인하세요.");
			location.href = "login_form.jsp?url=<%=encodedUrl %>";
		</script>
	<%}%>
<%}else if((MemberDao.getInstance().getisStop(id).getIsStop()==1)){ %>
	<script>
		alert("'<%=id%>' 이 계정은 정지된 상태입니다. ");
		location.href = "${pageContext.request.contextPath}/";
	</script>
<%} %>
	
</body>
</html>