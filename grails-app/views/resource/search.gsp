
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="col-sm-6">
    <div class="panel panel-default">

        <div class="panel-heading">
            <strong>Post</strong>
        </div>
        <div class="panel-body">
            <g:each in="${resource}">
                <div>
                    <div class="col-xs-2">
                        <div class="glyphicon glyphicon-user" style="font-size:60px"></div>
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
                        maxsteps="0" controller="resource"
                        action="search" total="${resourcecount}" params="[q:q]"/>
        </div></div></div>


</body>
</html>