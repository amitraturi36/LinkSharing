<%@ page import="com.intelligrape.linksharing.Subscription" %>

<div class="panel  col-sm-9 ">
    <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;">

        <span class="col-sm-9">Subscriptions</span><a href="#" class="col-sm-3 "><ins>View all</ins></a>
    </div>

    <div class="panel-body col-sm-12" style="border:1px solid grey">
        <g:each in="${subtopics}" var="topic">
            <div id="user1${topic.id}">
                <div class="col-sm-3" style="margin: 25px 0px;"><ls:userImage user="${topic.createdBy}"/>
                </div>
                <span class="col-sm-5"></span>
                <span><a href="/topic/show?id=${topic.id}"><ins>${topic}</ins></a></span>

                <span class="text-muted col-sm-4">${topic.createdBy.firstName}</span><span
                    class="text-muted col-sm-3">Subscriptions</span> <span class="text-muted col-sm-2">Post</span>
                <span class="text-info col-sm-5"><ls:subscription topics="${topic.id}"/></span>
                <span class="text-info col-sm-3">50</span>
                <span class="text-info col-sm-2">30</span>
                <span class="text-info col-sm-12"></span>

                <div class="row">
                    <div class="col-xs-4">
                        <ls:seriousness topic="${topic.id}"/>
                    </div>

                    <div class="col-xs-4">
                        <ls:visiblity topic="${topic.id}"/>
                    </div>
                </div><br>

                <div class=" row"><ls:update topic="${topic.id}"/><ls:candeletetopic topic="${topic.id}"/></div>
            </div>

            <div class="row">
                <div class="col-xs-1 fa fa-facebook-official" style="font-size:20px"></div>

                <div class="col-xs-1 fa fa-twitter" style="font-size:20px"></div>

                <div class="col-xs-1 fa fa-google-plus" style="font-size:20px"></div>

                <div class="col-xs-6"></div>

                <div class="col-xs-3"><a href="/resource/show?id=${topic.id}">View Post</a></div>
            </div>
            <br/><br/>

        </g:each>
        <g:paginate next="Forward" prev="Back"
                    maxsteps="0" controller="user"
                    action="profile" total="${subtopicscount}"/>
    </div>

</div>