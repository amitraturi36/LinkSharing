<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <script src="../../assets/javascripts/application.js"></script>
    <title></title>
</head>

<body>
<!-- Row 1 -->
<!-- *************************************************** -->
<div >
    <div class="col-xs-6">
<div class="row">

        <!-- Name Panel -->
        <!-- ************************************************** -->
            <g:each in="${resources}" var="resource">
                <div class="panel panel-default" id="post${resource.id}">
                    <div class="panel-body">
                        <div>
                            <div class="col-xs-2">
                                <div  style="font-size:80px"> <ls:userImage user="${resource.createdBy}"/></div>
                                </div></div>


                            <div class="col-xs-10">
                                <div class="row" style="padding-bottom:5px">
                                    <div class="col-xs-6">
                                        <span class="h5">${resource.createdBy}</span>
                                    </div>

                                    <div class="col-xs-3">
                                    </div>

                                    <div class="col-xs-3">
                                        <a href="#" class="text-left">${resource.topic}</a>
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
                                <div class="col-xs-1 fa fa-facebook-official" style="font-size:20px"></div>

                                <div class="col-xs-1 fa fa-twitter" style="font-size:20px"></div>

                                <div class="col-xs-1 fa fa-google-plus" style="font-size:20px"></div>

                                <div class="col-xs-6"></div>

                                <div class="col-xs-4" class='readitem'><ls:read resource="${resource}">
                                </ls:read></div>
                                <ls:canDeleteResource resource="${resource}"><a><span
                                        class="glyphicon glyphicon-trash col-xs-1"
                                        onclick="deleteresource(${resource.id})"></span>
                                </a></ls:canDeleteResource>
                                <ls:download resource="${resource}"/>
                                <ls:link resource="${resource}"/>
                            </div>
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
</div>
</body>
</html>