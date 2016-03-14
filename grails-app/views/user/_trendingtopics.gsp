<div class="col-sm-12" style="padding-top: 30px"></div>
<div class="panel ">
    <div class="panel-heading col-sm-12 " style="border: 1px solid grey;background-color: black">

        <span class="col-sm-9" style="color:white"><h4>Trending Topics</h4></span><a href="#"
                                                                                       class="col-sm-3 "><ins><h4>View all</h4>
        </ins></a>
    </div>

    <div class="panel-body col-sm-12" style="border:1px solid grey">
        <g:each in="${list}" var="topic">
            <div id="trndng${topic.id}">
                <div class="col-sm-3"><ls:userImage user="${topic.createdBy}"/>
                </div>
                <div class="row">
                <span>${topic.createdBy}</span>
                <span style="float: right"><a href="/topic/show?id=${topic.id}"><ins>${topic.name}</ins></a></span>
                </div>
                <div class="row">
                    <span class="col-sm-3"></span>
                <span class="text-muted col-sm-4">${topic.createdBy.firstName}</span><span
                    class="text-muted col-sm-3">Subscriptions</span> <span class="text-muted col-sm-2">Post</span>
                    </div>
                <div class="row">
                    <span class="col-sm-3"></span>
                <span class="text-info col-sm-4"><ls:subscription topics="${topic.id}"/></span>
                <span class="text-info col-sm-2">${topic.count}</span>
                <span class="text-info " style="float: right">${Topic?.get(topic?.id)?.resources?.count}</span>
                </div>
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
                <span style="float: right; padding-top:20px">
                <span style="font-size:20px ;padding-right:20px;">  <ls:update topic="${topic.id}"/>
                </span>
                <span class="text-info" style="font-size:20px"><ls:candeletetopic topic="${topic.id}"/>
                </span>
                    </span>
            </div>
            <br/><br/>

        </g:each>

    </div>

</div>