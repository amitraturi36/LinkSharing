<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>

<body>
<g:if test="${!flag}">
    <g:if test="${resource}">
        <div class="alert-success h3"
             style="padding:5% ">Search RESULTS FOR TOPIC    <b>${resource.topic.topicName[0]}</b></div>
    </g:if>

    <g:else>
        <div class="alert-warning h3" style="padding:5% "><b>No Resources Founded</b></div>
    </g:else>
</g:if>
<g:else>

    <div class="alert-success h3" style="padding:5% "><b>${resource.topic.topicName}</b></div>

</g:else>
<g:each in="${resource}" var="res">
    <div class="panel panel-default" id="post${res.id}">
        <div class="panel-body">
            <div>
                <div class="col-xs-2">
                    <a href="/user/profile?userId=${res.createdBy.id}">       <ls:userImage user="${res.createdBy}"/></a>
                </div></div>


            <div class="col-xs-10">
                <div class="row" style="padding-bottom:5px">
                    <div class="col-xs-6">
                        <span class="h4">
                            <a href="/user/profile?userId=${res.createdBy.id}" style="text-decoration: none">     ${res.createdBy}</a>
                        </span>
                    </div>

                    <div class="col-xs-3">
                    </div>


                </div>

                <div class="row" style="padding-bottom:10px">
                    <div class="col-xs-4">
                        <span class="text-muted h5">@res.createdBy</span>
                    </div>

                    <div class=" text-muted h5" style="float: right">${res.dateCreated}</div>
                </div>

                <ls:resourcerater resourceId="${res.id}"/>
            </div>

            <p style="padding-bottom:5px">${res.description}</p>

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

                <div class="col-xs-4" class='readitem'><ls:read resource="${res}">
                </ls:read></div>
                <ls:canDeleteResource resource="${res}"><span
                        class="glyphicon glyphicon-trash col-xs-1 text-info"
                        onclick="deleteresource(${res.id})" style="cursor: pointer"></span>
                </ls:canDeleteResource>
                <ls:download resource="${res}"/>
                <ls:link resource="${res}"/>
            </div>
        </div>

    </div>
</g:each>
<g:if test="${!flag}">
    <g:paginate next="Forward" prev="Back"
                maxsteps="0" controller="resource"
                action="search" total="${resourcecount}" params="[q: q]"/>
</g:if>

</body>
</html>