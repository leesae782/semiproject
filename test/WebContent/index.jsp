<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	String id =(String)session.getAttribute("id");
 
 	MemberDao dao = MemberDao.getInstance() ;
 	MemberDto dto=dao.getData(id);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>


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
	
	<div class="row">
    		<div class="col-sm-9">
    		  	<div class="row">
   					 <div class="col-sm">
    					  <div class="card" >
 						 	<div class="card-header">
  								<h6>최신게시글</h6> 
 			 				</div>
 							<ul class="list-group">
  								<li class="list-group-item d-flex justify-content-between align-items-center">
   									 Cras justo odio
   									 <span class="badge badge-primary badge-pill">14</span>
  								</li>
 								 <li class="list-group-item d-flex justify-content-between align-items-center">
   									 Dapibus ac facilisis in
   									 <span class="badge badge-primary badge-pill">2</span>
  								</li>
								  <li class="list-group-item d-flex justify-content-between align-items-center">
								    Morbi leo risus
								    <span class="badge badge-primary badge-pill">1</span>
								  </li>
</ul>
						</div>
    				</div>
    				<div class="col-sm">
    					  <div class="card" >
 						 	<div class="card-header">
  								BEST 게시글
 			 				</div>
 						 	<div class="card-body">
                       		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    		</div>
						</div>
   				 	</div>
 				 </div>
 				 
 				 <br />  <!--  첫번째쭐 -->
 				 <div class="row">
    			<div class="col-sm">
    				<div class="card" >
 						 <div class="card-header">
  						유머
 			 			</div>
 						 <div class="card-body">
                        <p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    			
    			</div>
    			<div class="col-sm">
    				<div class="card" >
 						  <div class="card-header">
  						 이슈
 			 			</div>
 						 <div class="card-body">
                       			<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    		
    			</div>
   				 <div class="col-sm">
    				<div class="card" >
 						  <div class="card-header">
  						 정보
 			 			</div>
 						 <div class="card-body">
                        		<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    			
    			</div>
  			</div> 
  			<br /><!-- 두번째줄끝 -->
 			<div class="row">
    			<div class="col-sm">
    				<div class="card" >
 						 <div class="card-header">
  						LOL
 			 			</div>
 						 <div class="card-body">
                        <p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    			
    			</div>
    			<div class="col-sm">
    				<div class="card" >
 						  <div class="card-header">
  						 배틀그라운드
 			 			</div>
 						 <div class="card-body">
                       			<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    		
    			</div>
   				 <div class="col-sm">
    				<div class="card" >
 						  <div class="card-header">
  						 FIFA Online
 			 			</div>
 						 <div class="card-body">
                        		<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    			
    			</div>
  			</div> 
  			<br /><!-- 세번째줄끝 -->
  			<div class="row">
    			<div class="col-sm">
    				<div class="card" >
 						 <div class="card-header">
  						축구
 			 			</div>
 						 <div class="card-body">
                        <p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    			
    			</div>
    			<div class="col-sm">
    				<div class="card" >
 						  <div class="card-header">
  						농구
 			 			</div>
 						 <div class="card-body">
                       			<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    		
    			</div>
   				 <div class="col-sm">
    				<div class="card" >
 						  <div class="card-header">
  						 야구
 			 			</div>
 						 <div class="card-body">
                        		<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                      		 	<p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    			
    			</div>
  			</div> 
    		</div> <!--  col 9 영역 -->
			
    		<div class="col-sm-3">
 				<div class="card" >
 						<% if(id !=null){ %> 
 						
 						<div class="card-body">
                       		<p><%= id %></p>
                       		<p><%=dto.getNick() %></p>
                       		<p><%= dto.getEmail() %></p>	
                       		<p><%= dto.getRegdate() %></p>
                       		
                       		<span><a href="member/update_form.jsp">회원정보수정</a></span> <span><a href="member/logout.jsp">로그아웃</a></span>
	
						
                    	</div>
 						<% }else{%>
 						<div class="card-body">
                       			
	
							<form action="member/login.jsp"method="post"> 
								<div class="form-group">
									<label for="id">아이디</label>
									<input class="form-control"type="text" name="id" id = "id" placeholder="아이디" />
								</div>
								<div class="form-group">
									<label for="pwd">비밀번호</label>
									<input class="form-control"type="text" name ="pwd" id = "pwd" placeholder="비밀번호"/>
								</div>
								
									
								<button class ="btn btn-primary"type="submit">로그인</button>
								
							</form>
							<p><a href="member/signup_form.jsp"><strong>회원가입</strong></a></p>
                    	</div>
 						<%} %>
 						 
					</div>
    		</div><!--  col 3 영역 -->
  	</div>	
  	
  	
  	
  	

	

</div>






<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★</-> -->


</body>
</html>

