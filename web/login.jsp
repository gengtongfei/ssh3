<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>留言板设计用户登录</title>
    <%@ include file="common/common_header1.jsp"%>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/login.js" ></script>
</head>

<body>

<div id="main">
    <div id="header">
        <img src="<%=request.getContextPath()%>/Images/logo.gif" alt="启奥留言板设计案例" />
        <div>
            <a href="login.jsp">登陆</a>&nbsp;&nbsp;&nbsp;
            <a href="reg.jsp">注册</a>
        </div>
    </div>
    <div id="log">

        <s:form namespace="/stu" theme="simple" action="login" method="post" >

            <div id="ctopd">用户登录</div>
            <div id="cmopd">
                <ul>
                    <li><strong class="ltt">登录名：</strong> <s:textfield name="user.userName" maxLength="50" cssClass="ltx"></s:textfield></li>
                    <li><strong class="ltt">密 码：</strong><s:password name="user.userPass" maxLength="50" cssClass="ltx"></s:password></li>
                    <li><strong class="ltt">验证码：</strong><s:textfield name="varcode" maxlength="4" cssClass="lty"></s:textfield><img src="<%=request.getContextPath()%>/validCode.jsp" id="valid_image"onclick="reload_image()"/></li>
                    <li><strong class="ltt">身 份:</strong>
                        <s:select label="身份:" name="user.roleTypesByRoleId.roleId"  list="relelist" listKey="roleId" listValue="roleName" maxlength="4" cssClass="lty">
                        </s:select>

                    </li>
                </ul>

            </div>
            <div id="cfopd">

                <input type="submit" class="btn_sub" value="登 录" />
                <input type="button" class="btn_res" value="返 回" onclick="javascript: window.history.back()" />
            </div>

    </s:form>
    </div>

    <div id="footer">
        <img src="<%=request.getContextPath()%>/Images/logof.gif" alt="毕业设计留言板案例" />
    </div>
</div>
<script type="text/javascript">
    <s:iterator value="fieldErrors">
    <s:iterator value="value" status="stut">
    alert("<s:property value='value.get(#stut.index).toString()'/>");
    </s:iterator>
    </s:iterator>
</script>

</body>
</html>
