<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	session.invalidate(); // 세션을 초기화해서 로그아웃을 처리를한다

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/logout.jsp</title>
</head>
<body>
	
	<script>
		alert("로그아웃되었습니다.");
		location.href = "${pageContext.request.contextPath}/"
	</script>
</body>
</html>