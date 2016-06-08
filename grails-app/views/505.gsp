<!DOCTYPE html>
<html>
<head>
    <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="main1"/>
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>

<body>
<g:if env="development">
    <g:renderException exception="${exception}"/>
</g:if>
<g:else>
    <ul class="errors">
        <li>An error has occurred</li>
    </ul>
    <div class=" alert-danger">
        <h2><g:link url="/login/index">Go Back to Home</g:link> </h2>
    </div>
</g:else>
</body>
</html>
