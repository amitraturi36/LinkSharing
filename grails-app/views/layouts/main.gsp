<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>

<body>
<div class="navbar navbar-default">
    <div class="container-fluid headbgcolor">
        <div class="navbar-inner">
            <ul class="nav">

                <li><span class="col-sm-6 lnkAndSrchHdr"><a href="#"><h3 style="margin:0px"><ins>Link Sharing</ins></h3>
                </a></span></li>

                <li class="col-sm-3 lnkAndSrchHdr"><form class="form-control" style="overflow:hidden"
                                                         action="/topic/show">
                    <i class="glyphicon glyphicon-remove form-control-feedback"
                       style="overflow:hidden ;border:none; top:10px; right:10px; position: absolute;"></i>

                    <div class="inner-addon left-addon">
                        <button type="submit" style="background-color: inherit;border: none "><i
                                class="glyphicon glyphicon-search "></i>
                        </button><input type="search" class="form-control" placeholder="Search"
                                        style="overflow:hidden ;border:none;background-color:inherit;height:100%;width:100%;margin-top:-25px"/>
                    </div>
                </form></li>
                <g:if test="${session.user != null}">
                    <div class=" col-sm-3 " style="padding:10px 0px;margin:10px 0px">
                        <li><a href="#" class="glyphicon glyphicon-comment" style="padding:0px 5px;margin:0px 5px"
                               data-toggle="modal" data-target="#myModal1"></a>
                            <g:render template="/topic/createTopicTemplate"></g:render>
                            <a href="#" class="glyphicon glyphicon-envelope" style="padding:0px 7px;margin:0px 7px"
                               data-toggle="modal" data-target="#myModal2"></a>
                            <g:render template="/topic/email"></g:render>

                            <a href="#" class="glyphicon glyphicon-link" style="padding:0px 7px;margin:0px 7px"
                               data-toggle="modal" data-target="#createlink"></a>
                            <g:render template="/layouts/LinkResource/create"></g:render>
                            <a href="#" class="glyphicon glyphicon-file" style="padding:0px 7px;margin:0px 7px"
                               data-toggle="modal" data-target="#createDoc"></a>
                            <g:render template="/layouts/documentResource/create"></g:render>
                            <div style="position:absolute;top:3px;right:20px;"><a
                                    class="btn dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown"
                                    href="#">${session.user.firstName}
                                <span class="caret"></span>
                            </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Profile</a></li>
                                    <li><a href="#">Users</a></li>
                                    <li><a href="/user/showSubscribedTopics">Topics</a></li>
                                    <li><a href="#">Posts</a></li>
                                    <li><a href="/login/logout">LogOut</a></li>
                                </ul></div>

                        </li>
                    </div>
                </g:if>

            </ul></div>
    </div></div>

<div class="alert-danger" id="mainerror" style="border:1px solid lightgrey;display: block  ">
    <g:if test="${flash.errors}">
        ${flash.errors}

    </g:if>
</div>

<div class="alert-danger" style="border:1px solid lightgrey;display: block  ">
    <g:hasErrors bean="${user}">
        <g:eachError><p><g:message error="${it}"/></p></g:eachError>
    </g:hasErrors>
</div>

<div class="alert-success" id="mainmessage"style="border:1px solid lightgrey;display: block  "><g:if
        test="${flash.messages}">${flash.messages}</g:if>
</div>

<div class="body"><g:layoutBody/></div>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt"
                                                                   default="Loading&hellip;"/></div>
</body>
</html>
