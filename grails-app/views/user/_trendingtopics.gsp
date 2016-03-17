<div class="col-sm-12" style="padding-top: 30px"></div>
<div class="panel ">
    <div class="panel-heading col-sm-12 " style="border: 1px solid grey;background-color: black">

        <span class="col-sm-9" style="color:white"><h4>Trending Topics</h4></span><a href="#"
                                                                                       class="col-sm-3 "><ins><h4></h4>
        </ins></a>
    </div>

    <div class="panel-body col-sm-12" style="border:1px solid grey">
        <g:each in="${list}" var="topic">
            <div id="trndng${topic.id}">
                <div class="col-sm-3"><a href="/user/profile?userId=${topic.createdBy.id}"><ls:userImage user="${topic.createdBy}"/></a>
                </div>
                <div class="row">
                <span class="col-sm-4">${topic.createdBy}</span>
                <span class="col-sm-4" style="float: right"><a href="/topic/show?id=${topic.id}"><ins>${topic.name}</ins></a></span>
                </div>
                <div class="row">
                    <span class="col-sm-3"></span>
                <span class="text-muted col-sm-4">${topic.createdBy.firstName}</span><span
                    class="text-muted col-sm-3">Subscriptions</span> <span class="text-muted col-sm-2">Post</span>
                    </div>
                <div class="row">
                    <span class="col-sm-6"></span>
                <span class="text-info col-sm-2 " style="margin-left: 15%"><ls:subscriptionCount topic="${topic.id}"/></span>
                <span class="text-info col-sm-3"></span>
                <span class="text-info " style="margin-left: 5%"><ls:resourceCount topic="${topic.id}"/> </span>
                </div>
            <div class="row col-sm-12">
                <a href="http://www.facebook.com" style="text-decoration: none"><i class="fa fa-facebook "
                                                     style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                </a>
                <a href="http://www.google.com" style="text-decoration: none"><i class="fa fa-google"
                                                   style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                </a>
                <a href="http://www.twitter.com" style="text-decoration: none"><i class="fa fa-twitter"
                                                    style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                </a>
                <span style="float: right; padding-top:20px">
                    <span><ls:subscription topics="${topic.id}"/> </span>
                <span>  <ls:update topic="${topic.id}"/>
                </span>
                <span class="text-info" ><ls:candeletetopic topic="${topic.id}"/>
                </span></span>
                   <div class=" col-sm-12"><br/><br/></div>
            </div>


        </g:each>

    </div>

</div>
</div>