<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청 파라미터 읽어내기
	String thisPage=request.getParameter("thisPage");
	String id = (String)session.getAttribute("id");	
	
	
%>




<nav style = "height:100px; margin-bottom:50px;"class="navbar navbar-expand-sm bg-dark navbar-dark">

	<!-- Brand <--><br />
            <a class="navbar-brand" href="${pageContext.request.contextPath}"><strong>VIVE LA JSS</strong></a>
          
            <!-- Links -->
            <ul class="navbar-nav">
              
          
              <!-- Dropdown -->
              <li class="nav-item dropdown"style ="padding-left:75px;padding-right:75px;">
                <a class="nav-link dropdown-toggle <%if(thisPage.equals("funny")||thisPage.equals("infor")||thisPage.equals("issue")){ %> active<% }%>" href="#" id="navbardrop" data-toggle="dropdown">
                  	유머/이슈
                </a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/funny/funny.jsp">유머</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/funny/issue.jsp">이슈</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/funny/infor.jsp">정보</a>
                </div>
              </li>
               <!-- Dropdown -->
              <li class="nav-item dropdown"style ="padding-left:75px;padding-right:75px;">
                <a class="nav-link dropdown-toggle <%if(thisPage.equals("lol")||thisPage.equals("bag")||thisPage.equals("fifa")){ %> active<% }%>" href="#" id="navbardrop" data-toggle="dropdown">
                  	게임
                </a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/game/lol.jsp">LOL</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/game/bag.jsp">배틀 그라운드</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/game/fifa.jsp">FIFA Online</a>
                </div>
              </li>
               <!-- Dropdown -->
              <li class="nav-item dropdown"style ="padding-left:75px;padding-right:75px;">
                <a class="nav-link dropdown-toggle <%if(thisPage.equals("soccer")||thisPage.equals("basketball")||thisPage.equals("baseball")){ %> active<% }%>" href="#" id="navbardrop" data-toggle="dropdown">
                  	스포츠
                </a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/sport/soccer.jsp">축구</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/sport/basketball.jsp">농구</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/sport/baseball.jsp">야구</a>
                </div>
              </li>
              <li class="nav-item dropdown"style ="padding-left:75px;padding-right:75px;">
                <a class="nav-link dropdown-toggle <%if(thisPage.equals("free")||thisPage.equals("question")){ %> active<% }%>" href="#" id="navbardrop" data-toggle="dropdown">
                  	자유/Q&A
                </a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/free/free.jsp">자유게시판</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/free/question.jsp">Q&A</a>
                  
                </div>
              </li>
            </ul>
            <%try{ %>
            <%if(id.equals("admin")){ %>
            	<a class="btn btn-Dark" href="${pageContext.request.contextPath }/admin/admin_page.jsp">  admin  </a>
            <%} %>
            <%} catch(Exception e){} %>
          </nav>
			
            
