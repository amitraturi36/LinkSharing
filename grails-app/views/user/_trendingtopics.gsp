<div style="margin-top: 30px">
<table class="table table-striped">
    <g:each in="${trendingtopics}" var="topic">
        <tr id="trndng${topic.id}">
            <td>
                <span class="h2 col-sm-12 text-info" style="text-align: center;margin-bottom: 5%">
                <span  onclick=" topicload(${topic.id})"
                       style="text-decoration: none;cursor: pointer">
                    <a href="#topic:${topic.id}">   ${topic.name}</a></span></span>
                <div style="margin-top:5% ">
                    <span class="col-sm-3"><a href="#profile:${topic.createdBy.id}" onclick="profileload( ${topic.createdBy.id})" style="cursor: pointer"><ls:userImage
                            user="${topic.createdBy}"/></a>
                    </span>
                    <span class="col-sm-8">
                        <a class="h3 " href="#profile:${topic.createdBy.id}" onclick=" profileload( ${topic.createdBy.id})" style="cursor: pointer;text-decoration: none"
                        >${topic.createdBy.name}</a>
                    </span>
                <div class="row col-sm-12">
                    <span class="col-sm-3"></span>
                   <span
                        class="text-muted col-sm-3">Subscriptions</span> <span class="text-muted col-sm-2">Post</span>
                </div>
                <div class="row col-sm-12">
                    <span class="col-sm-3"></span>
                    <span class="text-info col-sm-2 " style="margin-left: 5%"><ls:subscriptionCount topic="${topic.id}"/></span>
                    <span class="text-info col-sm-3"></span>
                    <span class="text-info " style="margin-left: -19%;"><ls:resourceCount topic="${topic.id}"/> </span>
                </div>
                    <br>
                <div class="row col-sm-12">
                    <br>
                    <span style="margin-left: 220px"><ls:subscription topics="${topic.id}"/> </span>
                    <span style=" padding-top:20px;float: right">
                        <span>  <ls:update topic="${topic.id}"/>
                        </span>
                        <span class="text-info" ><ls:candeletetopic topic="${topic.id}"/>
                        </span></span>
                    <div class=" col-sm-12"><br/><br/></div>
                </div></div></td>

        </tr>
    </g:each>

</table>
</div>