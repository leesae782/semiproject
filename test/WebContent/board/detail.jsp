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
   <%if(dto.getPrevNum() != 0){ %>
 	
     	<a class="btn btn-outline-info" href="${pageContext.request.contextPath }/board/detail.jsp?num=<%=dto.getPrevNum()%>&kinds=<%=kinds %>&url=<%=url%>&allpage=<%=allpage%>">
     
         <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-up" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
           <path fill-rule="evenodd" d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>
         </svg>이전글</a>
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
		
      <a href="${pageContext.request.contextPath }/writepage/updateform.jsp?num=<%=dto.getNum() %>&kinds=<%=kinds %>&url=<%=url%>"><button class="btn btn-primary">수정</button></a>
      <a href="javascript:deleteConfirm(<%=dto.getNum()%>) "><button class="btn btn-danger">삭제</button></a>
   
   
  	<form action="writecomment.jsp" method = "post" id="myForm">
  	<div class="form-group">
    <label for="comment">댓글</label>
    <textarea class="form-control" name = "comment" id="comment" rows="3"></textarea>
  	</div>
  	<button class="btn btn-success" id ="writecomment" >글쓰기</button>
  	<button class="btn btn-danger"type = "reset">취소</button>
  	</form>
   
   </div>

</body>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
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
   
   $("#myForm").on("submit",function(){
	   
	 //입력한 아이디를 읽어온다.
		var comment=$("#comment").val();
	 
		var query=$(this).serialize();
		//ajax 를 이용해서 서버에 보낸후 결과를 응답 받는다.
		console.log(query);
		$.ajax({
			method:"post",
			url:"writecomment.jsp",
			data:query,
			success:function(data){
				//data => {isExist:true} or {isExist:false} 인 object 이다.
				console.log(data);
				
			}
		});
		//form 안에 있는 일반 버튼을 눌러도 폼이 전송 되기 때문에 폼 전송을 막아준다.
		return false;
   })
  
</script>

  <jsp:include page="/include/footer.jsp">
   <jsp:param value="index" name="thisPage"/>
  </jsp:include>
</html>
