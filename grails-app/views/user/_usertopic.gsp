<div class="panel">
    <div class="panel-heading col-sm-12 " style="border: 1px solid grey;background-color: black">

        <span class="col-sm-9" style="color:white"><h4>Topics Created</h4></span><a href="#"
                                                                                       class="col-sm-3 "><ins><h4></h4>
        </ins></a>
    </div>

    <div class="panel-body col-sm-12" style="border:1px solid grey">
        <g:each in="${usertopics}" var="topic">
            <div id="user1${topic.id}" class="container  col-sm-12">

                <span class="col-sm-3">
                    <a href="#profile" onclick="profileload( ${topic.createdBy.id})" style="cursor: pointer"> <ls:userImage user="${topic.createdBy}"/></a>
                </span>
                <span class="text-muted col-sm-8">
                    <a href="#profile:${topic.createdBy.id}" onclick="profileload( ${topic.createdBy.id})" style="cursor: pointer;text-decoration: none">  ${topic.createdBy.name}</a>
                    <span  style="float: right"><a href="#profile:${topic.createdBy.id}" onclick="profileload( ${topic.createdBy.id})" style="cursor: pointer;text-decoration: none">${topic.toString()}</a></span>
                    <span class="col-sm-12"></span></span>

                <div class="row" style="margin-top:10px;padding-top:20px  ">
                    <span class="text-muted col-sm-3">${topic.createdBy.firstName}</span><span
                        class="text-muted col-sm-3">Subscriptions</span>
                    <span class="text-muted col-sm-2">Post</span>
                </div>
                <span class="col-sm-3"></span>
                <span class="text-info col-sm-3"><ls:subscription topics="${topic.id}"/></span>
                <span class="text-info col-sm-3"><ls:subscriptionCount topic="${topic.id}"/></span>
                <span class="text-info col-sm-2"style="float: right">
                    <ls:resourceCount topic=" ${topic.id}"/>
                </span>
                <span class="text-info col-sm-12"></span>

                <div class="row">

                </div><br>

                <div class="row col-sm-12">
                    <span class="col-xs-4">
                        <ls:seriousness topic="${topic.id}"/>
                    </span>

                    <span class="col-xs-4">
                        <ls:visiblity topic="${topic.id}"/>
                    </span>

                    <span style=" padding-top:15px;"><ls:update topic="${topic.id}"/>
                    </span>
                    <span style=" padding-top:15px;" class="text-info"><ls:candeletetopic topic="${topic.id}"/>
                    </span>
                </div>
            </div>


            <br/><br/><br/><br/>
            <div class="col-sm-12" style="margin-top:20px;padding-top: 20px"></div>
            <br/><br/><br/><br/>

        </g:each>
        %{--<g:paginate next="Forward" prev="Back"--}%
                    %{--maxsteps="0" controller="user"--}%
                    %{--action="profile" total="${usertopicscount}" params="[userId: user.id]"/>--}%

    </div>

</div>