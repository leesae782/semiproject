<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String id = (String)session.getAttribute("id");

	MemberDao dao = MemberDao.getInstance();
	MemberDto  dto = dao.getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/update_form.jsp</title>


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
	<!--  콘테이너안에  div 9-3 으로 나눈 양식 입니다. 들여쓰기 해주세요
		
		<div class="row">
    		<div class="col-sm-9">
    		  	값 넣기
    		</div>
			
    		<div class="col-sm-3">
 				값 넣기
    		</div>
  		</div>	
	  -->
	
    		  	<h2 style="background-color: #fbf2ffc4;"> 회원정보 수정 </h2>
				<form action="update.jsp" method="post">
				<table class="table table-boardered">
            
            <tr>
            	<th rowspan="2" class="text-center">프로필 사진</th>
            	
            	 <td ><img class="text-center" id="info-image" 
					src="${pageContext.request.contextPath }/images/0.png"/>
				</td>	
				
            </tr>
            <tr >
            	<td style ="border-top: 2px solid white;"><a href=""><button class="btn btn-outline-dark"> 프로필사진변경</button></a></td>	
            </tr>
            <tr>
                <th class="text-center"><label for="nick">닉네임</label></th>
                <td>
                	<input class="form-control"type="text" id = "nick" name = "nick" value="<%=dto.getNick() %>" />
                </td>

            </tr>
            <tr>
                <th class="text-center"><label for="email">이메일</label></th>
                <td>
                	<input class="form-control"type="text" id = "email" name = "email" value="<%=dto.getEmail() %>" />
                </td>

            </tr>
			
        </table>
        
        
        		<button class="btn btn-outline-success"type="submit">수정</button>
				<button class="btn btn-outline-danger"type="reset">취소</button>
				</form>
				
    		</div>
			
  	

<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★</-> -->


</body>
</html>

