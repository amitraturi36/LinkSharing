
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="container">
<div class="col-sm-6">
<g:if test="${topic}">
    <div class="panel  col-sm-9 ">
        <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;">

            <span class="col-sm-9">Searched result</span>
        </div>

        <div class="panel-body col-sm-12" style="border:1px solid grey">
            <g:each in="${topic}" var="topics">
                <div id="user1${topics.id}">
                    <div class="col-sm-3" style="margin: 25px 0px;"><ls:userImage user="${topics.createdBy}"/>
                    </div>
                    <span class="col-sm-5"></span>
                    <span><a href="/topic/show?id=${topics.id}"><ins>${topics}</ins></a></span>

                    <span class="text-muted col-sm-4">${topics.createdBy.firstName}</span><span
                        class="text-muted col-sm-3">Subscriptions</span> <span class="text-muted col-sm-2">Post</span>
                    <span class="text-info col-sm-5"><ls:subscription topics="${topics.id}"/></span>
                    <span class="text-info col-sm-3">50</span>
                    <span class="text-info col-sm-2">30</span>
                    <span class="text-info col-sm-12"></span>
                </div>

                <div class="row">
                    <div class="col-xs-1 fa fa-facebook-official" style="font-size:20px"></div>

                    <div class="col-xs-1 fa fa-twitter" style="font-size:20px"></div>

                    <div class="col-xs-1 fa fa-google-plus" style="font-size:20px"></div>

                    <div class="col-xs-6"></div>

                    <div class="col-xs-3"><a href="/resource/show?id=${topics.id}">View Post</a></div>
                </div>
                <br/><br/>

            </g:each>
        </div>

    </div>
</g:if>
</div>
<div class="col-sm-6">
<g:if test="${resource}">
    <div class="panel panel-default">

        <div class="panel-heading">
                <strong>Post</strong>
        </div>
        <div class="panel-body">
            <g:each in="${resource}">
                <div>
                    <div class="col-xs-2">
                        <ls:userImage user="${resource.createdBy}"/>
                    </div>

                    <div class="col-xs-10">
                        <div class="row">
                            <div class="col-xs-6">
                                <span class="h5">Uday</span>
                                <small class="text-muted">@uday</small>
                            </div>

                            <div class="col-xs-3">
                            </div>

                            <div class="col-xs-3">
                                <a href="#" class="text-left">Grails</a>
                            </div>
                        </div>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mi risus, mollis sit amet purus vitae, rutrum commodo erat.</p>

                        <div class="row" style="padding-bottom:10px">
                            <div class="col-xs-1 fa fa-facebook-official"></div>

                            <div class="col-xs-1 fa fa-twitter"></div>

                            <div class="col-xs-1 fa fa-google-plus"></div>

                            <div class="col-xs-6"></div>

                            <div class="col-xs-3"><a href="#">View Post</a></div>
                        </div>
                    </div></div></g:each>
            <g:paginate next="Forward" prev="Back"
                        maxsteps="0" controller="topic"
                        action="search" total="${resourcecount}" params="[q:q]"/>
        </div></div></div>




</g:if>
</div>
</div>
</body>
</html>