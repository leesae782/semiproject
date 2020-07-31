<%@page import="java.util.List"%>
<%@page import="test.commentdto.CommentDto"%>
<%@page import="test.commentdao.CommentDao"%>
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
    String allpage = request.getParameter("allpage");
    
    BulletinDao dao2 = BulletinDao.getInstance();
    BulletinDto dto2 = dao2.bulletin_getData2(num);
    String kinds= dto2.getKinds();
         
    String id  =(String)session.getAttribute("id");
    MemberDao dao = MemberDao.getInstance();
    String name =null;
   if(id!= null){
    MemberDto dto3  =dao.getData(id);
    name =dto3.getNick();
   }

    BulletinDto dto = null ;
    if(allpage==null){
    	allpage = "other";
    }
    if(allpage.equals("all")){
    	dto=BulletinDao.getInstance().bulletin_getData2(num);
    }else if (allpage.equals("lookup")){
    	dto=BulletinDao.getInstance().bulletin_getData3(num);
    }else {
    	dto=BulletinDao.getInstance().bulletin_getData(kinds,num);
    }
    String url = request.getParameter("url");
	BulletinDao.getInstance().addViewCount(num);
	String nick ="";
	try{
     nick = (String)MemberDao.getInstance().getData(id).getNick();
	}catch (Exception e){}
	String name2 = (String)BulletinDao.getInstance().bulletin_getData(kinds, num).getName();



	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=10;
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



	//전체 row 의 갯수를 담을 변수 
	int totalRow=0; 
	   totalRow=CommentDao.getInstance().getCount(num);
  
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

	

       
	   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/detail.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/make.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</head>   
<body>
   <jsp:include page="../include/navbar.jsp">
      <jsp:param value="<%=kinds %>" name="thisPage"/>
   </jsp:include>
   <div class="container">
   <%if(dto.getPrevNum() != 0){ %>
 	
     	<a class="btn btn-outline-info" href="${pageContext.request.contextPath }/board/detail.jsp?num=<%=dto.getPrevNum()%>&kinds=<%=kinds %>&url=<%=url%>&allpage=<%=allpage%>">
     이전글
         <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-up" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
           <path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
         </svg></a>
   <%} %>
  
   <%if(dto.getNextNum() != 0){ %>
   
     
    	<a class="btn btn-outline-info" href="${pageContext.request.contextPath }/board/detail.jsp?num=<%=dto.getNextNum()%>&kinds=<%=kinds %>&url=<%=url%>&allpage=<%=allpage%>">
 
         다음글
         <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
           <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
         </svg></a>
   <%} %>
   
   <a href="javascript:goBack(<%=dto.getNum() %>)"><button class="btn btn-outline-info">목록 보기</button></a>
      <table class="table">
         <thead class="d-font">
             <tr>
                <th><%=dto.getTitle() %></th>
             </tr>
         </thead>
         <tbody>
            <tr>
               <th>작성자 : <%=dto.getName() %>
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
      
	<%
		try{
			if(name2.equals(nick)||nick.equals("admin")){%>
		      <a href="${pageContext.request.contextPath }/writepage/updateform.jsp?num=<%=dto.getNum() %>&kinds=<%=kinds %>&url=<%=url%>"><button class="btn btn-outline-info">수정</button></a>
		      <a href="javascript:deleteConfirm(<%=num%>) "><button class="btn btn-outline-info">삭제</button></a>
			<%} %>
		<%}catch(Exception e){
			e.printStackTrace();
		}
	%>
   
   
  	
  	
  	<form action="private/writecontent.jsp" method="post" id="myForm">
	  	<input type="hidden" name="num" id="num" 
					value="<%=num%>"/>
		<input type="hidden" name="name" id="name" 
					value="<%=name%>"/>
		<input type="hidden" name="url" id="url" 
					value="<%=url%>"/>
		<input type="hidden" name="kinds" id="kinds" 
					value="<%=kinds%>"/>
		<input type="hidden" name="allpage" id="allpage" 
					value="<%=allpage%>"/>
	  	
	  	
	  	<%if(id!= null) {%>
	  	<div class="form-group">
	    <label for="comment">댓글</label>
	    <textarea class="form-control" name="content" id="content" rows="3" placeholder="로그인후 사용가능합니다."></textarea>
	  	</div>
	  	<button type="submit"   class="btn btn-outline-info" id="writecomment" >글쓰기</button>
	  	<button type="reset" class="btn btn-outline-info" type="reset">취소</button>
	  	<%}else{  String message = "로그인후 이용가능합니다.";%>
	  	<div class="form-group">
	    <label for="comment">댓글</label>
	    <textarea disabled class="form-control" name="content" id="content" rows="3" placeholder="로그인후 사용가능합니다."></textarea>
	  	</div>
	  	<button disabled type="submit"  onclick="alert('<%=message%>')"class="btn btn-outline-info" id="writecomment" >글쓰기</button>
	  	<button disabled type="reset" class="btn btn-outline-info" type="reset">취소</button>
	  	<%} %>
  	</form>
  	
   
<%

	 CommentDto comdto = new CommentDto();
	  comdto.setBoardnum(num);
	  comdto.setStartRowNum(startRowNum);
	  comdto.setEndRowNum(endRowNum);
	  CommentDao comdao = CommentDao.getInstance();
	 List<CommentDto> list = comdao.getList(comdto);
%>
   <br />
   <table class="table">
   <%try { %>
   <%for(CommentDto tmp : list){ %>
   	<tr>
   		
   		<th>닉네임 : <%=tmp.getName() %></th>
   		<td ><%=tmp.getContent() %></td>
   		<td><%=tmp.getRegdate() %></td>
   		<%if(tmp.getName().equals(name)){ %>
   		<td><a href="private/delete.jsp?num=<%=tmp.getNum()%>&name=<%=tmp.getName()%>&url=<%=url%>&kinds=<%=kinds%>&allpage=<%=allpage%>&boardnum=<%=num%>">삭제</a></td>
   		<%} %>
   	</tr>
   
   <%} %>
   <%} catch(Exception e ){} %>
   
   
   </table>
   
   	         <div class="page-display text-align: center;  float: left width: 100%">
	            <div display: inline-block>
	            <ul class="pagination pagination-sm">
	            <%if(startPageNum != 1){ %>
	               <li class="page-item"><a class="page-link" href="detail.jsp?pageNum=<%=startPageNum-1 %>&num=<%=num%>&url=<%=url%>&kinds=<%=kinds%>&allpage=<%=allpage%>">Prev</a></li>
	            <%} %>
	            <%for(int i=startPageNum; i<=endPageNum; i++){ %>
	               <%if(i==pageNum){ %>
	                  <li class="page-item active "><a class="page-link"  href="detail.jsp?pageNum=<%=i %>&num=<%=num%>&url=<%=url%>&kinds=<%=kinds%>&allpage=<%=allpage%>"><%=i %></a></li>
	               <%}else{%>
	                  <li class="page-item"><a class="page-link" href="detail.jsp?pageNum=<%=i %>&num=<%=num%>&url=<%=url%>&kinds=<%=kinds%>&allpage=<%=allpage%>"><%=i %></a></li>
	               <%} %>
	            <%} %>   
	            <%if(endPageNum < totalPageCount){ %>
	               <li class="page-item"><a class="page-link" href="detail.jsp?pageNum=<%=endPageNum+1 %>&num=<%=num%>&url=<%=url%>&kinds=<%=kinds%>&allpage=<%=allpage%>">Next</a></li>
	            <%} %>
	            </ul>
	            </div>
	         </div>
	         
   </div>

</body>
<script>

	function goBack() {
		location.href = "<%=url%>";
	}
   function deleteConfirm(num){
      var isDelete=confirm(num+" 번 글을 삭제 하시겠습니까?");
      if(isDelete){
         location.href="${pageContext.request.contextPath }/writepage/delete.jsp?num="+num+"&url=<%=url%>";
      }
   }
   
  


  
</script>

  <jsp:include page="/include/footer.jsp">
   <jsp:param value="index" name="thisPage"/>
  </jsp:include>
</html>
