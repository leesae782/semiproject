<%@page import="java.util.List"%>
<%@page import="test.dao.bulletin_dao"%>
<%@page import="test.dto.bulletin_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파리미터로 전달되는 자세히 보여줄 글의 번호 읽어오기   ?num=xx
	int num=Integer.parseInt(request.getParameter("num"));
 	//BoardDao 객체를 이용해서 해당글의 정보를 얻어온다.
 	bulletin_dto dto=bulletin_dao.getInstance().bulletin_getData(num);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/funny/funny.jsp</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="funny" name="thisPage"/>
	</jsp:include>
<div class="container">
	<div class="container">
		<p><%=dto.getNum() %></p>
		<p><%=dto.getName() %></p>
		<p><%=dto.getBulletin_title() %></p>
		<p><%=dto.getBulletin_content() %></p>
		<button><a href="updateform.jsp?num=<%=dto.getNum() %>">수정</a></button>
		<button><a href="javascript:deleteConfirm(<%=dto.getNum()%>)">삭제</a></button>
	</div>
	
</div>
</body>
</html>