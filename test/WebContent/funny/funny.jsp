<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/funny/funny.jsp</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="funny" name="thisPage"/>
	</jsp:include>
<div class="container">
	<div class="row">
   		<div class="col-sm-9">
   		<div>전체0건 / 1페이지</div>
   		  	<table class="table table-bordered table-hover" style="text-align:center;" >
			  <thead class="thead-light" >
			    <tr>
			    	<th width=7%>번호</th>
			      	<th width=10%>닉네임</th>
				    <th width=62%>제목</th>
				    <th width=7%>날짜</th>
				    <th width=7%>조회</th>
				    <th width=7%>추천</th>
			    </tr>
			  </thead>
			  <tbody id="table-td-font">
			    <tr>
			      <th scope="row">1</th>
			      <td>이름</td>
			      <td>제목</td>
			      <td>날짜</td>
			      <td>조회</td>
			      <td>추천</td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>이름</td>
			      <td>제목</td>
			      <td>날짜</td>
			      <td>조회</td>
			      <td>추천</td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>이름</td>
			      <td>제목</td>
			      <td>날짜</td>
			      <td>조회</td>
			      <td>추천</td>
			    </tr>
			  </tbody>
			</table>
			
			
   		</div>
		
   		<div class="col-sm-3">
			
   		</div>
	</div>	
</div>
</body>
</html>