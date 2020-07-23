<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>이미지 게시판</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<link rel="stylesheet" href="<%=cp %>/imageTest/css/style.css" type="text/css" />

<link rel="stylesheet" href="<%=cp %>/imageTest/css/list.css" type="text/css" />

</head>

<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="lol" name="thisPage"/>
	</jsp:include>

<br/><br/>

<table width="600" align="center" style="font-family: 돋움; font-size: 10pt;" cellspacing="2" cellpadding="1" >

<tr id="bbsList">

	<td id="bbsList_title" colspan="3">

	이미지 게시판

	</td>

</tr>

<tr>

	<td align="left" colspan="2" width="400">

	Total ${totalArticle } articles, ${totalPage } pages / Now Page is ${currentPage }

	</td>

	<td align="right" colspan="1" width="200">

	<input type="button" value="게시물등록" onclick="javascript:location='<%=cp%>/image/write.do';"/>

	</td>

</tr>

<tr><td style="border-bottom:2px solid #DBDBDB;" colspan="3"></td></tr>

<%

	int newLine = 0;

	int articleCount=0;

	int cnt = 0;

%>

	<c:forEach var="dto" items="${lists }">

<%

	if(newLine==0){

		out.print("<tr>");

	}

	newLine++;

	articleCount++;

%>

	<td align="center" width="190">

		<input type="hidden" value="${dto.num }" name="num" />

		<a href="${imagePath }/${dto.saveFileName }">

			<img alt="" src="${imagePath }/${dto.saveFileName }" width="190" height="190"><br>

			${dto.subject }

		</a>

		<a href="${deletePath}?num=${dto.num }&pageNum=${pageNum }">삭제</a>

	</td>

<%

	if(newLine==3){	

		out.print("</tr>");

		newLine = 0;

	}

%>

	</c:forEach>

<%

	while(newLine>0&&newLine<3){

		out.print("<td width='180'></td>");

		newLine++;

	}

	out.print("</tr>");

%>

<tr><td style="border-bottom:2px solid #DBDBDB;" colspan="3"></td></tr>	

<tr>

	<td align="center" colspan="3">

	<c:if test="${dataCount!=0 }">

		${pageIndexList }

	</c:if>

	<c:if test="${dataCount==0 }">

		등록된 파일이 없습니다

	</c:if>

	</td>

</tr>

</table>

</body>

</html>