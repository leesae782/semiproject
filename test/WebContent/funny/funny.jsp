<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="test.dao.BulletinDao"%>
<%@page import="test.dto.BulletinDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String url= request.getRequestURI();  // 현재 url 을  저장함
//로그인 된 아이디 읽어오기 (로그인을 하지 않으면 null 이다)
String id=(String)session.getAttribute("id");
String kinds = "funny";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/funny/funny.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/make.css" />
<style>
	.page-display a{
		text-decoration: none;	
		color:#000;
	}
	.page-display ul li{
		float:left;	/* 가로로 쌓이게 */
		list-style-type:none; /* disc 사라지게*/
		margin-right:10px;}	/*오른쪽 마진*/
		
	.page-display ul li.active{/* li 요소 이면서 active 클래스를 가지고 있는 요소*/
		text-decoration: underline;
		font-weight: bold;
	}
	.psge-display ul li.active a{
		color:red;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body>
<%
//한 페이지에 나타낼 row 의 갯수
final int PAGE_ROW_COUNT=5;
//하단 디스플레이 페이지 갯수
final int PAGE_DISPLAY_COUNT=5;
//보여줄 페이지의 번호
int pageNum=1;
//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
String strPageNum=request.getParameter("pageNum");
if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
	//페이지 번호를 설정한다.
	pageNum=Integer.parseInt(strPageNum);
}
//보여줄 페이지 데이터의 시작 ResultSet row 번호
int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
//보여줄 페이지 데이터의 끝 ResultSet row 번호
int endRowNum=pageNum*PAGE_ROW_COUNT;
/*
	검색 키워드에 관련된 처리 
*/
String keyword=request.getParameter("keyword");
if(keyword==null){//전달된 키워드가 없다면 
	keyword=""; //빈 문자열을 넣어준다. 
}
//인코딩된 키워드를 미리 만들어 둔다. 
String encodedK=URLEncoder.encode(keyword);
String condition=request.getParameter("condition");
//검색 키워드와 startRowNum, endRowNum 을 담을 bulletin_dto 객체 생성
BulletinDto dto=new BulletinDto();
dto.setStartRowNum(startRowNum);
dto.setEndRowNum(endRowNum);
dto.setKinds(kinds);
//select 된 결과를 담을 List
List<BulletinDto> list=null;
//전체 row 의 갯수를 담을 변수 
int totalRow=0; 
if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
	if(condition.equals("title_name")){
		//검색 키워드를 bulletin_dto 객체의 필드에 담는다. 
		dto.setTitle(keyword);
		dto.setName(keyword);
		//검색 키워드에 맞는 파일 목록 중에서 pageNum 에 해당하는 목록 얻어오기
		list=BulletinDao.getInstance().getListTF(dto);
		//검색 키워드에 맞는 전체 글의 갯수를 얻어온다. 
		totalRow=BulletinDao.getInstance().getCountTF(dto);
	}else if(condition.equals("title")){
		dto.setTitle(keyword);
		list=BulletinDao.getInstance().getListT(dto);
		totalRow=BulletinDao.getInstance().getCountT(dto);
	}else if(condition.equals("name")){
		dto.setName(keyword);
		list=BulletinDao.getInstance().getListW(dto);
		totalRow=BulletinDao.getInstance().getCountW(dto);
	}
}else{//검색 키워드가 없으면 전체 목록을 얻어온다.
	condition="";
	keyword="";
	list=BulletinDao.getInstance().getList(dto);
	totalRow=BulletinDao.getInstance().getCount();
	
	
}	
//전체 페이지의 갯수 구하기
int totalPageCount=
		(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
//시작 페이지 번호
int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
//끝 페이지 번호
int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
//끝 페이지 번호가 잘못된 값이라면 
if(totalPageCount < endPageNum){
	endPageNum=totalPageCount; //보정해준다. 
}
%>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="funny" name="thisPage"/>
	</jsp:include>
<div class="container">
	<div class="row">
   		<div class="col-sm-9" style="margin-top:15px;">
   			<h3>게시판 이용 안내</h3>
   			<p style="padding:20px;">어쩌구 저쩌구<br />
	   			<ul>
	   				<li>1. 욕설및 비방 금지</li>
	   				<li>2. 도배행위 금</li>
	   			</ul>	   			
   			</p>
   		</div>
		
   		<div class="col-sm-3" style="margin-top:15px;">
			<jsp:include page="../include/loginstatus.jsp">
				<jsp:param value="<%=url%>" name="url"/>
			</jsp:include>
   		</div>
   		
   		
	</div>
	<div class="col-sm-9">
		<div>전체0건 / 1페이지</div>
			<table class="table table-bordered table-hover" style="text-align:center;" >
				<thead class="thead-light" >
					<tr >
				    	<th width="6%">번호</th>
				      	<th width="9%">닉네임</th>
					    <th width="57%">제목</th>
					    <th width="14%">날짜</th>
					    <th width="7%">조회</th>
			    	</tr>
				</thead>
				<tbody style="font-size:0.8em;">
			    <%
			    	for(BulletinDto tmp: list){
			    %>
			    <tr>
			      <th><%=tmp.getNum() %></th>
			      <td><%=tmp.getName() %></td>
			      <td><a href="${pageContext.request.contextPath }/board/detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></td>
			      <td><%=tmp.getRegdate() %></td>
			      <td>조회수</td>
			    </tr>
			    <%} %>
			  </tbody>
			  
			</table>
			<button style="float:right;"><a href="${pageContext.request.contextPath }/writepage/insertform.jsp">글쓰기</a></button>
			<div class="page-display">
				<ul>
				<%if(startPageNum != 1){ %>
					<li><a href="funny.jsp?pageNum=<%=startPageNum-1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">Prev</a></li>
				<%} %>
				<%for(int i=startPageNum; i<=endPageNum; i++){ %>
					<%if(i==pageNum){ %>
						<li class="active"><a href="funny.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a></li>
					<%}else{%>
						<li><a href="funny.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a></li>
					<%} %>
				<%} %>	
				<%if(endPageNum < totalPageCount){ %>
					<li><a href="funny.jsp?pageNum=<%=endPageNum+1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">Next</a></li>
				<%} %>
				</ul>
			</div>
	</div>	
	<hr style="clear:left;"/>
	<form action="funny.jsp" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title_name" <%if(condition.equals("title_filename")){ %>selected<%} %>>제목+닉네임</option>
			<option value="title" <%if(condition.equals("title")){ %>selected<%} %>>제목</option>
			<option value="name" <%if(condition.equals("name")){ %>selected<%} %>>닉네임</option>
		</select>
		<input value="<%=keyword %>" type="text" name="keyword" placeholder="검색어..."/>
		<button type="submit">검색</button>
	</form>
</div>
</body>
</html>