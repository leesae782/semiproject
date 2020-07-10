<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>

<style>
	.navbar-nav > li{
  	padding-left:75px;
  	padding-right:75px;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>


<jsp:include page="/include/navbar3.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

<br />


<div class="container">


	<div class="row">
    	<div class="col-sm-9">
			<div class="row">
    			<div class="col-sm">
    				<div class="card" style="width: 15.8rem;">
 						 <div class="card-header">
  						  유머게시판
 			 			</div>
 						 <ul class="list-group list-group-flush">
    						<li class="list-group-item">Cras justo odio</li>
   							 <li class="list-group-item">Dapibus ac facilisis in</li>
    						<li class="list-group-item">Vestibulum at eros</li>
  						</ul>
					</div>
    			
    			</div>
    			<div class="col-sm">
    				<div class="card" style="width: 15.8rem;">
 						 <div class="card-header">
  						  스포츠게시판
 			 			</div>
 						 <ul class="list-group list-group-flush">
    						<li class="list-group-item">Cras justo odio</li>
   							 <li class="list-group-item">Dapibus ac facilisis in</li>
    						<li class="list-group-item">Vestibulum at eros</li>
  						</ul>
					</div>
    			
    			</div>
   				 <div class="col-sm">
    				<div class="card" style="width: 15.8rem;">
 						 <div class="card-header">
  						 게임게시판
 			 			</div>
 						 <ul class="list-group list-group-flush">
    						<li class="list-group-item">Cras justo odio</li>
   							 <li class="list-group-item">Dapibus ac facilisis in</li>
    						<li class="list-group-item">Vestibulum at eros</li>
  						</ul>
					</div>
    			
    			</div>
  			</div>
		</div>
    	<div class="col-sm-3">
 		
 		
 		
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
        
        
          
    	</div>
  	</div>
  	
  	<br />
  	
  	
  	<div class="row">
    	<div class="col-sm-9">
			<div class="card" ">
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







<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★</-> -->


</body>
</html>

