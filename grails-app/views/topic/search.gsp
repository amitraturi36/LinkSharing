
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:if test="${topic}">${topic.visibility}</g:if>
<g:if test="${resource}">${resource}</g:if>
</body>
</html>