<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <script src="../../assets/javascripts/application.js"></script>
    <title></title>
</head>

<body>
<div class="alert-success h2 center-block" style="padding:5% "><b>${resources.topic[0]}</b></div>
<!-- Row 1 -->
<!-- *************************************************** -->
<div>
    <div>

    <!-- Name Panel -->
    <!-- ************************************************** -->
        <g:each in="${resources}" var="resource">
            <div class="panel panel-default" id="post${resource.id}">
                <div class="panel-body">
                    <div>
                        <div class="col-xs-2">

                            <a href="/user/profile?userId=${resource.createdBy.id}">     <ls:userImage user="${resource.createdBy}"/>
                       </a>
                        </div></div>


                    <div class="col-xs-10">
                        <div class="row" style="padding-bottom:5px">
                            <div class="col-xs-6">
                                <span class="h5"><a href="/user/profile?userId=${resource.createdBy.id}" style="text-decoration: none">  ${resource.createdBy}</a></span>
                            </div>

                            <div class="col-xs-3">
                            </div>

                            <div class="col-xs-3">
                                <a href="#" class="text-left" style="text-decoration: none">${resource.topic}</a>
                            </div>
                        </div>

                        <div class="row" style="padding-bottom:10px">
                            <div class="col-xs-4">
                                <small class="text-muted">@resource.createdBy</small>
                            </div>

                            <div class="col-xs-2"></div>

                            <div class="col-xs-6 text-muted">${resource.dateCreated}</div>
                        </div>

                        <ls:resourcerater resourceId="${resource.id}"/>
                    </div>

                    <p style="padding-bottom:5px">${resource.description}</p>

                    <div class="row">
                        <a href="http://www.facebook.com"><div class="col-xs-1 fa fa-facebook-official"
                                                               style="font-size:20px"></div>
                        </a>
                        <a href="http://www.twitter.com"><div class="col-xs-1 fa fa-twitter"
                                                              style="font-size:20px"></div>
                        </a>
                        <a href="http://www.google.com"><div class="col-xs-1 fa fa-google-plus"
                                                             style="font-size:20px"></div>
                        </a>

                        <div class="col-xs-6"></div>

                        <div class="col-xs-4" class='readitem'><ls:read resource="${resource}">
                        </ls:read></div>
                        <ls:canDeleteResource resource="${resource}"><span
                                class="glyphicon glyphicon-trash col-xs-1 text-info"
                                onclick="deleteresource(${resource.id})" style="cursor: pointer"></span>
                        </ls:canDeleteResource>
                        <ls:download resource="${resource}"/>
                        <ls:link resource="${resource}"/>
                    </div>
                </div>

            </div>
        </g:each>
    </div>

    <div class="col-xs-6">
        <!-- Trending Topics Panel -->
        <!-- ************************************************ -->

    </div>
</div>

</body>
</html>