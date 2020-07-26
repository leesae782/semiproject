
<%@page import="test.memberdao.MemberDao"%>
<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.dao.BulletinDao"%>
<%@page import="test.dto.BulletinDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//GET 방식 파리미터로 전달되는 자세히 보여줄 글의 번호 읽어오기   ?num=xx
	int num=Integer.parseInt(request.getParameter("num"));
 	//BoardDao 객체를 이용해서 해당글의 정보를 얻어온다.
 	BulletinDto dto=BulletinDao.getInstance().bulletin_getData(num);
 	String url = request.getParameter("url");
 	 BulletinDao.getInstance().addViewCount(num);
 	String kinds =request.getParameter("kinds");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/detail.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/make.css" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</head>	
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="<%=kinds %>" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<table class="table">
			<thead class="d-font">
			 	<tr>
			 		<th><%=dto.getTitle() %></th>
			 	</tr>
			</thead>
			<tbody>
				<tr>
					<th>작성자 : <%=dto.getName() %></td>
					</th>
				</tr>
				<tr>
					<th>일자 : <%=dto.getRegdate() %></th>				
				</tr>
				<tr>
					<td><%=dto.getContent() %></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</tbody>
		</table>

		<a href="${pageContext.request.contextPath }/writepage/updateform.jsp?num=<%=dto.getNum() %>&url=<%=url%>&kinds=<%=kinds%>"><button class="btn btn-primary">수정</button></a>
		<a href="javascript:deleteConfirm(<%=dto.getNum()%>) "><button class="btn btn-danger">삭제</button></a>
	</div>

</body>
<script>
	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath }/writepage/delete.jsp?num="+num+"&url=<%=url%>";
		}
	}
</script>
</div>
  <jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
  </jsp:include>
</html>