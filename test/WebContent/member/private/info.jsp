<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String)session.getAttribute("id");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

<div class="container">
	<p>아이디 : <%= dto.getId() %></p>
	<p> 닉네임 : <%= dto.getNick() %> </p>
	<p> 이메일 : <%= dto.getEmail() %></p>
	<p><a href="update_form.jsp">회원정보수정</a></p>
	<p><a href="pwdupdate_form.jsp">비밀번호수정</a></p>
	
	
  	<a href="javascript:deleteConfirm()">탈퇴</a>
	
	
	<script>
		function deleteConfirm(){
			var isDelete= confirm("<%= id%> 회원님 탈퇴 하시겠습니까?");
			if(isDelete){
				 location.href="delete.jsp";
			}
		}
	</script>

	

</div>

<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>
</body>
</html>