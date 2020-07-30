<%@page import="test.memberdto.MemberDto"%>
<%@page import="test.memberdao.MemberDao"%>
<%@page import="test.commentdto.CommentDto"%>
<%@page import="test.commentdao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String id = (String)session.getAttribute("id");
	
	
		
	MemberDao nickdao = MemberDao.getInstance();
	MemberDto nickdto=nickdao.getData(id);
	String name =nickdto.getNick();
	
	int boardnum = (Integer.parseInt(request.getParameter("boardnum")));
	String url = request.getParameter("url");
	String kinds =request.getParameter("kinds");
	String allpage= request.getParameter("allpage");

	int num= (Integer.parseInt(request.getParameter("num")));
	String name2= request.getParameter("name");
	
	if(!name2.equals(name)){
		//.sendError(에러코드, 에러메세지);
		response.sendError(HttpServletResponse.SC_FORBIDDEN, 
				"남의 파일 지우기 없기임~");
		return; //메소드 끝내기 (servie() 메소드)
	}
	
	
	CommentDto dto = new CommentDto();
	dto.setNum(num);
	dto.setName(name);
	CommentDao dao =  CommentDao.getInstance();
	

	dao.delete(dto);
	
	String cPath=request.getContextPath();
	//회원 목록보기 요청을 하도록 강요 하는 응답을 한다. (리다일렉트 이동 시키기)	
	response.sendRedirect(cPath+"/board/detail.jsp?num="+boardnum+"&url="+url+"&kinds="+kinds+"&allpage="+allpage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>