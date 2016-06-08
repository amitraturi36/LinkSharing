<%@ page import="com.intelligrape.linksharing.Subscription" %>
<div id="subscribeduser" style="margin-top: 3%;"class="col-lg-12" >
    <div class="table-responsive">
        <table class="table table-striped">
            <g:each in="${subtopicusers}" var="topicuser">
                <tr id="user1${topicuser.id}">  <td>
                    <div class="col-lg-12" >
                        <div style="margin-top:5% ">
                            <span class="col-sm-3"><a href="#profile:${topicuser.id}" onclick="profileload( ${topicuser.id})" style="cursor: pointer"><ls:userImage
                                    user="${topicuser}"/></a>
                            </span>
                            <span class="col-sm-8">
                                <a class="h3 " href="#profile:${topicuser.id}" onclick=" profileload(${topicuser.id})"
                                   style="text-decoration: none">${topicuser.name}</a>
                            </span>

                            <div class="col-sm-8" style="margin-top: 2%">
                                <span class="text-muted" >Subscriptions</span>
                                <span class="text-muted pull-right">Post</span>
                            </div>
                            <div class="col-sm-8" style="margin-top: 2%">
                                <span  style="    margin-left: 8%;"><ls:topicCount user="${topicuser.id}"/></span>
                                <span  style="float: right; margin-right: 2%;">
                                  ${subscribedtopiccount}
                                </span>
                            </div>



                        </div>
                    </div>

                </td></tr>
            </g:each>
        </table>
        %{--<g:paginate next="Forward" prev="Back"--}%
                    %{--maxsteps="0" controller="user"--}%
                    %{--action="index" total="${topicusercount}"/>--}%
        <util:remotePaginate controller="user" action="index" total="${topicusercount}"
                             update="listTemplateDivId" max="20"/>

    </div>
</div>
