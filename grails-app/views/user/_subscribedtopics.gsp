<%@ page import="com.intelligrape.linksharing.Subscription" %>
<div class="panel  col-sm-9 ">
    <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;">

        <span class="col-sm-9">Subscriptions</span><a href="#" class="col-sm-3 "><ins>View all</ins></a>
    </div>
    <g:each in="${subtopics}" var="topic">
        <div class="panel-body col-sm-12" style="border:1px solid grey">
            <div class="col-sm-3" style="margin: 25px 0px;border: 1px solid grey;"><span
                    class="glyphicon glyphicon-user " style="font-size:70px;"></span>
            </div>
            <span class="col-sm-6"></span>
            <span class=" col-sm-3"><a href="/user/showSubscribedTopics?id=${topic.id} "><ins>${topic}</ins></a></span>
            <span class="text-muted col-sm-4">${topic.createdBy.firstName}</span><span
                class="text-muted col-sm-3">Subscriptions</span> <span class="text-muted col-sm-2">Post</span><span
                class="text-info col-sm-4">${Subscription.findByTopicAndUser(topic, session.user).seriousness}</span>
            <span class="text-info col-sm-3">50</span>
            <span class="text-info col-sm-2">30</span>
            <span class="text-info col-sm-12"></span>
            <select>
                <option>casual</option>
                <option>Serious</option>
                <option>Very Serious</option>

            </select>
            <select>
                <option>Private</option>
                <option>Edit</option>
                <option>Delete</option>
            </select>

            <span class="glyphicon glyphicon-envelope col-xs-1"></span>
            <span class="glyphicon glyphicon-pencil col-xs-1"></span>
            <span class="glyphicon glyphicon-trash col-xs-1"></span>

        </div>
    </g:each>
</div>