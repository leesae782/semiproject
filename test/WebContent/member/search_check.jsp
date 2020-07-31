<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int IdPwd = Integer.parseInt(request.getParameter("IdPwd"));
	String userId = request.getParameter("userid");
	String userNick = request.getParameter("nick");
	int quiz = Integer.parseInt(request.getParameter("quiz"));
	String quizcheck = request.getParameter("quizcheck");
	boolean isExistId=false;
	boolean isExistPwd=false;
	String exId="";
	String exPwd="";
	
	try{
	MemberDto dto = new MemberDto();
	dto.setId(userId);
	dto.setNick(userNick);
	dto.setQuiz(quiz);
	dto.setQuizcheck(quizcheck);
	
	if(userNick.equals("0")){
		exPwd = MemberDao.getInstance().getDataPwd(dto).getPwd();
		isExistPwd = MemberDao.getInstance().existencePwd(dto);
	}else{
		exId = MemberDao.getInstance().getDataId(dto).getId();	
		isExistId = MemberDao.getInstance().existenceId(dto);
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	
	/*MemberDto dto =null;
	
	MemberDto tmp=null;
	boolean isExistId=false;
	
	if(userId == null){
		dto = new MemberDto();
		dto.setNick(userNick);
		dto.setQuiz(quiz);
		dto.setQuizcheck(quizcheck);
		isExistId = MemberDao.getInstance().existenceId(dto);
		tmp = MemberDao.getInstance().getDataId(dto);
		System.out.print(isExistId);
	}else{
		dto = new MemberDto();
		dto.setId(userId);
		dto.setQuiz(quiz);
		dto.setQuizcheck(quizcheck);
		isExistId = MemberDao.getInstance().existencePwd(dto);
		tmp = MemberDao.getInstance().getDataPwd(dto);
		System.out.print(isExistId);
		System.out.print(tmp.getPwd());
	}
	
	*/
	
	
	
	
	


	
	
	
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
<%if(IdPwd==1){ %>
	<h1>패스워드 찾기</h1>
	<%if(isExistPwd){%>
		<div class="alert alert-primary" role="alert">
			<span>비밀번호 : <strong><%=exPwd %></strong></span>
		</div>
		<a href="${pageContext.request.contextPath}/member/login_form.jsp"><button type="submit" class="btn btn-primary">로그인 하러 가기</button></a>
	<%}else{ %>
		<div class="alert alert-danger" role="alert">
			'ID' 또는 '답변'이 일치하지 않습니다
		</div>
		<a href="user_search_form.jsp?isSearch=1"><button type="submit" class="btn btn-primary">재입력</button></a>
	<%} %>
<%}else{%>
	<h1>아이디 찾기</h1>
	<%if(isExistId){%>
		<div class="alert alert-primary" role="alert">
		<span>아이디 : <strong><%=exId %></strong></span>
	</div>
	<a href="${pageContext.request.contextPath}/member/login_form.jsp"><button type="submit" class="btn btn-primary">로그인 하러 가기</button></a>
	<%}else{ %>
		<div class="alert alert-danger" role="alert">
			'닉네임' 또는 '답변'이 일치하지 않습니다
		</div>
		<a href="user_search_form.jsp?isSearch=0"><button type="submit" class="btn btn-primary">재입력</button></a>
	<%}%>
<%} %>

</div>



<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>



</body>
</html>