<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title></title>
</head>

<body>

<g:if test="session.user!=null">

    <!-- Row 1 -->
    <!-- *************************************************** -->
    <div class="container">
        <div class="row">
            <div class="col-xs-6">
                <!-- Name Panel -->
                <!-- ************************************************** -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div>
                            <div class="col-xs-2">
                                <div class="glyphicon glyphicon-user" style="font-size:80px"></div>
                            </div>

                            <div class="col-xs-10">
                                <div class="row" style="padding-bottom:5px">
                                    <div class="col-xs-6">
                                        <span class="h5">${topic.createdBy}</span>
                                    </div>

                                    <div class="col-xs-3">
                                    </div>

                                    <div class="col-xs-3">
                                        <a href="#" class="text-left">${topic.topicName}</a>
                                    </div>
                                </div>

                                <div class="row" style="padding-bottom:10px">
                                    <div class="col-xs-4">
                                    </div>

                                    <div class="col-xs-2"></div>
                                </div>

                                <div class="row" style="padding-bottom:15px">
                                    <div class="col-xs-8"></div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-1 fa fa-facebook-official" style="font-size:20px"></div>

                                <div class="col-xs-1 fa fa-twitter" style="font-size:20px"></div>

                                <div class="col-xs-1 fa fa-google-plus" style="font-size:20px"></div>

                                <div class="col-xs-6"></div>

                                <div class="col-xs-3"><a href="/resource/show?id=${topic.id}">View Post</a></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-xs-6">
                <!-- Trending Topics Panel -->
                <!-- ************************************************ -->
                <div class="panel panel-default">
                    <div class="panel-heading"><strong>Trending Topics</strong></div>

                    <div class="panel-body">
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
                            </div>
                        </div>

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

                                <div class="row">
                                    <div class="col-xs-4">
                                        <select class="form-control" id="sel1">
                                            <option>Serious</option>
                                            <option>Very Serious</option>
                                        </select>
                                    </div>

                                    <div class="col-xs-4">
                                        <select class="form-control" id="sel1">
                                            <option>Public</option>
                                            <option>Private</option>
                                        </select>
                                    </div>

                                    <div class="col-xs-2"><a href="#">Edit</a></div>

                                    <div class="col-xs-2"><a href="#">Delete</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div></div>
%{--________________________________________________________________________________________________________--}%
    <div class="col-sm-6">
        <div class="panel  col-sm-9 ">
            <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;">Subscribed User
            </div>

            <div class="panel-body col-sm-12" style="border:1px solid grey">
                <g:each in="${user}">
                    <div class="col-sm-12">
                        <div class="col-sm-3" style="margin: 25px 0px;"><span
                                class="glyphicon glyphicon-user " style="font-size:70px;"></span>
                        </div>
                        <a href="#" class=" col-sm-9 " style="font-size: 15px;padding:20px 15px;"><ins>${topic}</ins>
                        </a>
                        <span class="text-muted ">${it.name}</span>
                    </div>
                </g:each>
                <br/><br/>
            </div>

        </div>
    </div>
</g:if>

</body>
</html>