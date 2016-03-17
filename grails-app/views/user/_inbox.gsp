<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Name Panel -->
<!-- ************************************************** -->
<div class="panel ">
    <div class="panel-heading col-sm-12 "
         style="border: 1px solid grey;background-color: black;">
        <div class="row">
            <span class="h4" style="color:white">Inbox
                <g:form class="form-inline" style="float: right" name="inboxsearchform" url="/user/index">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="q" id="srch-inbox">

                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </g:form>
            </span>
        </div>
    </div>

    <div class="panel-body col-sm-12" style="border: 1px solid grey;">
        <g:if test="${!resources}">

            <span class="alert-warning">Inbox Is Empty</span>
            <span class="col-sm-12"></span>
        </g:if>
        <g:else>
            <g:each in="${resources}" var="resource">
                <div class="container col-sm-12">
                    <div class="row">
                        <div class="col-sm-3"><ls:userImage user="${resource.createdBy}"/>
                        </div>

                        <div class="col-sm-3 h5">${resource.createdBy}</div>

                        <div class="col-sm-4" style="float: right">
                            <a href="#" class="text-left">${resource.topic.topicName}</a>
                        </div>
                    </div>

                    <div class="row">
                        <span class="col-sm-3"></span>

                        <div class="col-sm-3">
                            <small class="text-muted">@${resource.createdBy.firstName}</small>
                        </div>

                        <div class="col-xs-6 text-muted">
                            <g:formatDate date="${resource.dateCreated}" type="datetime" style="MEDIUM"/></div>
                    </div>
                    <br/>

                    <div class="col-sm-10">
                        <p class="h5 right">${resource.description}</p>
                    </div>
                    <br/>

                    <div class="row col-sm-12">
                        <a href="http://www.facebook.com"><i class="fa fa-facebook "
                                                             style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.google.com"><i class="fa fa-google"
                                                           style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.twitter.com"><i class="fa fa-twitter"
                                                            style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <span style=" padding-top:20px;padding-right:20px;"><ls:download resource="${resource}"/>
                        </span>
                        <span style=" padding-top:20px;padding-right:20px;"><ls:link resource="${resource}"/>
                        </span>
                        <span style="font-size:20px; padding-top:20px;padding-right:20px;"><ls:read
                                resource="${resource}"/>
                        </span>
                        <a href="/resource/show?id=${resource.topic.id}"
                           style="float: right;padding-top:20px;padding-right:20px">View Post</a>
                    </div>
                </div>
                <br/><br/><br/><br/>

                <div class="col-sm-12" style="margin-top:20px;padding-top: 20px"></div>
                <br/><br/><br/><br/>
            </g:each>
        </g:else>
    </div>

</div>
