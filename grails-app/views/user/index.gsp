<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    %{--<meta http-equiv="refresh" content="15">--}%
    <title></title>
</head>

<body>
<g:if test="session.user">



    <div class="container">
        <h2 style="margin-left:12px">Welcome</h2>
        <div class="col-sm-6">

            <div>
                <div class="panel  col-sm-12 " style="border: 1px solid grey;">
                    <div class="col-sm-3" style="margin: 25px 0px;">
                        <a href="/user/profile?userId=${session.user}"><ls:userImage user="${user}"/>
                        </a>
                    </div>

                    <div class="panel-body col-sm-7">
                        <span class="text-muted col-sm-12 h4"><strong>${user.name}</strong></span>
                        <span class="text-muted col-sm-12">@ ${user.firstName}</span><span
                            class="text-muted col-sm-6">Subscriptions</span> <span
                            class="text-muted col-sm-6">Topics</span>
                        <span class="text-info col-sm-6"><ls:subscriptionCount user="${user}"/></span>
                        <span class="text-info col-sm-6"><ls:topicCount user="${user.id}"/></span>
                    </div>
                </div></div>
            <g:render template="subscribedtopics"/>
        </div>

        <div class="col-sm-6">

            <div class="col-sm-12">

            </div>
            <div class="panel " >
                <div class="panel-heading col-sm-12 "
                     style="border: 1px solid grey;background-color: black;">
                    <div class="row">
                        <span class="h4" style="color:white">Inbox
                            <g:form class="form-inline" style="float: right" name="inboxsearchform" url="/user/index">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search" name="q" id="srch-inbox">

                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </g:form>
                        </span>
                    </div>
                </div>
    <div class="panel-body col-sm-12" style="border: 1px solid grey;" >
            <g:render template="inbox"/>

            <div >

                <g:render template="trendingtopics"/>
            </div>
        </div>
    </div>
</g:if>
</body>
</html>