<%@page import="java.net.URLEncoder"%>
<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getData(id);
	
	
	String url = request.getParameter("url");
%>    
<%if(id == null){ %>

				<div class="login-div">
   				 <p class="login-p"> VIVELA 를 안전하고 편리하게 이용하세요</p>
   				<a class="login-a"href="${pageContext.request.contextPath}/member/login_form.jsp?url=<%=url%>">VIVELA JSS 로그인</a>
				<a class="login-find"href="${pageContext.request.contextPath }/member/user_search_form.jsp?isSearch=0">아이디 비밀번호 찾기</a>
				<a class="login-find"href="${pageContext.request.contextPath}/member/signup_form.jsp?url=<%=url%>">회원가입</a>
				</div>
				<div class="side_left">
					<a href="${pageContext.request.contextPath }/sport/soccer.jsp"><img src="${pageContext.request.contextPath }/images/Coim-e2VIAA4NNj2.jpg" alt="" /></a>
 					<a href="${pageContext.request.contextPath }/sport/soccer.jsp"><img src="${pageContext.request.contextPath }/images/bo99.jpg" alt="" /></a>
 				</div>
 				
 			<%} else { %>
 			
 				<div class="login-div">
 					<div class="row">
 					<div class="col-4">
 					<img class="text-center" id="profileImage" 
					src="${pageContext.request.contextPath }<%=dto.getProfile()%>"/>
 					</div>
 					<div class="col-8">
 					<p class = "login-nick"><%= dto.getNick() %>  <strong>님</strong></p>
 					<p class ="login-email"><%= dto.getEmail() %></p>
 					
 					</div>
 					<a class="fhrmdkdnt " href="${pageContext.request.contextPath}/member/private/info.jsp">회원정보</a></p>
 					 <a  class="fhrmdkdnt " href="${pageContext.request.contextPath}/member/logout.jsp?url=<%=url%>">로그아웃</a></p>
 					
 					</div>

 				
   				</div>

   				<br>
 				<div class="side_left">
					<a href="${pageContext.request.contextPath }/sport/soccer.jsp"><img src="${pageContext.request.contextPath }/images/Coim-e2VIAA4NNj2.jpg" alt="" /></a>
 					<a href="${pageContext.request.contextPath }/sport/soccer.jsp"><img src="${pageContext.request.contextPath }/images/bo99.jpg" alt="" /></a>
 				</div>
 				
<%} %>