<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*"
         pageEncoding="utf-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>留言板设计案例</title>
    <%@ include file="/common/common_header1.jsp" %>
    <script src="<%=request.getContextPath()%>/js/reg.js"></script>
    <script src="<%=request.getContextPath()%>/js/my97/WdatePicker.js"></script>
</head>

<body>
<div id="main">
    <div id="header">
        <img src="<%=request.getContextPath()%>/Images/logo.gif" alt="启奥留言板设计案例"/>

        <div>
            <a href="login.jsp">登陆</a>&nbsp;&nbsp;&nbsp;
            <a href="reg.jsp">注册</a>
        </div>
    </div>
    <div id="log" style="margin-top:10px;">
        <s:form theme="simple" namespace="/stu" action="reg" method="post">
            <s:hidden name="user.roleTypesByRoleId.roleId" value="0"></s:hidden>
            <div id="ctopd">用户注册</div>
            <div id="cmopd">
                <ul>
                    <li><strong class="ltt">登录名：</strong><s:textfield name="user.userName" id="username"
                                                                      cssClass="ltx"></s:textfield></li>
                    <li><strong class="ltt">登录密码：</strong><s:password name="user.userPass" id="userpass"
                                                                      cssClass="ltx"></s:password></li>
                    <li><strong class="ltt">确认密码：</strong><s:password name="userpass1" id="userpass1"
                                                                      cssClass="ltx"></s:password></li>
                    <li><strong class="ltt">密码保护问题：</strong><s:textfield name="user.passQuestion"
                                                                         cssClass="ltx"></s:textfield></li>
                    <li><strong class="ltt">您的答案：</strong><s:textfield name="user.passQuesAnsw"
                                                                       cssClass="ltx"></s:textfield></li>
                    <li><strong class="ltt">出生日期：</strong><s:textfield name="user.birthday" id="birthday"
                                                                       readonly="true" onclick="WdatePicker()"
                                                                       cssClass="ltx"></s:textfield></li>
                    <li><strong class="ltt">性 别：</strong><s:radio name="user.sexTypesBySexTypeCode.sexTypeCode"
                                                                  list="#{1:'男',2:'女'}"/></li>
                    <li><strong class="ltt">昵 称：</strong><s:textfield name="user.nickName" cssClass="ltx"></s:textfield>
                    </li>
                    <li><strong class="ltt">密保邮箱：</strong><s:textfield name="user.questEmailAddr"
                                                                       cssClass="ltx"></s:textfield></li>
                    <li><strong class="ltt">验证码：</strong><s:textfield name="varcode" id="valid_code" maxlength="4"
                                                                      cssClass="lty"></s:textfield><img
                            src="<%=request.getContextPath()%>/validCode.jsp" id="valid_image"
                            onclick="reload_image()"/></li>
                    <li><label style="margin-left: 80px;">对一切结果不负责任,如用户不同意本服务条款,请不要注册!</label></li>
                    <li><strong class="ltt">&nbsp;</strong><input type="checkbox" name="agreement_checkbox"
                                                                  id="agreement_checkbox" class="ltc"/>同意服务条款
                    </li>
                </ul>
            </div>
            <div id="cfopd">
                <input type="button" class="btn_sub" value="注册" onclick="return check_reg_valid()"/>
                <input type="reset" class="btn_res" value="重置"/>
            </div>
            </form>
        </s:form>
    </div>
    <div id="footer">
        <img src="<%=request.getContextPath()%>/Images/logof.gif" alt="毕业设计留言板设计案例"/>
    </div>
</div>

</body>


    <s:iterator value="fieldErrors">
    <s:iterator value="value" status="stut">
    <script type="text/javascript">
    alert("<s:property value='value.get(#stut.index).toString()'/>");
    </script>
    </s:iterator>
    </s:iterator>

</html>
