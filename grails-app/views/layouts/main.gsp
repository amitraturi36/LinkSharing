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
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>

<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid ">
        <div class="navbar-header">
            <a href="/login/index" class="navbar-brand " style="color:white;font-size:20px; padding-top:14px;">Link Sharing
            </a></div>
    <ul class="nav navbar-nav navbar-right">

        <li>
            <g:form class="navbar-form" name="globalsearch" url="/topic/search" >
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="q" id="srch-term">

                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </g:form>

        </li>
        <g:if test="${session.user != null}">
            <li><a href="#" class="glyphicon glyphicon-comment"
                   data-toggle="modal" data-target="#myModal1"
                   style="color:white;font-size:30px; padding-top:14px;"></a>
            </li>
            <li><a href="#" class="glyphicon glyphicon-envelope"
                   data-toggle="modal" data-target="#myModal2"
                   style="color:white;font-size:30px; padding-top:14px;"></a>
            </li>

            <li><a href="#" class="glyphicon glyphicon-link"
                   data-toggle="modal" data-target="#createlink"
                   style="color:white;font-size:30px; padding-top:14px;"></a>
            </li>
            <li><a href="#" class="glyphicon glyphicon-file"
                   data-toggle="modal" data-target="#createDoc"
                   style="color:white;font-size:30px; padding-top:14px;"></a>
            </li>
            <li><a class="btn dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown"
                                         href="#" style="color:white;font-size:20px; padding-top:14px;">
                ${session.user.firstName}
                <b class="caret"></b>
            </a>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Users</a></li>
                    <li class="divider"></li>
                    <li><a href="/user/showSubscribedTopics">Topics</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Posts</a></li>
                    <li class="divider"></li>
                    <li><a href="/login/logout">LogOut</a></li>

                </ul>
            </li></ul>
            <g:render template="/topic/createTopicTemplate"/>
            <g:render template="/topic/email"/>
            <g:render template="/layouts/LinkResource/create"/>
            <g:render template="/layouts/documentResource/create"/>
        </g:if>
    </div></nav>

<div class="alert-danger" id="mainerror">
    <g:if test="${flash.errors}">
        ${flash.errors}

    </g:if>
</div>

<div class="alert-danger">
    <g:hasErrors bean="${user}">
        <g:eachError><p><g:message error="${it}"/></p></g:eachError>
    </g:hasErrors>
</div>

<div class="alert-success" id="mainmessage"><g:if
        test="${flash.messages}">${flash.messages}</g:if>
</div>

<div class="body"><g:layoutBody/></div>

<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt"
                                                                   default="Loading&hellip;"/></div>
</body>
</html>
