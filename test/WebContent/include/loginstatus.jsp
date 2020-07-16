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
				<p><%=url %></p>
 				<p><a href="${pageContext.request.contextPath}/member/login_form.jsp?url=<%=url%>">로그인 하러가기</a></p>
 			<%} else { %>
 				<p><%= id %></p>
 				<p><%= dto.getNick() %></p>
 				<p><%= dto.getEmail() %></p>
 				<p><%= dto.getRegdate() %></p>
 				<p> <a href="${pageContext.request.contextPath}/member/logout.jsp?url=<%=url%>">로그아웃</a></p>
 				<p><a href="${pageContext.request.contextPath}/member/private/info.jsp">회원정보</a></p>
<%} %>