<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@page import="test.commentdto.CommentDto"%>
<%@page import="test.commentdao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%


String content = request.getParameter("content");
String name = request.getParameter("name");
int boardnum= Integer.parseInt(request.getParameter("num"));

String url = request.getParameter("url");
String kinds= request.getParameter("kinds");
String allpage= request.getParameter("allpage");
CommentDao dao = CommentDao.getInstance();
CommentDto dto  = new CommentDto();
dto.setName(name);
dto.setContent(content);
dto.setBoardnum(boardnum);

boolean isSuccess = dao.insert(dto);

String cPath=request.getContextPath();
//회원 목록보기 요청을 하도록 강요 하는 응답을 한다. (리다일렉트 이동 시키기)	
response.sendRedirect(cPath+"/board/detail.jsp?num="+boardnum+"&url="+url+"&kinds="+kinds+"&allpage="+allpage);
%>
