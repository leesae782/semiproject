<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<br />


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
	
	<div class="col-sm">
                <div class="card">
                    <div class="card-header">
                        <p>최근 게시물</p>
                    </div>
                    <div class="card-body">
                        <p>운영체제가 Android 입니다.</p>
                        <p>운영체제가 Android 입니다.</p>
                    </div>
                    
                </div>   
     </div>
	<div class="row">
    	<div class="col-sm-9">
			<div class="row">
    			<div class="col-sm">
    				<div class="card" style="width: 15.8rem;">
 						 <div class="card-header">
  						 유머게시판
 			 			</div>
 						 <div class="card-body">
                        <p>운영체제가 Android 입니다.</p>
                        <p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    			
    			</div>
    			<div class="col-sm">
    				<div class="card" style="width: 15.8rem;">
 						  <div class="card-header">
  						 유머게시판
 			 			</div>
 						 <div class="card-body">
                        <p>운영체제가 Android 입니다.</p>
                        <p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    			
    			</div>
   				 <div class="col-sm">
    				<div class="card" style="width: 15.8rem;">
 						  <div class="card-header">
  						 유머게시판
 			 			</div>
 						 <div class="card-body">
                        <p>운영체제가 Android 입니다.</p>
                        <p>운영체제가 Android 입니다.</p>
                    	</div>
					</div>
    			
    			</div>
  			</div>
		</div>
    	<div class="col-sm-3">
<<<<<<< HEAD
 		
 		
 		
 		<!-- 로그인 폼 시작 -->
 
 
    		<div class="login-box well" >
                <form accept-charset="UTF-8" role="form" method="post" action="">
                    <legend>로그인</legend>
                    <div class="input-group"  style="margin-bottom: 1em;"">
                        <span class="input-group-addon" ><i class="fa fa-user"></i></span>
                        <input type="text" id="userid" value='' placeholder="ID를 입력하세요" class="form-control" />
                    </div>
                    <div class="input-group" style="margin-bottom: 1em;">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" id="password" value='' placeholder="비밀번호를 입력하세요" class="form-control" />
                    </div>
                    <button type="submit" id="login-submit" class="btn btn-default btn-block bg-light" style="margin-bottom: 1em;"/>로그인</button>
                    <div class="form-group">
                        <a href="registerForm.php" class="btn btn-default btn-block bg-light"> 회원가입</a>
                        <span class='text-center'><a href="" class="text-sm">비밀번호 찾기</a></span>
                    </div>
                </form>
            </div>
            
        <!-- 로그인 폼 끝 -->  
        
        
          
=======
    	
    		<div class="card" style="width: 15.8rem;">
 						  <div class="card-header">
  						 유머게시판
 			 			</div>
 						 <div class="card-body">
                        <p>운영체제가 Android 입니다.</p>
                        <p>운영체제가 Android 입니다.</p>
                    	</div>
			</div>
>>>>>>> refs/heads/master
    	</div>
  	</div>
  	
  	<br />
  	
  	
  	<div class="row">
    	<div class="col-sm-9">
			<div class="card" >
 						 <div class="card-header">
  						  회원가입
 			 			</div>
 						 <ul class="list-group list-group-flush">
    						<li class="list-group-item">Cras justo odio</li>
   							 <li class="list-group-item">Dapibus ac facilisis in</li>
    						<li class="list-group-item">Vestibulum at eros</li>
  						</ul>
			</div>
    	<div class="col-sm-3">
    	
    		
    	</div>
  	</div>
    
  </div>

	


</div>







<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★</-> -->


</body>
</html>

