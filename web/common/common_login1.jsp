	<%@ page language="java" contentType="text/html; charset=utf-8" 
	    pageEncoding="utf-8"%>
<%
   if((session.getAttribute("current_login_info")==null) && (session.getAttribute("login_info")==null)){
	   response.sendRedirect(request.getContextPath()+"/login.jsp");
	   return;}       
	   
%>
