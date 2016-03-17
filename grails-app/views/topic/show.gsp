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

<div class="col-sm-6">
            <div class="col-sm-12">
                <!-- Name Panel -->
                <!-- ************************************************** -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div>
                            <div class="col-xs-2">
                                <a href="/user/profile?userId=${topic.createdBy.id}">  <ls:userImage user="${topic.createdBy}"/></a>
    </div>

    <div class="col-xs-10">
        <div class="row" style="padding-bottom:5px">

            <div class="col-sm-6">
                <span class="text-left h3">${topic?.topicName}</span>
            </div>
        </div>

        <div class="col-xs-6">
            <span class="h5"><b>Author:</b>    ${topic?.createdBy}</span>
        </div>

        <div class="row" style="padding-bottom:10px">
            <div class="col-sm-4 text-info">
                Subscribed Users
            </div>

            <div class="col-sm-2 text-info right">Post</div>

        </div>
        <span class="col-sm-7"></span>
        <span class="col-sm-4 right"><ls:subscriptionCount topic="${topic.id}"/></span>
        <span class="col-sm-1" style="float: left"><ls:resourceCount topic="${topic.id}"/></span>

        <div class="row" style="padding-bottom:15px">
            <div class="col-xs-8"></div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-3 right h5" style="float: right"><a href="/resource/show?id=${topic?.id}" style="text-decoration: none">View All Post</a></div>
    </div>
    </div>

</div>
</div>
</div>

    <div class="col-sm-12">
        <div class="panel">
            <div class="panel-heading col-sm-12 " style="border: 1px solid grey;background-color: black">

                <span class="col-sm-9" style="color:white"><h4>Subscribed Users</h4></span><a href="#"
                                                                                              class="col-sm-3 " style="text-decoration: none"><h4></h4>
                </a>
            </div>

            <div class="panel-body col-sm-12" style="border:1px solid grey">
                <g:each in="${user}">
                    <div class="col-sm-12"style="margin-bottom: 10%">
                        <div class="col-sm-3"><a href="/user/profile?userId=${it.id}"><ls:userImage user="${it}"/></a>
                        </div><br/>
                        <span class="h4"style="float: right"><a href="/user/profile?userId=${it.id}" style="text-decoration: none">${it.name}</a></span>
                    </div>
                </g:each>
                <br/><br/>
            </div>

        </div>
    </div>
</div>
%{--________________________________________________________________________________________________________--}%

    <div class="col-xs-6">
        <!-- Topics Post Panel -->
        <!-- ************************************************ -->
        <div class="panel panel-default">

            <div class="panel-heading" style="background-color: black;color: white">
                <div class="row" style="margin-left:5px;margin-right:5px  ">
                    <strong>Post</strong>
                    <g:form class="form-inline" style="float: right" name="postsearch"
                            url="/resource/search?topicId=${topic?.id}">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search" name="q" id="srch-term">

                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                        </div>
                    </g:form>

                </div>
            </div>
            <div class="panel-body">
                <g:each in="${resource}">
                    <div>
                        <div class="col-xs-2">
                            <a href="/user/profile?userId=${it.createdBy.id}"><ls:userImage user="${it.createdBy}"/></a>
                        </div>

                        <div class="col-xs-10">
                            <div class="row">
                                <div class="col-xs-6">
                                    <span class="h4"><a href="/user/profile?userId=${it.createdBy.id}"  style="text-decoration: none;color: black">${it.createdBy}</a></span><br>
                                    <small class="text-muted">@${it?.createdBy.firstName}</small>
                                </div>
                            </div>

                            <p>${it?.description}</p>

                            <div class="row col-sm-12">
                                <a href="http://www.facebook.com" style="text-decoration: none"><i class="fa fa-facebook "
                                                                     style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                                </a>
                                <a href="http://www.google.com"style="text-decoration: none"> <i class="fa fa-google"
                                                                   style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                                </a>
                                <a href="http://www.twitter.com" style="text-decoration: none"><i class="fa fa-twitter"
                                                                    style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                                </a>
                                <span style=" padding-top:20px;padding-right:20px;"><ls:download resource="${it}"/>
                                </span>
                                <span style=" padding-top:20px;padding-right:20px;"><ls:link resource="${it}"/>
                                </span>
                                <a href="/resource/show?id=${it.id}&status=1"
                                   style="float: right;padding-top:20px;padding-right:20px">View Post</a>
                            </div>
                        </div></div>   <div class="col-sm-12" style="margin-top:20px;padding-top: 20px"></div>
                    <br/><br/><br/><br/></g:each>
            </div></div></div>
</g:if>

</body>
</html>