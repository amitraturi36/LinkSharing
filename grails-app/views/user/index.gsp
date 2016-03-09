<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>
<g:if test="session.user!=null">

    <h2>Welcome</h2>

    <div class="col-sm-6">

        <div style="padding:10px;margin:0px 19px;">
            <div class="panel  col-sm-9 " style="border: 1px solid grey;">
                <div class="col-sm-3" style="margin: 25px 0px;"><span
                        class="glyphicon glyphicon-user " style="font-size:70px;"></span>
                </div>

                <div class="panel-body col-sm-7">
                    <span class="text-muted col-sm-12 h4"><strong>${session.user.name}</strong></span>
                    <span class="text-muted col-sm-12">@ ${session.user.firstName}</span><span
                        class="text-muted col-sm-6">Subscriptions</span> <span class="text-muted col-sm-6">Topics</span>
                    <span class="text-info col-sm-6">${subtopics.totalCount}</span>
                    <span class="text-info col-sm-6">30</span>
                </div>
            </div></div>
        <g:render template="subscribedtopics"/>

    </div>

    <div class="col-sm-6">

        <div class="col-sm-12" style="padding:10px;margin:10px 0px">

        </div>

        <div style="padding:10px;margin:20px 0px">
            <g:render template="trendingtopics"/>
        </div>
    </div>
</g:if>
</body>
</html>