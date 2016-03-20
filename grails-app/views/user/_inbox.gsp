<%@ page contentType="text/html;charset=UTF-8" %>
<!-- Name Panel -->
<!-- ************************************************** -->


   <div id="inboxpanel">
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
                        <a href="/resource/show?id=${resource.id}&status=1"
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
</div>