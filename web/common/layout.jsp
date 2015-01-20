	<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*"
	    pageEncoding="utf-8"%>
<%
	session.invalidate();
	response.sendRedirect(request.getContextPath()+"/login.jsp");
	   
%>
