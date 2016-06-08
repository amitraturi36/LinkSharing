
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:javascript src="application.js"/>
</head>

<body>
<g:if test="${resource || topic}">
    <div class="alert-success h3"
         style="padding:5% ">GLOBAL SEARCH RESULTS FOR TOPIC AND RESOURCES</div>
</g:if>
<g:else>
    <div class="alert-danger h3"
         style="padding:5% ">No Item Matched</div>
</g:else>
<div class="container">
    <div class="col-sm-6">
        <g:if test="${topic}">
            <div class="panel ">
                <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:black;color: white">

                    <span class="col-sm-9 h4 ">Topic Searched result</span>
                </div>

                <div class="panel-body col-sm-12" style="border:1px solid grey">
                    <g:each in="${topic}" var="topics">
                        <div id="user1${topics.id}">
                            <div class="col-sm-3" style="margin: 25px 0px;">
                               <ls:userImage user="${topics.createdBy}"/>
                            </div>
                            <span class="col-sm-5"></span>
                            <span>${topics}</span>

                            <span class="text-muted col-sm-4">${topics.createdBy.firstName}</span><span
                                class="text-muted col-sm-3">Subscriptions</span> <span class="text-muted col-sm-2">Post</span>
                            <span class="text-info col-sm-5"><ls:subscription topics="${topics.id}"/></span>
                            <span class="text-info col-sm-3">50</span>
                            <span class="text-info col-sm-2">30</span>
                            <span class="text-info col-sm-12"></span>
                        </div>

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

                            <div class="col-xs-3"></div>
                        </div>
                        <br/><br/>

                    </g:each>
                </div>

            </div>
        </g:if>

        <g:else>
            <div class="alert-warning h3" style="padding:20px">NO TOPIC FOUND</div>
        </g:else>
    </div>
    <div class="col-sm-6">
        <g:if test="${resource}">
            <div class="panel panel-default">

                <div class="panel-heading " style="color: white;background-color: black">
                    <span class="h4"> <h4>Post</h4></span>
                </div>
                <div class="panel-body">
                    <g:each in="${resource}">
                        <div class="col-sm-12">
                            <div class="col-sm-2" >
                                    <ls:userImage user="${it.createdBy}"/>
                            </div>

                            <div class="col-sm-8" style="margin-left: 55px">
                                <div class="row">
                                    <div class="col-sm-12">
                                          <span class="h5 col-sm-6">${it.createdBy.name}</span>

                                            ${it.topic}

                                    </div>
                                    <div class="col-xs-3">
                                        <small class="text-muted">@${it.createdBy.firstName}</small>
                                    </div>
                                </div>

                                <p>${it.description}</p>

                                <div class="row" style="padding-bottom:10px">
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

                                    <div class="col-xs-3"> </div>
                                </div>
                            </div>
                        </div>
                    </g:each>
                    <g:paginate next="Forward" prev="Back"
                                maxsteps="0" controller="topic"
                                action="search" total="${resourcecount}" params="[q:q]"/>
                </div></div>




        </g:if>
        <g:else>
            <div class="alert-warning h3" style="padding:20px">NO TOPIC FOUND</div>
        </g:else>
    </div>
</div>
</body>
</html>