<%@ page import="com.shinowit.entity.UserinfoEntity" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="com.shinowit.entity.UserinfoEntity" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>留言板设计案例</title>
<%@ include file="/common/common_header1.jsp" %>
<%@ include file="/common/common_login1.jsp" %>
<script src="<%=request.getContextPath()%>/js/post_msg.js"></script>
 <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>

<body>

<div id="main">
    <div id="header">
        <img src="<%=request.getContextPath()%>/Images/logo.gif" alt="留言板设计案例" />
        <div>
            <a href="<%=request.getContextPath()%>/common/layout.jsp">退出</a>&nbsp;&nbsp;&nbsp;
            <a href="reg.jsp">注册</a>
        </div>
    </div>
    <div id="log">
        <form id="loginForm" action="" method="post">
            <input type="hidden" name="msg" id="msg" value="<%=request.getParameter("msg")==null?"":request.getParameter("msg")%>"/>
            <div id="ctopd">发表留言</div>
            <div id="cmopd">
                <ul>

                    <li><strong class="lts">昵称：</strong><label></label></li>
                    <li><strong class="lts">邮箱：</strong><label></label></li>
                    <li><strong class="lts">留言内容：</strong>
                        <script id="editor" type="text/plain" style="width:490px;height:330px;"><%=request.getParameter("msg")==null?"":request.getParameter("msg")%></script>

                    </li>
                </ul>
            </div>
            <div id="cfopd">
                <input type="button" class="btn_sub" value="留言" onclick="check_post_valid()" />
                <input type="button" class="btn_res" value="返 回" onclick="javascript:window.history.back();" />
            </div>
        </form>
    </div>
    <div id="footer">
        <img src="<%=request.getContextPath()%>/Images/logof.gif" alt="唐山师范学院" />
    </div>
</div>

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');

</body>
</html>