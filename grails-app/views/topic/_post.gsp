<div id="postwithintopic">
    <g:if test="${!resource}">
        <div class="alert-warning h3 col-">No Post Exist with this Search Criteria</div>
    </g:if>
    <g:else>
        <table class="table table-striped" style="border:1px solid gainsboro;background: aliceblue;">
        <g:each in="${resource}">
            <tr><td>
    <div>
        <div class="col-xs-2">
            <a href="#profile:${topic.createdBy.id}" onclick="profileload( ${topic.createdBy.id})" style="cursor: pointer"><ls:userImage user="${it.createdBy}"/></a>
        </div>

        <div class="col-xs-8" style="margin-left: 60px">
            <div class="row">
                <div class="col-xs-6">
                    <span class="h4"><a href="#profile:${topic.createdBy.id}" onclick="profileload( ${topic.createdBy.id})" style="cursor: pointer;text-decoration: none;color: black">${it.createdBy}</a></span><br>
                    <small class="text-muted">@${it?.createdBy.firstName}</small>
                </div>
            </div>

            <p style="margin-left:0px">${it?.description}</p>

            <div class="row col-sm-12">
                <span class="col-sm-4" style=" padding-top:20px;padding-right:20px;"><ls:download resource="${it}"/>
                </span>
                <span class="col-sm-4" style=" padding-top:20px;padding-right:20px;"><ls:link resource="${it}"/>
                </span>
                <span onclick="resourceload(${it.id},1)"
                   style="float: right;padding-top:20px;padding-right:20px;cursor: pointer"><a href="#resource-${it.id}">View Post</a></span>
            </div>
        </div>
        <div class="col-sm-12" style="margin-top:20px;padding-top: 20px"><br/></div>
    </div></td></tr>
</g:each>
        </table>
    </g:else>
</div>