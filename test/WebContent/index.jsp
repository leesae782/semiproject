<%@page import="java.util.ArrayList"%>
<%@page import="test.dao.BulletinDao"%>
<%@page import="test.dto.BulletinDto"%>
<%@page import="java.util.List"%>
<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getData(id);
	List<BulletinDto> list=BulletinDao.getInstance().getLine2();
	List<BulletinDto> lookuplist=BulletinDao.getInstance().getLine3();
	List<BulletinDto> funnylist=BulletinDao.getInstance().getLine("funny");
	List<BulletinDto> issuelist=BulletinDao.getInstance().getLine("issue");
	List<BulletinDto> inforlist=BulletinDao.getInstance().getLine("infor");
	List<BulletinDto> soccerlist=BulletinDao.getInstance().getLine("soccer");
	List<BulletinDto> baseballlist=BulletinDao.getInstance().getLine("baseball");
	List<BulletinDto> basketballlist=BulletinDao.getInstance().getLine("basketball");
	List<BulletinDto> lollist=BulletinDao.getInstance().getLine("lol");
	List<BulletinDto> baglist=BulletinDao.getInstance().getLine("bag");
	List<BulletinDto> fifalist=BulletinDao.getInstance().getLine("fifa");
	List<BulletinDto> freelist=BulletinDao.getInstance().getLine("free");
	List<BulletinDto> questionlist=BulletinDao.getInstance().getLine("question");

	
	String url= request.getRequestURI() ; // 현재 url 을  저장함
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/make.css" />
</head>

<body>



<jsp:include page="include/navbar.jsp">
	<jsp:param value="index" name="thisPage"/>
</jsp:include>




 

<div class="container">
	<!--  콘테이너안에  div 9-3 으로 나눈 양식 입니다. 들여쓰기 해주세요
		
		
		
		<div class="row">
    		<div class="col-sm-9">
    		  	값 넣기
    		</div>
			
    		<div class="col-sm-3">
 				값 넣기
    		</div>
  		</div>	
	  -->
	
	<div class="row">
    		<div class="col-sm-9">
    		  	<div class="row">
   					 <div class="col-sm">
    					  <div class="card" >
 						 	<div class="card-header">
  								 <span style="color:red;"><strong >최신</strong></span> 게시글 순위
 			 				</div>
 							<ul class="list-group">
							 	<% try {%>
							 	<%for(int i=0; i<list.size(); i++) {
							 		BulletinDto tmp = list.get(i);
							 		%>
							 		<%if(i < 9) { %>
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>&allpage=all"><%=tmp.getTitle() %></a>
									<div>
									<span class="badge badge-primary badge-pill">15</span>
									<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
									</div>
									
								</li>
									<%} %>	
								<%} %>
								<%} catch(Exception e){ %>
								<% } %>
							</ul>
						</div>
    				</div>
    				<div class="col-sm">
    					  <div class="card" >
 						 	<div class="card-header">
  								 <span style="color:red;"><string >HOT</string></span> 게시글 순위
 			 				</div>
 							<ul class="list-group">
  								<% try {%>
							 	<%for(int i=0; i<lookuplist.size(); i++) {
							 		BulletinDto tmp = lookuplist.get(i);
							 		%>
							 		<%if(i < 9) { %>
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>&allpage=lookup"><%=tmp.getTitle() %></a>
									<div>
									<span class="badge badge-primary badge-pill">15</span>
									<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
									</div>
									
								</li>
									<%} %>	
								<%} %>
								<%} catch(Exception e){ %>
								<% } %>
								</ul>
						</div>
   				 	</div>
 				 </div>
 				 
 				 
              <nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-funny-tab" data-toggle="tab" href="#nav-funny" role="tab" aria-controls="nav-funny" aria-selected="true">축구</a>
    <a class="nav-item nav-link" id="nav-baseball-tab" data-toggle="tab" href="#nav-baseball" role="tab" aria-controls="nav-baseball" aria-selected="false">야구</a>
    <a class="nav-item nav-link" id="nav-basketball-tab" data-toggle="tab" href="#nav-basketball" role="tab" aria-controls="nav-basketball" aria-selected="false">농구</a>
    <a class="nav-item nav-link" id="nav-lol-tab" data-toggle="tab" href="#nav-lol" role="tab" aria-controls="nav-lol" aria-selected="false">LOL</a>
    <a class="nav-item nav-link" id="nav-bag-tab" data-toggle="tab" href="#nav-bag" role="tab" aria-controls="nav-bag" aria-selected="false">배틀그라운드</a>
    <a class="nav-item nav-link" id="nav-fifa-tab" data-toggle="tab" href="#nav-fifa" role="tab" aria-controls="nav-fifa" aria-selected="false">FIFA ONLINE</a>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-funny" role="tabpanel" aria-labelledby="nav-funny-tab">
    <div class="row">
       <div class="col-4">
          <div class="card" id = "card1-img">
              <img src="${pageContext.request.contextPath}/images/colon.png" class="card-img-top" alt="무슨파일인지설명">
              <ul class="list-group">
                 <li class="list-group-item d-flex justify-content-between align-items-center">
                   <%try{ %>
                   <a class="f-color" href="/test/board/detail.jsp?num=<%=soccerlist.get(0).getNum() %>&url=<%=url%>&kinds=<%=soccerlist.get(0).getKinds()%>"><%=soccerlist.get(0).getTitle() %></a>
                    
                      <div>
						<span class="badge badge-primary badge-pill">15</span>
						<span class="badge badge-danger badge-pill"><%=soccerlist.get(0).getLookup() %></span>
					</div>
                   <%}catch(Exception e){} %>    
                      
                 </li>
              </ul>
         </div>
       </div>
       <div class="col-8">
 				<div class="card" id ="card1" >
                      <ul class="list-group">
                      <%try { %>
                          <%for(int i=1; i<soccerlist.size(); i++) {
                         BulletinDto tmp = soccerlist.get(i);
                         %>
                         <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                        <%} %>   
                        <%} %>   
                        <%} catch(Exception e){} %>
                     </ul>
                 </div>
       </div>
     </div>   
                       
  </div>
  <div class="tab-pane fade" id="nav-baseball" role="tabpanel" aria-labelledby="nav-baseball-tab">
  <div class="row">
       <div class="col-4">
          <div class="card" id = "card1-img">
              <img src="${pageContext.request.contextPath}/images/colon.png" class="card-img-top" alt="무슨파일인지설명">
              <ul class="list-group">
                 <li class="list-group-item d-flex justify-content-between align-items-center">
                   <%try{ %>
                   <a class="f-color" href="/test/board/detail.jsp?num=<%=baseballlist.get(0).getNum() %>&url=<%=url%>&kinds=<%=baseballlist.get(0).getKinds()%>"><%=baseballlist.get(0).getTitle() %></a>
                     
                      <div>
						<span class="badge badge-primary badge-pill">15</span>
						<span class="badge badge-danger badge-pill"><%=baseballlist.get(0).getLookup() %></span>
					</div>
					<%}catch(Exception e){} %>
                 </li>
              </ul>
         </div>
       </div>
       <div class="col-8">
  <div class="card"id ="card2" >
                      <ul class="list-group">
                      <%try{ %>
                          <%for(int i=1; i<baseballlist.size(); i++) {
                         BulletinDto tmp = baseballlist.get(i);
                         %>
                         <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                        <%} %>   
                        <%} %>   
                        <%} catch(Exception e){}%>
                     </ul>
                  </div>
            </div>
      </div>   
  </div>
  <div class="tab-pane fade" id="nav-basketball" role="tabpanel" aria-labelledby="nav-basketball-tab">
  <div class="row">
       <div class="col-4">
          <div class="card" id = "card1-img">
              <img src="${pageContext.request.contextPath}/images/colon.png" class="card-img-top" alt="무슨파일인지설명">
              <ul class="list-group">
                 <li class="list-group-item d-flex justify-content-between align-items-center">
                   <%try{ %>
                   <a class="f-color" href="/test/board/detail.jsp?num=<%=basketballlist.get(0).getNum() %>&url=<%=url%>&kinds=<%=basketballlist.get(0).getKinds()%>"><%=basketballlist.get(0).getTitle() %></a>
                     
                      <div>
						<span class="badge badge-primary badge-pill">15</span>
						<span class="badge badge-danger badge-pill"><%=basketballlist.get(0).getLookup() %></span>
					</div>
					<%}catch(Exception e){} %>
                 </li>
              </ul>
         </div>
       </div>
       <div class="col-8">
  <div class="card" id ="card3" >
                      <ul class="list-group">
                      <%try { %>
                          <%for(int i=1; i<basketballlist.size(); i++) {
                         BulletinDto tmp = basketballlist.get(i);
                         %>
                         <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                        <%} %>   
                        <%} %>      
                        <%} catch(Exception e){} %>
                     </ul>
                  </div>
            </div>
      </div>         
  </div>
  <div class="tab-pane fade" id="nav-lol" role="tabpanel" aria-labelledby="nav-lol-tab">
  <div class="row">
       <div class="col-4">
          <div class="card" id = "card1-img">
              <img src="${pageContext.request.contextPath}/images/colon.png" class="card-img-top" alt="무슨파일인지설명">
              <ul class="list-group">
                 <li class="list-group-item d-flex justify-content-between align-items-center">
                   <%try{ %>
                   <a class="f-color" href="/test/board/detail.jsp?num=<%=lollist.get(0).getNum() %>&url=<%=url%>&kinds=<%=lollist.get(0).getKinds()%>"><%=lollist.get(0).getTitle() %></a>
                     
                      <div>
						<span class="badge badge-primary badge-pill">15</span>
						<span class="badge badge-danger badge-pill"><%=lollist.get(0).getLookup() %></span>
					</div>
					<%}catch(Exception e){} %>
                 </li>
              </ul>
         </div>
       </div>
       <div class="col-8">
  <div class="card" id ="card3" >             
                      <ul class="list-group">
                      <%try{ %>
                          <%for(int i=1; i<lollist.size(); i++) {
                         BulletinDto tmp = lollist.get(i);
                         %>
                         <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                        <%} %>   
                        <%} %>      
                        <%} catch(Exception e){} %>
                     </ul>
                  </div>
            </div>
      </div>         
  </div>
  <div class="tab-pane fade" id="nav-bag" role="tabpanel" aria-labelledby="nav-bag-tab">
  <div class="row">
       <div class="col-4">
          <div class="card" id = "card1-img">
              <img src="${pageContext.request.contextPath}/images/colon.png" class="card-img-top" alt="무슨파일인지설명">
              <ul class="list-group">
                 <li class="list-group-item d-flex justify-content-between align-items-center">
                   <%try{ %>
                   <a class="f-color" href="/test/board/detail.jsp?num=<%=baglist.get(0).getNum() %>&url=<%=url%>&kinds=<%=baglist.get(0).getKinds()%>"><%=baglist.get(0).getTitle() %></a>
                     
                      <div>
						<span class="badge badge-primary badge-pill">15</span>
						<span class="badge badge-danger badge-pill"><%=baglist.get(0).getLookup() %></span>
					</div>
					<%}catch(Exception e){} %>
                 </li>
              </ul>
         </div>
       </div>
       <div class="col-8">
  <div class="card" id ="card3" >             
                      <ul class="list-group">
                      <%try{ %>
                          <%for(int i=1; i<baglist.size(); i++) {
                         BulletinDto tmp = baglist.get(i);
                         %>
                         <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                        <%} %>   
                        <%} %>      
                        <%} catch(Exception e){} %>
                     </ul>
                  </div>
            </div>
      </div>         
  </div>
  <div class="tab-pane fade" id="nav-fifa" role="tabpanel" aria-labelledby="nav-fifa-tab">
  <div class="row">
       <div class="col-4">
          <div class="card" id = "card1-img">
              <img src="${pageContext.request.contextPath}/images/colon.png" class="card-img-top" alt="무슨파일인지설명">
              <ul class="list-group">
                 <li class="list-group-item d-flex justify-content-between align-items-center">
                   <%try{ %>
                   <a class="f-color" href="/test/board/detail.jsp?num=<%=fifalist.get(0).getNum() %>&url=<%=url%>&kinds=<%=fifalist.get(0).getKinds()%>"><%=fifalist.get(0).getTitle() %></a>
                     
                      <div>
						<span class="badge badge-primary badge-pill">15</span>
						<span class="badge badge-danger badge-pill"><%=fifalist.get(0).getLookup() %></span>
					</div>
					<%}catch(Exception e){} %>
                 </li>
              </ul>
         </div>
       </div>
       <div class="col-8">
  <div class="card" id ="card3" >             
                      <ul class="list-group">
                      <%try{ %>
                          <%for(int i=1; i<fifalist.size(); i++) {
                         BulletinDto tmp = fifalist.get(i);
                         %>
                         <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                        <%} %>   
                        <%} %>      
                        <%} catch(Exception e){} %>
                     </ul>
                  </div>
            </div>
      </div>         
  </div>
</div>
              <div class="row">
             <div class="col-sm">
                <div class="card" >
                       <div class="card-header">
                           <span style="color:red;"><strong >유머</strong></span> 게시판
                       </div>
                      <ul class="list-group">
                      <%try{ %>
                         <%for(int i=0; i<funnylist.size(); i++) {
                            BulletinDto tmp = funnylist.get(i);
                            %>
                            <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                           <%} %>   
                        <%} %>
                        <%} catch(Exception e){} %>
                     </ul>
                  </div>
             
             </div>
             <div class="col-sm">
                <div class="card" >
                       <div class="card-header">
                           <span style="color:red;"><string >이슈</string></span> 게시판
                       </div>
                      <ul class="list-group">
                      <%try{ %>
                          <%for(int i=0; i<issuelist.size(); i++) {
                         BulletinDto tmp = issuelist.get(i);
                         %>
                         <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                        <%} %>   
                        <%} %>
                        <%} catch(Exception e){} %>
                     </ul>
                  </div>
          
             </div>
                <div class="col-sm">
                <div class="card" >
                       <div class="card-header">

                          <span style="color:red;"><string >정보</string></span> 게시판
                       </div>
                      <ul class="list-group">
                      <%try{ %>
                          <%for(int i=0; i<inforlist.size(); i++) {
                         BulletinDto tmp = inforlist.get(i);
                         %>
                         <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                        <%} %>   
                        <%} %>   
                        <%} catch(Exception e){} %>
                     </ul>
                  </div>
                  
               
             
             </div>
             
           </div> 
            <div class="row">
             <div class="col-sm">
                <div class="card" >
                       <div class="card-header">
                           <span style="color:red;"><strong >자유</strong></span> 게시판
                       </div>
                      <ul class="list-group">
                      <%try { %>
                         <%for(int i=0; i<freelist.size(); i++) {
                            BulletinDto tmp = freelist.get(i);
                            %>
                            <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                           <%} %>   
                        <%} %>
                        <%}catch(Exception e){} %>
                     </ul>
                  </div>
             
             </div>
             <div class="col-sm">
                <div class="card" >
                       <div class="card-header">
                           <span style="color:red;"><string >Q&A</string></span> 게시판
                       </div>
                      <ul class="list-group">
                      <%try{ %>
                          <%for(int i=0; i<questionlist.size(); i++) {
                         BulletinDto tmp = questionlist.get(i);
                         %>
                         <%if(i < 9) { %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                           <a class="f-color" href="/test/board/detail.jsp?num=<%=tmp.getNum() %>&url=<%=url%>&kinds=<%=tmp.getKinds()%>"><%=tmp.getTitle() %></a>
                           <div>
							<span class="badge badge-primary badge-pill">15</span>
							<span class="badge badge-danger badge-pill"><%=tmp.getLookup() %></span>
							</div>
                        </li>
                        <%} %>   
                        <%} %>
                        <%}catch(Exception e){} %>
                     </ul>
                  </div>
          
             </div>
             </div>
           

      </div>
       <div class="col-sm-3">
       
       
         
         
         <!-- 
         <div class="login-box well" >
                <form accept-charset="UTF-8" role="form" method="post" action="member/login.jsp">
                    <legend>로그인</legend>
                    <div class="input-group"  style="margin-bottom: 1em;"">
                        <span class="input-group-addon" ><i class="fa fa-user"></i></span>
                        <input type="text" name ="id"id="id" value='' placeholder="ID를 입력하세요" class="form-control" />
                    </div>
                    <div class="input-group" style="margin-bottom: 1em;">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" name ="pwd"id="pwd" value='' placeholder="비밀번호를 입력하세요" class="form-control" />
                    </div>
                    <button type="submit"  class="btn btn-default btn-block bg-light" style="margin-bottom: 1em;"/>로그인</button>
                    
                </form>
                  
                  <form action="member/signup_form.jsp" method ="post">
                     <button type="submit"  class="btn btn-default btn-block bg-light" style="margin-bottom: 1em;"/>회원가입</button>
                  </form>     
                </div>
          -->
       <!-- 로그인 폼 시작 -->
 

             <jsp:include page="include/loginstatus.jsp"> 
                <jsp:param value="<%=url %>" name="url"/>
             </jsp:include>
             
            </div>
            
      
        
          </div>
     </div>

     
<jsp:include page="/include/footer.jsp">   
   <jsp:param value="index" name="thisPage"/>
</jsp:include>
   

<!--  기존 로그인 폼
<div class="login-box well" >
                <form accept-charset="UTF-8" role="form" method="post" action="member/login.jsp">
                    <legend>로그인</legend>
                    <div class="input-group"  style="margin-bottom: 1em;"">
                        <span class="input-group-addon" ><i class="fa fa-user"></i></span>
                        <input type="text" name ="id"id="id" value='' placeholder="ID를 입력하세요" class="form-control" />
                    </div>
                    <div class="input-group" style="margin-bottom: 1em;">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <input type="password" name ="pwd"id="pwd" value='' placeholder="비밀번호를 입력하세요" class="form-control" />
                    </div>
                    <button type="submit"  class="btn btn-default btn-block bg-light" style="margin-bottom: 1em;"/>로그인</button>
                    
                </form>
                  
                  <form action="member/signup_form.jsp" method ="post">
                     <button type="submit"  class="btn btn-default btn-block bg-light" style="margin-bottom: 1em;"/>회원가입</button>
                  </form>     
                </div>
<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★</-> -->


</body>
</html>