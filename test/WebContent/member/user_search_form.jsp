<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int isSearch = Integer.parseInt(request.getParameter("isSearch"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/user_search_form.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/make.css" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>


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
<%if(isSearch==1){ %>
	<h1>패스워드 찾기</h1>
	<form action="search_check.jsp" method="post" >
	<input type="hidden" name="nick" value="0" />
	<input type="hidden" name="IdPwd" value="1" />
        <table class="table table-boardered">
            <tr>
                <th class="text-center"><label for="userid">아이디</label></th>            
                <td>
                <input type="text" class="form-control" name="userid"  id="userid" placeholder="아이디 입력...">
                </td>   
            </tr>
                        <tr>
                <th class="text-center"><label for="quiz">질문 글</label></th>
            	<td>
					<div class="form-inline">
						<select class="form-control" name="quiz">
							<option selected value='1'>나의 보물 1호는 ?</option>
							<option value='2'>좋아하는 음식은 ?</option>
							<option value='3'>초등학교 이름은 ?</option>
							<option value='4'>가장 친한 친구 이름은 ?</option>
							<option value='5'>좋아하는 동물은 ?</option>
						</select>
					</div>
				</td>
            </tr>
            <tr>
                <th class="text-center"><label for="quizcheck">질문 답변</label></th>
                <td>
                	<input type="text" class="form-control" id="quizcheck" name="quizcheck" placeholder="">
                </td>
            </tr>
            <tr>
                <td class="text-center"colspan="3">
	                <input type="submit" class="btn btn-outline-primary" value="확인">
	                <input type="reset" class="btn btn-outline-danger" value="취소">
                </td>
                <td></td>
            </tr>
        </table>
    </form>
     	<div style="float:right;">
        	<a class="btn btn-primary" href="${pageContext.request.contextPath }/member/user_search_form.jsp?isSearch=0">아이디 찾기</a>
        </div>
<%}else if(isSearch==0){ %>
	<h1>아이디 찾기</h1>
    <form action="search_check.jsp" method="post">
    	<input type="hidden" name="userid" value="0" />
    	<input type="hidden" name="IdPwd" value="0" />
        <table class="table table-boardered">
            <tr>
                <th class="text-center"><label for="nick">닉네임</label></th>
                <td>
                	<input type="text" class="form-control" id="nick"name="nick" placeholder="닉네임 임력...">
                </td>
            </tr>
            <tr>
                <th class="text-center"><label for="quiz">질문 글</label></th>
            	<td>
					<div class="form-inline">
						<select class="form-control" name="quiz">
							<option selected value='1'>나의 보물 1호는 ?</option>
							<option value='2'>좋아하는 음식은 ?</option>
							<option value='3'>초등학교 이름은 ?</option>
							<option value='4'>가장 친한 친구 이름은 ?</option>
							<option value='5'>좋아하는 동물은 ?</option>
						</select>
					</div>
				</td>
            </tr>
            <tr>
                <th class="text-center"><label for="quizcheck">질문 답변</label></th>
                <td>
                	<input type="text" class="form-control" id="quizcheck" name="quizcheck" placeholder="">
                </td>
            </tr>
            <tr>
                <td class="text-center"colspan="3">
	                <input type="submit" class="btn btn-outline-primary" value="확인">
	                <input type="reset" class="btn btn-outline-danger" value="취소">
	                
                </td>
                <td></td>
            </tr>
        </table>
        
    </form>
    	<div style="float:right;">
        	<a class="btn btn-primary" href="${pageContext.request.contextPath }/member/user_search_form.jsp?isSearch=1">비밀번호 찾기</a>
        </div>
<%} %>
</div>

<jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>

</body>
</html>