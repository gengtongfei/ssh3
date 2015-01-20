<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*"
    pageEncoding="utf-8"%>
    <%@ include file="/common/common_header1.jsp"%>
<%@page import="com.shinowt.bbs.imp.*"%>
<%@page import="com.shinowt.bbs.DAO.*"%>
<%@page import="com.shinowt.entity.*"%>
<%
	UserInfo user=(UserInfo)request.getSession(true).getAttribute("current_login_info");
AdminInfo admin=(AdminInfo)request.getSession(true).getAttribute("login_info");

PostpageDAO message_dao=new PostpageDAOImpl();
int current_page_index=1;
if(request.getParameter("pageNum")!=null){
	current_page_index=Integer.valueOf(request.getParameter("pageNum"));
}
int page_size=2;
List<Message> msg_list=message_dao.queryForPage(page_size, current_page_index);
int record_count=message_dao.getRecordCount();
int pageCount=record_count/page_size;
if((pageCount%page_size)>0){
	pageCount++;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<title>留言板设计案例</title>
<link href="<%=request.getContextPath()%>/Css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="main">
    	<div id="header">
        	<img src="<%=request.getContextPath()%>/Images/logo.gif" alt="启奥留言板设计案例" />
            <div>
            	<a href="">登陆</a>&nbsp;&nbsp;&nbsp;
                <a href="">注册</a>
            </div>
        </div>
        <div id="content">
        
            <div id="cmenu">
				<a href="">【我要留言】</a>
			</div>	
			
		<div class="page">
				共<%=record_count%>
				条留言 / 分
				<%=pageCount%>
				页显示 / 当前第
				<%=current_page_index%>
				页 / <input type="text" name="pageNum" id="pageNum"
					value="<%=current_page_index%>" style="width: 20px;" /> <input
					type="button" value="Go" onclick=" gotopage(<%=pageCount%>)" />
				<%
					if(current_page_index>1){
				%>
				<a
					href="<%=request.getContextPath()%>/index.jsp?pageNum=<%=current_page_index-1%>"
					style="color: black;">前一页</a>
				<%
					}
				%>
				<%
					if(current_page_index<pageCount) {
				%>
				<a
					href="<%=request.getContextPath()%>/index.jsp?pageNum=<%=current_page_index+1%>"
					style="color: black;">后一页</a>
				<%
					}
				%>
			</div>
            <div id="cfooter"></div>
        </div>
		<div id="footer">
			<img src="<%=request.getContextPath()%>/Images/logof.gif" alt="唐山市启奥职业培训学校" />
		</div>
    </div>
</body>
</html>
