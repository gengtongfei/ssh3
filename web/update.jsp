<%@page import="com.shinowt.entity.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
				UserInfo current_userinfo=(UserInfo)session.getAttribute("current_login_info");
				%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>留言板设计案例</title>
<%@ include file="/common/common_header1.jsp" %>
<%@ include file="/common/common_login1.jsp" %>
<script src="<%=request.getContextPath()%>/js/post_msg.js"></script>
</head>

<body>

	<div id="main">
    	<div id="header">
        	<img src="<%=request.getContextPath()%>/Images/logo.gif" alt="启奥留言板设计案例" />
            <div>
            	<a href="<%=request.getContextPath()%>/common/layout.jsp">退出</a>&nbsp;&nbsp;&nbsp;
                <a href="reg.jsp">注册</a>
            </div>
        </div>
        <div id="log">
			<form id="loginForm" action="<%=request.getContextPath()%>/UpdateReplyServlet" method="post">
			<input type="hidden" name="reply_msg_id" value="<%=request.getParameter("reply_id")%>"/>
			<input type="hidden" name="user_id" value="<%=current_userinfo.getUser_id()%>"/>
				
        	<div id="ctopd">发表回复</div>
			<div id="cmopd">
				<ul>
				
					<li><strong class="lts">姓名：</strong><label><%=current_userinfo.getNick_name() %></label></li>
					<li><strong class="lts">邮箱：</strong><label><%=current_userinfo.getQuest_email_addr() %></label></li>
					<li><strong class="lts">修改内容：</strong><textarea name="msgreply" id="msgreply" class="ltxs"><%=request.getParameter("msgreply")==null?"":request.getParameter("msgreply")%></textarea></li>
				</ul>
			</div>
			<div id="cfopd">
				<input type="button" class="btn_sub" value="修改" onclick="check_post_valid1()" />
				<input type="button" class="btn_res" value="返 回" onclick="javascript:window.history.back();" />
			</div>
			</form>
        </div>
		<div id="footer">
			<img src="<%=request.getContextPath()%>/Images/logof.gif" alt="毕业设计留言板案例" />
		</div>
    </div>
    <script type="javascript">
<% if(request.getAttribute("error_msg")!=null){
	out.print("alert('"+request.getAttribute("error_msg")+"');");
}
%>
</script>
</body>
</html>