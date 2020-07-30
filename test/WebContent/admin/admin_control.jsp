<%@page import="java.net.URLEncoder"%>
<%@page import="test.memberdao.MemberDao"%>
<%@page import="test.memberdto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("data");
	String select = request.getParameter("select");
	String keyword = URLEncoder.encode(request.getParameter("keyword"));
	if(select.equals("정지")){
		MemberDto dto = MemberDao.getInstance().getisStop(id);
		int num = dto.getIsStop();
		switch(num){
		case 0:
			dto.setId(id);
			dto.setIsStop(1);
			MemberDao.getInstance().isStop(dto);
			response.sendRedirect("admin_page.jsp?keyword="+keyword);
			break;
		case 1:
			dto.setId(id);
			dto.setIsStop(0);
			MemberDao.getInstance().isStop(dto);
			response.sendRedirect("admin_page.jsp?keyword="+keyword);
			break;
		}
	}else if(select.equals("탈퇴")){
		MemberDao.getInstance().delete(id);
		response.sendRedirect("admin_page.jsp");
	}
%>
