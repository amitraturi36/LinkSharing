<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:each var="book" in="${searchResults}">



</g:each>
<g:paginate controller="displayBook" action="index" total="${total}"/>
</body>
</html>