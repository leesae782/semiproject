<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String userId = request.getParameter("id");
	String userNick = request.getParameter("nick");
	
	boolean booleanId = MemberDao.getInstance().isExist(userId);
	boolean booleanNick = MemberDao.getInstance().isnickExist(userNick);
	
	MemberDto dto = MemberDao.getInstance().getData(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/search_check.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/make.css" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>


</head>
<body>


<jsp:include page="/include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>


<div class="container">
	<h1>패스워드 찾기</h1>
	<%if(booleanId && booleanNick){%>
		<div class="alert alert-primary" role="alert">
			<span>비밀번호 : <strong><%=dto.getPwd() %></strong></span>
		</div>
		<a href="${pageContext.request.contextPath}/member/login_form.jsp"><button type="submit" class="btn btn-primary">로그인 하러 가기</button></a>
	<%}else{ %>
		<div class="alert alert-danger" role="alert">
			ID 또는 닉네임이 일치하지 않습니다
		</div>
		<a href="user_search_form.jsp"><button type="submit" class="btn btn-primary">재입력</button></a>
	<%} %>
</div>



<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>



</body>
</html>