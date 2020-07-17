<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/signup.jsp</title>


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</head>
<style>
	.font-size {
	color : blue;
	font-size : 80%;
	}
</style>
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
	<h1 class="">Join</h1>
    <form action="signup.jsp" method="post" id ="myForm">
        <table class="table table-boardered">
            <tr>
                <th class="text-center"><label for="id">아이디</label></th>
               
                <td>
                <input type="text" class="form-control" name="id"  id="id"placeholder="8글자 ~15글자입력하세요">	
                	<span class="font-size" id ="idResult">8글자 ~15글자입력하세요</span>
                </td>
                <td ><button class="btn btn-outline-dark" id = "checkid">중복확인</button></td>    
               	  
            </tr>
            <tr>
                <th class="text-center"><label for="pwd">패스워드</label></th>
                <td><input type="password" class="form-control" id="pwd"name="pwd" placeholder="8글자 이상 입력하세요">
                	<span class="font-size" id ="pwdResult">8글자 이상 입력하세요</span>
                </td>      
                <td></td>
            </tr>
             
            <tr>
                <th class="text-center"><label for="pwd1">패스워드 확인</label></th>
                <td><input type="password" class="form-control"id="pwd1" name="pwd1"placeholder="8글자 이상 입력하세요">
                	<span class="font-size"></span>
                </td>        
                <td></td>
            </tr>
             
            <tr>
                <th class="text-center"><label for="nick">닉네임</label></th>
                <td><input type="text" class="form-control" id="nick" name="nick"placeholder="4글자~12글자 입력하세요">
                	<span class="font-size" id="nickResult">닉네임을 다시설정해주세요</span>
                </td>   
                <td class=""><button class="btn btn-outline-dark" id ="checknick">중복확인</button></td> 	
                    
            </tr>
             
            <tr>
                <th class="text-center"><label for="email">이메일</label></th>
                <td><input type="email" class="form-control" id = "email" name="email">
                	<span class="font-size" id="emailResult">이메일을 확인하세요.</span>
                </td>  
                <td class=""><button class="btn btn-outline-dark" id ="checkemail">중복확인</button></td> 	
            </tr>
            
            <tr>
                <td class="text-center"colspan="3">
                <input type="submit" class="btn btn-outline-primary" value="가입">
                <input type="reset" class="btn btn-outline-danger" value="취소">
                </td>
                <td></td>
            </tr>
             
             
        </table>
    </form>
	
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script>
	//아이디 중복확인을 통과 했는지 여부
	var canUseId=false;
	var canUsenNick = false;
	var canUsenEmail = false;
	//중복 확인 버튼을 눌렀을때 실행할 함수 등록
	
	$("#pwd").on("input",function(){
		var pwd=$(this).val();
		
		if(pwd.length<8){
			$("#pwdResult").text("8글자 이상 입력하세요").css("color","blue");
			
		}else{
			$("#pwdResult").text("확인").css("color","green");
		}
	})
	
	
	$("#checkid").on("click", function(){
		//입력한 아이디를 읽어온다.
		var inputId=$("#id").val();
		//ajax 를 이용해서 서버에 보낸후 결과를 응답 받는다.
		$.ajax({
			method:"GET",
			url:"checkid.jsp",
			data:"inputId="+inputId,
			success:function(data){
				//data => {isExist:true} or {isExist:false} 인 object 이다.
				if((!data.isExist) && inputId.length >=8 && inputId.length<=15){//사용가능 
					alert("사용 가능한 아이디 입니다.");
					$("#idResult")
					.text("사용 가능한 아이디 입니다.")
					.css("color","green");
					//아이디가 사용 가능 하다고 표시한다.
					canUseId=true;
				}else{//이미 존재하는 아이디임으로 사용 불가	
					alert("이미 존재하거나 너무 짧습니다.");
				$("#idResult").text("이미 존재하거나 너무 짧습니다.").css("color","blue");
					//아이디가 사용 불가 하다고 표시한다.
					canUseId=false;
				}
 			}
		});
		//form 안에 있는 일반 버튼을 눌러도 폼이 전송 되기 때문에 폼 전송을 막아준다.
		return false;
	});
	
	$("#checknick").on("click", function(){
		//입력한 아이디를 읽어온다.
		var inputnick=$("#nick").val();
		//ajax 를 이용해서 서버에 보낸후 결과를 응답 받는다.
		$.ajax({
			method:"GET",
			url:"checknick.jsp",
			data:"inputnick="+inputnick,
			success:function(data){
				//data => {isExist:true} or {isExist:false} 인 object 이다.
				if((!data.isExist) && inputnick.length >=4 && inputnick.length<=12){//사용가능 
					alert("사용 가능한 닉네임 입니다.");
					$("#nickResult")
					.text("사용 가능한 닉네임 입니다.")
					.css("color","green");
					//아이디가 사용 가능 하다고 표시한다.
					canUseNick=true;
				}else{//이미 존재하는 아이디임으로 사용 불가	
					alert("이미 존재하거나 너무 짧습니다.");
				$("#nickResult").text("이미 존재하거나 너무 짧습니다.").css("color","blue");
					//아이디가 사용 불가 하다고 표시한다.
					canUseNick=false;
				}
 			}
		});
		//form 안에 있는 일반 버튼을 눌러도 폼이 전송 되기 때문에 폼 전송을 막아준다.
		return false;
	});
	
	$("#checkemail").on("click", function(){
		//입력한 아이디를 읽어온다.
		var inputEmail=$("#email").val();
		//ajax 를 이용해서 서버에 보낸후 결과를 응답 받는다.
		$.ajax({
			method:"GET",
			url:"checkemail.jsp",
			data:"inputEmail="+inputEmail,
			success:function(data){
				//data => {isExist:true} or {isExist:false} 인 object 이다.
				if(!data.isExist&& inputEmail.length >=10 && inputEmail.length<=45){//사용가능 
					alert("사용 가능한 이메일 입니다.");
					$("#emailResult")
					.text("사용 가능한 이메일 입니다.")
					.css("color","green");
					//아이디가 사용 가능 하다고 표시한다.
					canUseEmail=true;
				}else{//이미 존재하는 아이디임으로 사용 불가	
					alert("사용 불가능한  이메일 입니다.");
				$("#emailResult").text("사용 불가능한  이메일 입니다.").css("color","blue");
					//아이디가 사용 불가 하다고 표시한다.
					canUseEmail=false;
				}
 			}
		});
		//form 안에 있는 일반 버튼을 눌러도 폼이 전송 되기 때문에 폼 전송을 막아준다.
		return false;
	});
	//폼에 submit 이벤트가 일어났을때 호출될 함수 등록 
	$("#myForm").on("submit", function(){
		
		if(!canUseId){//사용 불가한 아이디 이면 
			alert("아이디 중복을 확인 하세요");
			return false; //폼 제출 막기 
		}
		if(!canUseNick){//사용 불가한 아이디 이면 
			alert("닉네임 중복을 확인 하세요");
			return false; //폼 제출 막기 
		}
		if(!canUseEmail){//사용 불가한 아이디 이면 
			alert("이메일 중복을 확인 하세요");
			return false; //폼 제출 막기 
		}
		
		var pwd = $("#pwd").val();
		var pwd1 = $("#pwd1").val();
		if(pwd!=pwd1){
			alert("비밀번호 가 일치하지 않습니다. 다시 입력해 주세요.");
			$("#pwd").val("").focus();
			$("#pwd1").val("");
			return false;
		}
		
		if(pwd.length<8){
			alert("비밀번호가 너무 짧습니다 다시 설정해주세요");
			$("#pwd").val("").focus();
			$("#pwd1").val("");
			//폼전송을 막는다. 
			return false;
		}
	});
</script>
</div>






<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>



</body>
</html>

