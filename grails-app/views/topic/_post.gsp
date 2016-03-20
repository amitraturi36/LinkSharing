<div id="postwithintopic">
    <g:if test="${!resource}">
        <div class="alert-warning h3 col-">No Post Exist with this Search Criteria</div>
    </g:if>
    <g:else>
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
        </div>
        <div class="col-sm-12" style="margin-top:20px;padding-top: 20px"><br/></div>
    </div>
</g:each>
    </g:else>
</div>