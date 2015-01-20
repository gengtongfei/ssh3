<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/10/16
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
</head>
<body>

</body>

<script type="text/javascript">
    <s:iterator value="fieldErrors">
            <s:iterator value="value" status="stut">
            alert("<s:property value='value.get(#stut.index).toString()'/>");
    </s:iterator>
    </s:iterator>
</script>
</html>
