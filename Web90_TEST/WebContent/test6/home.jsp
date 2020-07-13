<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test6/home.jsp</title>
<style>
	
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
	<%-- include 될 jsp 페이지는 반드시 상대경로로 찾아 가야 한다. --%>
	<%-- thisPage 라는 파라미터 명으로 home 이라는 문자열 전달하기 --%>
	<jsp:include page="../include/navbar3.jsp">
		<jsp:param value="home" name="thisPage"/>
	</jsp:include>
	<div class="container">
	<h1>home.jsp 입니다.</h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque ullam cupiditate enim unde nihil fuga dignissimos placeat nostrum praesentium rem nisi distinctio animi error veritatis ipsam natus molestias ab labore!</p>
	
	</div>
	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>





