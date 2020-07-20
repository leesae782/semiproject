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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/make.css" />
</head>
<body>
<jsp:include page="/include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

<div class="container">

	<h2 style="background-color: #fbf2ffc4;">Information</h2>
	<br />
	<table class="table table-boardered">
            <tr style ="border-top: 2px solid white;">
                <th  class="text-center">아이디</th>
                 
                <td  >
                	<%= dto.getId() %>
                </td>
              
            </tr>
            <tr>
            	<th  class="text-center">프로필 사진</th>
            	
            	 <td ><img class="text-center" id="info-image" 
					src="${pageContext.request.contextPath }/images/0.png"/>
				</td>	
				
            </tr>
           
            <tr>
                <th class="text-center">닉네임</th>
                <td>
                	<%= dto.getNick() %>
                </td>

            </tr>
            <tr>
                <th class="text-center">이메일</th>
                <td>
                	<%= dto.getEmail() %>
                </td>

            </tr>
			
        </table>
        <br />
        <br />
        <div class="text-center">
        <a style="margin-left : 15px;" href="update_form.jsp"><button class="btn btn-outline-dark">회원정보수정</button></a>
		<a style="margin-left : 15px;"href="pwdupdate_form.jsp"><button class="btn btn-outline-dark">비밀번호수정</button></a>
  		<a style="margin-left : 15px;"href="javascript:deleteConfirm()"><button class="btn btn-outline-dark"> 회원 탈퇴</button></a>
	
        </div>
		
	
	
	
	<script>
		function deleteConfirm(){
			var isDelete= confirm("<%= id%> 회원님 탈퇴 하시겠습니까?");
			if(isDelete){
				 location.href="delete.jsp";
			}
		}
	</script>

	

</div>


</body>
</html>