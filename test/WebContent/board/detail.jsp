
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
 	BulletinDao.getInstance().addViewCount(num);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/detail.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font.css" />
</head>	
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="funny" name="thisPage"/>
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

		<a href="${pageContext.request.contextPath }/writepage/updateform.jsp?num=<%=dto.getNum() %>"><button class="btn btn-primary">수정</button></a>
		<a href="javascript:deleteConfirm(<%=dto.getNum()%>)"><button class="btn btn-danger">삭제</button></a>
	</div>

</body>
<script>
	function deleteConfirm(num){
		var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath }/writepage/delete.jsp?num="+num;
		}
	}
</script>
</div>
  <jsp:include page="/include/footer.jsp">
	<jsp:param value="index" name="thisPage"/>
  </jsp:include>
</html>