<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
    <script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
</head>

<body>

<h2 style="margin-left:4%">Welcome</h2>


<div class="col-sm-6">

    <div style="margin-left:3% ">
        <div class="panel  col-sm-12" style="border: 1px solid grey;">
            <div class="col-sm-3" style="margin: 25px 0px;">
                <a href="/user/profile?userId=${user.id}"><a href="/user/profile?userId=${user.id}"><ls:userImage
                        user="${user}"/></a>
                </a>
            </div>

            <div class="panel-body col-sm-7">
                <span class="text-muted col-sm-12 h4"><strong><a href="/user/profile?userId=${user.id}"
                                                                 style="text-decoration: none">${user.name}</a></strong>
                </span>
                <span class="text-muted col-sm-12">@ ${user.firstName}</span><span
                    class="text-muted col-sm-6">Subscriptions</span> <span
                    class="text-muted col-sm-6" style="float: right">Topics</span>
                <span class="text-info col-sm-6"><ls:subscriptionCount user="${user}"/></span>
                <span class="text-info col-sm-6" style="float: right"><ls:topicCount user="${user.id}"/></span>
            </div>
        </div></div></div>

<div class="col-sm-12">
    <div class="col-sm-6">

        <div class="panel">
            <div class="panel-heading col-sm-12 " style="border: 1px solid grey;background-color: black">

                <span class="col-sm-9" style="color:white"><h4>Subscribed Topics</h4></span><a href="#"
                                                                                               class="col-sm-3 "><ins><h4></h4>
                </ins></a>
            </div>

            <div class="panel-body col-sm-12" style="border:1px solid grey">
                 <g:render template="profilesub"/>
                <g:paginate next="Forward" prev="Back"
                            maxsteps="2" controller="user" max="5"
                             total="${subtopicscount}" params="[userId: user.id]"/>

            </div>

        </div>
    </div>

    <div class="col-sm-6">
        <g:render template="usertopic"/>
    </div>
</div>
</body>
</html>