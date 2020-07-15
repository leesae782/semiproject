<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/pwdupdate_form.jsp</title>


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
	<div class="row">
    		<div class="col-sm-9">
    		  <h1>비밀번호 수정 폼</h1>
				
				
				<form action="pwdupdate.jsp" method="post"class="needs-validation" id="myForm">
          			 <div class="form-group">
               			 <label for="name">기존 비밀번호</label>
                		<input class = "form-control"type="password"placeholder="비밀번호를 입력하세요" name="pwd" id="pwd"/>  <!-- is-invalid-->
             
           			  <div class="invalid-feedback">
                   		 8글자 이상 입력하세요
                	</div>
            		</div>
            		<div class="form-group">
               			 <label for="name">새 비밀번호</label>
                		<input class = "form-control"type="password"placeholder="8글자 이상 입력하세요" name="newPwd" id="newPwd"/>  <!-- is-invalid-->
             
           			  <div class="invalid-feedback">
                   		 8글자 이상 입력하세요
                	</div>
            		</div>
            		<div class="form-group">
               			 <label for="name">새 비밀번호 확인</label>
                		<input class = "form-control"type="password" placeholder="8글자 이상 입력하세요"name="newPwd2" id="newPwd2"/>  <!-- is-invalid-->
             
           			  <div class="invalid-feedback">
                   		 8글자 이상 입력하세요
                	</div>
            		</div>
           			 <button type="submit" class="btn btn-outline-primary">가입</button>
       			 </form>
    		</div>
			
    		<div class="col-sm-3">
 				값 넣기
    		</div>
  	</div>	
	
	
  	
	<script>
	
	 $(".form-control").on("input",function(){
         //입력한 이름을 읽어온다
         var inputname =$(this).val();
         $(this).removeClass("is-valid is-invalid")
         if(inputname.length >=8){ //8글자 이상 입력했을때
             $(this).addClass("is-valid")
         }else{
             $(this).addClass("is-invalid")
         }
     });
	
	
	
	//id 가 myForm  인 곳에 submit 이벤트가 일어 났을때 실행할 함수 등록 
	$("#myForm").on("submit", function(){
		//입력한 새로운 비밀번호 2개를 읽어와서 
		var pwd = $("#pwd").val();
		var pwd1=$("#newPwd").val();
		var pwd2=$("#newPwd2").val();
		//만일 일치하지 않으면 
		
		
		if(pwd ==pwd1){
			alert("기존의 비밀번호와 같습니다 비밀번호를 다시 설정해주세요");
			$("#newPwd").val("").focus();
			$("#newPwd2").val("");
			return false;
		}
		if(pwd1.length<8){
			alert("새로운비밀번호가 너무 짧습니다 다시 설정해주세요");
			$("#newPwd").val("").focus();
			$("#newPwd2").val("");
			//폼전송을 막는다. 
			return false;
		}
		if(pwd1 != pwd2){
			//알림을 띄우고 
			alert("새로운 비밀번호가 일치 하지 않아요");
			//비밀번호 입력란을 초기화 하고 포커스도 주고 
			$("#newPwd").val("").focus();
			$("#newPwd2").val("");
			//폼전송을 막는다. 
			return false;
		}
	});
	
	
	</script>
	
       
   
	

</div>

<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★</-> -->


</body>
</html>

