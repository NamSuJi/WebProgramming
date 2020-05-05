<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.addrbook.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="gb" scope="page" class="jspbook.addrbook.AddrBean" />
<jsp:useBean id="addrbook" class="jspbook.addrbook.AddrBook"/>
<jsp:setProperty property="*" name="addrbook" />
<%
	String action = request.getParameter("action");
	if(action.equals("list")){
	
	}
	else if(action.equals("insert")){
		if(gb.insertDB(addrbook)){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}else{
			throw new Exception("DB 입력 오류");
		}
		
	}
	else if(action.equals("edit")){
		AddrBook abook = gb.getDB(addrbook.getAb_id());
		if(request.getParameter("upasswd") != "1234"){
			out.println("<script>alert('비밀번호가 틀렸습니다');history.go(-1);</script>");
		}else{
			request.setAttribute("ab",abook);
			pageContext.forward("addrbook_edit_form.jsp");
		}
	}
	else if(action.equals("update")){
		if(gb.updateDB(addrbook)){
			response.sendRedirect("addrobook_control.jsp?action=list");
		}
		else throw new Exception("DB 갱신 오류");
	}
	else if(action.equals("delete")){
		if(gb.deleteDB(addrbook.getAb_id())){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}
		else{
			throw new Exception("DB 삭제 오류");
		}
	}
	else{
	}
%>