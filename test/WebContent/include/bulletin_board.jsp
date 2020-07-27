<%@page import="test.dao.BulletinDao"%>
<%@page import="java.util.List"%>
<%@page import="test.dto.BulletinDto"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String kinds = request.getParameter("kinds");
String titlekinds = request.getParameter("titlekinds");
String url= request.getRequestURI();
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
String keyword=request.getParameter("keyword"); //검색 키워드
String condition=request.getParameter("condition"); //검색 조건
if(keyword==null){//전달된 키워드가 없다면 
	keyword=""; //빈 문자열을 넣어준다. 
	condition="";
}
//인코딩된 키워드를 미리 만들어 둔다. 
String encodedK=URLEncoder.encode(keyword);

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
		//검색 키워드를 FileDto 객체의 필드에 담는다. 
		dto.setTitle(keyword);
		dto.setContent(keyword);
		//검색 키워드에 맞는 파일 목록 중에서 pageNum 에 해당하는 목록 얻어오기
		list=BulletinDao.getInstance().getListTF(dto);
		//검색 키워드에 맞는 전체 글의 갯수를 얻어온다. 
		totalRow=BulletinDao.getInstance().getCountTF(dto);
	}else if(condition.equals("title")){
		dto.setTitle(keyword);
		list=BulletinDao.getInstance().getListT(dto);
		totalRow=BulletinDao.getInstance().getCountT(dto);
	}else if(condition.equals("name1")){
		dto.setName(keyword);
		list=BulletinDao.getInstance().getListW(dto);
		totalRow=BulletinDao.getInstance().getCountW(dto);
	}
}else{//검색 키워드가 없으면 전체 목록을 얻어온다.
	list=BulletinDao.getInstance().getList(dto);

	totalRow=BulletinDao.getInstance().getCount(kinds);
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

<div class="container">
	<div class="row">
   		<div class="col-sm-9" style="margin-top:15px;">   		
   			<h3 style="margin-bottom : 50px;"><%=titlekinds %> 게시판 이용 안내</h3>
   			<table class="table table-bordered table-hover" style="text-align:center;" >
				<thead class="thead dkssud" >
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
			      <td><a class ="acolor" href="${pageContext.request.contextPath }/board/detail.jsp?num=<%=tmp.getNum()%>&url=<%=url%>&kinds=<%=kinds%>"><%=tmp.getTitle() %></td>
			      <td><%=tmp.getRegdate() %></td>
			      <td><%=tmp.getLookup()%></td>
			    </tr>
			    <%} %>
			  </tbody>
			  
			</table>

			<button style="float:right;"><a href="${pageContext.request.contextPath }/writepage/insertform.jsp?url=<%=url%>&kinds=<%=kinds%>">글쓰기</a></button>

			
			
			<div class="page-display">
				<ul>
				<%if(startPageNum != 1){ %>
					<li><a href="<%=kinds %>.jsp?pageNum=<%=startPageNum-1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">Prev</a></li>
				<%} %>
				<%for(int i=startPageNum; i<=endPageNum; i++){ %>
					<%if(i==pageNum){ %>
						<li class="active"><a href="<%=kinds %>.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a></li>
					<%}else{%>
						<li><a href="<%=kinds %>.jsp?pageNum=<%=i %>&condition=<%=condition %>&keyword=<%=encodedK %>"><%=i %></a></li>
					<%} %>
				<%} %>	
				<%if(endPageNum < totalPageCount){ %>
					<li><a href="<%=kinds %>.jsp?pageNum=<%=endPageNum+1 %>&condition=<%=condition %>&keyword=<%=encodedK %>">Next</a></li>
				<%} %>
				</ul>
			</div>
			<br />
				<hr style="clear:left;"/>
			<form action="<%=kinds %>.jsp" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title_name" <%if(condition.equals("title_name")){ %>selected<%} %>>제목+내용</option>
			<option value="title" <%if(condition.equals("title")){ %>selected<%} %>>제목</option>
			<option value="name1" <%if(condition.equals("name1")){ %>selected<%} %>>닉네임</option>
		</select>
		<input value="<%=keyword %>" type="text" name="keyword" placeholder="검색어..."/>
		<button type="submit">검색</button>
	</form>
   		</div>
		
   		<div class="col-sm-3" style="margin-top:15px;">
			<jsp:include page="../include/loginstatus.jsp">
				<jsp:param value="<%=url%>" name="url"/>
			</jsp:include>
   		</div>
   		
   		
	</div>
	

	
</div>