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
<div class="container">
    <div class="row">
        <div class="col-xs-6">
        <!-- Name Panel -->
        <!-- ************************************************** -->
            <g:each in="${resources}" var="resource">
                <div class="panel panel-default">

                    <div class="panel-body">

                        <div>
                            <div class="col-xs-2">
                                <div class="glyphicon glyphicon-user" style="font-size:80px"></div>
                            </div>

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
                                        <small class="text-muted">@uday</small>
                                    </div>

                                    <div class="col-xs-2"></div>

                                    <div class="col-xs-6 text-muted">${resource.dateCreated}</div>
                                </div>

                                <div class="row" style="padding-bottom:15px">
                                    <div class="col-xs-8"></div>

                                    <div class="col-xs-4">
                                        <select class="form-control" id="sel">
                                            <option>1 Star</option>
                                            <option>2 Star</option>
                                            <option>3 Star</option>
                                            <option>4 Star</option>
                                            <option>5 Star</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <p style="padding-bottom:5px">${resource.description}</p>

                            <div class="row">
                                <div class="col-xs-1 fa fa-facebook-official" style="font-size:20px"></div>

                                <div class="col-xs-1 fa fa-twitter" style="font-size:20px"></div>

                                <div class="col-xs-1 fa fa-google-plus" style="font-size:20px"></div>

                                <div class="col-xs-6"></div>

                                <div class="col-xs-4" class='readitem'><ls:read resource="${resource}">
                                </ls:read></div>
                                <ls:canDeleteResource resource="${resource}"><a
                                        href="/resource/delete?id=${resource.id}"><span
                                            class="glyphicon glyphicon-trash col-xs-1"></span>
                                </a></ls:canDeleteResource>
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
    </div></div>
</body>
</html>