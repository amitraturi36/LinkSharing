<%@ page import="com.intelligrape.linksharing.User" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta itemprop="description" content=" This Topic  have awesome resources please check them out at">
    <title>LinkSharing</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="canonical" href="https://dev.twitter.com/web/tweet-button">
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="sidebarscroll.js"/>
    <asset:javascript src="/scroll_jquery.js"/>
    <script src="https://apis.google.com/js/platform.js" async defer></script>

    <g:layoutHead/>
</head>

<body>
<g:render template="/topic/createTopicTemplate"/>
<g:render template="/topic/email"/>
<g:render template="/LinkResource/create"/>
<g:render template="/documentResource/create"/>

<div id="trigger">
</div>
<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
<!--header start-->
<header class="header black-bg" style="background-color: #89229b">
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
    </div>
    <!--logo start-->


    <a href="/user/index.html" class="logo"><b>LinkSharing</b></a>
    <!--logo end-->
    <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
            <!-- settings start -->

            <!-- settings end -->
            <!-- inbox dropdown start-->
            <li id="header_inbox_bar" class="dropdown" style="    margin-left: 550px;">

                <g:render template="/user/inbox_top_bar"/>

            </li>
            <!-- inbox dropdown end -->

        </ul>
        <!--  notification end -->
    </div>

    <div class="top-menu">
    <ul class="nav pull-right top-menu">
        <li>
            <div style="    margin-right: 14%;margin-top:10px;">
                <div class="row pull-right">

                    <div class="search pull-right">
                        <g:form name="globalsearch" url="/topic/search">
                            <input type="text" class="form-control input-sm" maxlength="64" name="q"
                                   placeholder="Search" required/>
                            <Button type="submit" class="  btn btn-primary btn-sm ">Search</Button>
                        </g:form>
                    </div>

                </div>
            </div>

        </li>
        <g:if test="${sec.loggedInUserInfo(field: 'id')}">

            <li><a class="btn dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown"
                   href="#" style=" margin-top:14px;    color: aliceblue;">
                ${sec.loggedInUserInfo(field: 'username')}
                <b class="caret"></b>
            </a>
                <ul class="dropdown-menu">
                    <g:if test="${User.get(sec.loggedInUserInfo(field: 'id')).admin}">

                        <li><a href="/user/admin?search=&selector=2">Admin</a></li>
                    </g:if>
                    <li class="divider"></li>
                    <li><g:link controller='logout' action="">LogOut</g:link></li>

                </ul>
            </li>



            </ul>

        </g:if>
    </div>


</header>
<!--header end-->

<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
<!--sidebar start-->
<g:if test="${sec.loggedInUserInfo(field: 'id')}">
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><ls:userImage
                        user="${user}"/></p>
                <h5 class="centered">${user.name}</h5>

                <li class="mt">
                    <a class="active" href="/user/index">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>


                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>Components</span>
                    </a>
                    <ul class="sub">
                        <li><br/></li>
                        <li><a href="#inbox" onclick="inboxload()" style="cursor: pointer">
                            Inbox
                        </a>
                        </li>
                        <li><a href="#subscribedTopics" onclick="subscribedtopicload()" style="cursor: pointer">Subscribed Topic</a></li>
                        <li><a href="#topicCreated"onclick="createdtopicload()" style="cursor: pointer">Created Topics</a></li>
                        <li><a href="#subscribedUser" onclick="subscribeduserload()" style="cursor: pointer">Subscribed Users</a></li>
                        <li><a href="#trendingtopic" onclick="trendingtopicload()" style="cursor: pointer">Trending Topics</a></li>
                    </ul>
                </li>
                <g:if test="${subtopics || topic}">
                    <li class="sub-menu">
                        <a href="javascript:;">
                            <i class="fa fa-book"></i>
                            <span>Users Features</span>
                        </a>
                        <ul class="sub">
                            <li><a href="#" class="glyphicon glyphicon-comment"
                                   data-toggle="modal" data-target="#myModal1"
                                   style=" margin-top:14px;">&nbsp;Create Topic</a>
                            </li>
                            <li><a href="#" class="glyphicon glyphicon-envelope"
                                   data-toggle="modal" data-target="#myModal2"
                                   style=" margin-top:14px;">&nbsp;Invite</a>
                            </li>
                            <li><a href="#" class="glyphicon glyphicon-link"
                                   data-toggle="modal" data-target="#createlinkresc"
                                   style=" margin-top:14px;">&nbsp;Link Resource</a>
                            </li>


                            <li><a href="#" class="glyphicon glyphicon-file"
                                   data-toggle="modal" data-target="#createDoc"
                                   style=" margin-top:14px;">&nbsp;Document Rsource</a>
                            </li>

                        </ul>
                    </li>
                </g:if>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span>Settings</span>
                    </a>
                    <ul class="sub">
                        <li><a href="#setting" onclick="settingload()" >Accoun Setting</a></li>
                    </ul>
                </li>

            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
</g:if>
<!--sidebar end-->





%{--<nav class="navbar navbar-inverse">--}%
%{--<div class="container-fluid ">--}%
%{--<div class="navbar-header">--}%
%{--<a href="/login/index" class="navbar-brand " style="color:white;font-size:20px; padding-top:14px;">Link Sharing--}%
%{--</a></div>--}%
%{--<ul class="nav navbar-nav navbar-right">--}%


%{--</div>--}%

%{--<div class="alert-danger">--}%
%{--<g:hasErrors bean="${user}">--}%
%{--<g:eachError><p><g:message error="${it}"/></p></g:eachError>--}%
%{--</g:hasErrors>--}%
%{--</div>--}%

%{--<div class="alert-success" id="mainmessage">--}%
%{--<g:if test="${flash.messages}">${flash.messages}</g:if>--}%
%{--<button type="button" class="close" data-dismiss="mainmessage">&times;</button>--}%
%{--</div>--}%

<div class="body"><g:layoutBody/></div>

<div class="footer" role="contentinfo">

    <div id="copyright" class="container">
        <div style="text-align: center;    margin-left: 20%;">
            <img src="${assetPath(src: 'tothe newdigital.jpeg')}" width="120px" height="120px"
                 class="pull-left colsm-3">

            <p class="h3 col-sm-8"
               style="color: #45443B;text-decoration: blink">&copy; All rights reserved by <a
                    href="http://ToTheNew.com/" style="color: black" class="h2">To the New Digital</a> .</p>
        </div>
    </div>

    <div id="wrapper4">
        <div id="footer" class="container">
            <div id="loginfooter" style="margin-left:-10%;margin-right:-20%;padding-bottom: 5% ;padding-top: 5%">
                <header class="title">
                    <h2>Get in touch</h2>
                    <span class="byline">Like Us</span></header>
                <ul class="contact">
                    <li><a href="https://twitter.com/tothenew?lang=en" class="icon icon-twitter"><span>Twitter</span></a></li>
                    <li><a href="https://www.facebook.com/tothenewdigital/" class="icon icon-facebook"><span></span></a></li>
                    <li><a href="https://plus.google.com/+Intelligrape/videos" class="fa fa-google-plus"><span class="fa-google-plus"></span></a></li>
                    <li><a href="https://www.linkedin.com/company/tothenew" class="fa fa-linkedin "><span class="fa-linkedin "></span></a></li>
                </ul>
            </div>
        </div>
    </div>

</div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt"
                                                                   default="Loading&hellip;"/></div>

</body>
</html>
