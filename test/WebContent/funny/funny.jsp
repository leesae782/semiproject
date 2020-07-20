<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="test.dao.bulletin_dao"%>
<%@page import="test.dto.bulletin_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<bulletin_dto> list = bulletin_dao.getInstance().getList();
	

	String id = (String)session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getData(id);
	String url= request.getRequestURI();
%>
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
   		<div class="col-sm-9" style="margin-top:15px;">
   			<h3>게시판 이용 안내</h3>
   			<p style="padding:20px;">어쩌구 저쩌구<br />
   				그래서 이렇고 저렇고
   			</p>
   		</div>
		
   		<div class="col-sm-3" style="margin-top:15px;">
			<jsp:include page="../include/loginstatus.jsp">
 					<jsp:param value="<%=url %>" name="url"/>
 				</jsp:include>
   		</div>
   		
   		
	</div>
	<div class="col-sm-12">
		<div>전체0건 / 1페이지</div>
   		  	<table class="table table-bordered table-hover" style="text-align:center;" >
			  <thead class="thead-light" >
			    <tr >
			    	<th width=6%>번호</th>
			      	<th width=9%>닉네임</th>
				    <th width=57%>제목</th>
				    <th width=14%>날짜</th>
				    <th width=7%>추천</th>
				    <th width=7%>조회</th>
			    </tr>
			  </thead>
			  <tbody style="font-size:0.8em;">
			    <%for(bulletin_dto tmp: list){ %>
			    <tr>
			      <th><%=tmp.getNum() %></th>
			      <td><%=tmp.getName() %></td>
			      <td><a href="${pageContext.request.contextPath }/board/detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getBulletin_title() %></td>
			      <td><%=tmp.getRegdate() %></td>
			      <td><%=tmp.getRecom() %></td>
			      <td><%=tmp.getLookup() %></td>
			    </tr>
			    <%} %>
			  </tbody>
			  
			</table>
			<button style="float:right;"><a href="${pageContext.request.contextPath }/writepage/insertform.jsp">글쓰기</a></button>
	</div>	
	
	
	
	<ul class="pagination" style="text-align: center;">
	<!-- li태그의 클래스에 disabled를 넣으면 마우스를 위에 올렸을 때 클릭 금지 마크가 나오고 클릭도 되지 않는다.-->
	<!-- disabled의 의미는 앞의 페이지가 존재하지 않다는 뜻이다. -->
	<li class="disabled">
	<a href="#">
	<span>«</span>
	</a>
	</li>
	<!-- li태그의 클래스에 active를 넣으면 색이 반전되고 클릭도 되지 않는다. -->
	<!-- active의 의미는 현재 페이지의 의미이다. -->
	<li class="active"><a href="">1</a></li>
	<li><a href="">2</a></li>
	<li><a href="">3</a></li>
	<li><a href="">4</a></li>
	<li><a href="">5</a></li>
	<li>
	<a href="#">
	<span>»</span>
	</a>
	</li>
	</ul>
</div>
</body>
</html>