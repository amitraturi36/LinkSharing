<%@ page import="com.intelligrape.linksharing.Subscription" %>

<div class="panel  col-sm-9 ">
    <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;">

        <span class="col-sm-9">Subscriptions</span><a href="#" class="col-sm-3 "><ins>View all</ins></a>
    </div>

    <div class="panel-body col-sm-12" style="border:1px solid grey">
        <g:each in="${subtopics}" var="topic">
            <div id="user1${topic.id}">
                <div class="col-sm-3" style="margin: 25px 0px;"><span
                        class="glyphicon glyphicon-user " style="font-size:70px;"></span>
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

                    <span class=" row"><ls:update topic="${topic.id}"/><ls:candeletetopic topic="${topic.id}"/> </span>
                </div>
                <br/><br/>
            </div>
        </g:each>
        <g:paginate next="Forward" prev="Back"
                    maxsteps="0" controller="user"
                    action="profile" total="${subtopicscount}"/>
    </div>

</div>