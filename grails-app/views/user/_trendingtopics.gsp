<div class="panel  col-sm-9 ">
    <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;">

        <span class="col-sm-9">Trending Topics</span><a href="#" class="col-sm-3 "><ins>View all</ins></a>
    </div>

    <div class="panel-body col-sm-12" style="border:1px solid grey">
        <g:each in="${list}" var="topic">
            <div id="trndng${topic.id}">
                <div class="col-sm-3" style="margin: 25px 0px;"><ls:userImage user="${topic.createdBy}"/>
                </div>
                <span class="col-sm-5"></span>
                <span><a href="/topic/show?id=${topic.id}"><ins>${topic.name}</ins></a></span>

                <span class="text-muted col-sm-4">${topic.createdBy.firstName}</span><span
                    class="text-muted col-sm-3">Subscriptions</span> <span class="text-muted col-sm-2">Post</span>
                <span class="text-info col-sm-5"><ls:subscription topics="${topic.id}"/></span>
                <span class="text-info col-sm-3">50</span>
                <span class="text-info col-sm-2">30</span>
                <span class="text-info col-sm-12"></span>
                <div class=" row"></div>
                <div class=" row" STYLE="float: right">
                    <ls:update topic="${topic.id}"/>
                    <ls:candeletetopic topic="${topic.id}"/> </div>
            </div>
            <div class="row">
                <div class="col-xs-1 fa fa-facebook-official" style="font-size:20px"></div>
                <div class="col-xs-1 fa fa-twitter" style="font-size:20px"></div>
                <div class="col-xs-1 fa fa-google-plus" style="font-size:20px"></div>
                <div class="col-xs-6"></div>
                <div class="col-xs-3"><a href="#">View Post</a></div>
            </div>
            <br/><br/>

        </g:each>

    </div>

</div>