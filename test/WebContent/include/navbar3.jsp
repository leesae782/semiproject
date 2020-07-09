<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 파라미터 읽어내기
	String thisPage=request.getParameter("thisPage");
	
%>




<div class="navbar navbar-expand-sm navbar-dark bg-white">
	<a class="navbar-brand text-dark" href="${pageContext.request.contextPath }"><strong>VIVE LA JSS</strong></a>

</div>

<div class="navbar navbar-expand-sm navbar-dark bg-dark" >
	<a class="navbar-brand" href="${pageContext.request.contextPath }"><strong>VIVE LA JSS</strong></a>

	
	
	<ul class="navbar-nav">
		<li class="nav-item <%if(thisPage.equals("home")){%>active<%}%>"><a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">Home</a></li>
		<li class="nav-item <%if(thisPage.equals("game")){%>active<%}%>"><a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">Game</a></li>
		<li class="nav-item <%if(thisPage.equals("study")){%>active<%}%>"><a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">Study</a></li>
	</ul>
	
</div>

