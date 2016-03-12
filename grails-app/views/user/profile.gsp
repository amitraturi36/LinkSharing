<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:each var="topics" in="${subtopics}">

    ${topics}

</g:each>
<g:paginate next="Forward" prev="Back"
            maxsteps="0" controller="user"
            action="profile" total="${subtopicscount}" params="[userId: user.id]"/>
</body>
</html>