<%@page import="java.util.List"%>
<%@page import="test.dao.bulletin_dao"%>
<%@page import="test.dto.bulletin_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=bulletin_dao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//끝 페이지 번호가 잘못된 값이라면 
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; //보정해준다. 
	}
	//startRowNum 과 endRowNum을 FileDto 객체에 담고 
	bulletin_dto dto=new bulletin_dto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//FileDto 객체를 인자로 전달해서 파일 목록을 얻어온다. 
	List<bulletin_dto> list = bulletin_dao.getInstance().getList(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/funny/funny.jsp</title>
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
   				<li>1. 욕설및 비방 금지</li>
   				<li>2. 도배행위 금</li>
   			</p>
   		</div>
		
   		<div class="col-sm-3" style="margin-top:15px;">
			<div class="login-box well" >
                <form accept-charset="UTF-8" role="form" method="post" action="">
                    <legend>로그인</legend>
                    <div class="input-group"  style="margin-bottom: 1em;"">
                        <span class="input-group-addon" ><i class="fa fa-user"></i></span>
                        <input type="text" id="userid" value='' placeholder="ID를 입력하세요" class="form-control" />
                    </div>
                    <div class="input-group" style="margin-bottom: 1em;">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" id="password" value='' placeholder="비밀번호를 입력하세요" class="form-control" />
                    </div>
                    <button type="submit" id="login-submit" class="btn btn-default btn-block bg-light" style="margin-bottom: 1em;"/>로그인</button>
                    <div class="form-group">
                        <a href="registerForm.php" class="btn btn-default btn-block bg-light"> 회원가입</a>
                        <span class='text-center'><a href="" class="text-sm">비밀번호 찾기</a></span>
                    </div>
                </form>
            </div>
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
				<div class="page-display">
					<ul>
			<%if(startPageNum != 1){ %>
				<li><a href="funny.jsp?pageNum=<%=startPageNum-1 %>">Prev</a></li>
			<%} %>
			<%for(int i = startPageNum; i<=endPageNum; i++){ %>
				<%if(i==pageNum){ %>
					<li class="active"><a href="funny.jsp?pageNum=<%=i%>"><%=i %></a></li>
				<%}else{ %>
					<li><a href="funny.jsp?pageNum=<%=i%>"><%=i %></a></li>
				<%} %>
			<%} %>
			<%if(endPageNum < totalPageCount){ %>
				<li><a href="funny.jsp?pageNum=<%=endPageNum+1 %>">Next</a></li>
			<%} %>
		</ul>
				</div>
	</div>	
</div>
</body>
</html>