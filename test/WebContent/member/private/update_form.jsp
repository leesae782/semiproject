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
<form action="update.jsp" method="post" id = "myForm">
	<input type="hidden" name="profile" id="profile" 
		value="<%=dto.getProfile()%>"/>
	<table class="table table-boardered">
            
    <tr>
       <th rowspan="2" class="text-center">프로필 사진</th>
            <%if(dto.getProfile()==null){ %>
		<td ><img class="text-center" id="info-image" 
			src="${pageContext.request.contextPath }/images/yellowbird.png"/>
		</td>
			<%}else{ %>
		<td ><img class="text-center" id="info-image" 
			src="${pageContext.request.contextPath }<%=dto.getProfile()%>"/>
		</td>	
			<%} %>
            	 
				
     </tr> 
      <tr >
         <td style ="border-top: 2px solid white;"><a  href="javascript:" id="profileLink">프로필사진 선택</a></td>	
       </tr>
       <tr>
         <th class="text-center"><label for="nick">닉네임</label></th>
          <td>
             <input class="form-control"type="text" id = "nick" name = "nick" value="<%=dto.getNick() %>" />
             <span class="font-size" id="nickResult">닉네임을 다시설정해주세요</span>
           </td>
		 <td class=""><button class="btn btn-outline-dark" id ="checknick">중복확인</button></td>
       </tr>
        <tr>
           <th class="text-center"><label for="email">이메일</label></th>
            <td>
            <input class="form-control"type="text" id = "email" name = "email" value="<%=dto.getEmail() %>" />
        	<span class="font-size" id="emailResult">이메일을 확인하세요.</span>
             </td>
			 <td class=""><button class="btn btn-outline-dark" id ="checkemail">중복확인</button></td> 	
        </tr>
        </table>
        
        
        <button class="btn btn-outline-success"type="submit">수정</button>
		<button class="btn btn-outline-danger"type="reset">취소</button>
</form>
				
	<form action="profile_upload.jsp" method="post" 
		enctype="multipart/form-data" id="profileForm">
		<input type="file" name="image" 
		accept=".jpg, .jpeg, .png, .JPG, .JPEG" id="image"/>
	</form>
</div>
	    		


<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>	


<script>
  	$("#profileLink").on("click", function(){
		//input type="file" 을 강제 클릭한다.
		$("#image").click();
		
	});
  	
  	$("#image").on("change", function(){
		//폼을 강제 제출한다.
		$("#profileForm").submit();
	});
  	
  	
  	$("#profileForm").ajaxForm(function(data){
		//프로필 이미지를 업데이트 한다. data => {imageSrc:"/upload/xxx.jpg"}
		$("#info-image")
		.attr("src","${pageContext.request.contextPath }"+data.imageSrc);
		//회원정보 수정폼 전송될때 같이 전송 되도록한다.
		$("#profile").val(data.imageSrc);// input type="hidden" 의 value값
	});
  	
  	
  	//아이디 중복확인을 통과 했는지 여부

	var canUsenNick = false;
	var canUsenEmail = false;
	//중복 확인 버튼을 눌렀을때 실행할 함수 등록

	
	$("#checknick").on("click", function(){
		//입력한닉네임를 읽어온다.
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
		
		if(!canUseNick){//사용 불가한 아이디 이면 
			alert("닉네임 중복을 확인 하세요");
			return false; //폼 제출 막기 
		}
		if(!canUseEmail){//사용 불가한 아이디 이면 
			alert("이메일 중복을 확인 하세요");
			return false; //폼 제출 막기 
		}

	});
  		
  	
 </script>

<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★</-> -->


</body>
</html>

