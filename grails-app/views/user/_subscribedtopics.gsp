<%@ page import="com.intelligrape.linksharing.Subscription" %>

<div id="subscribedtopics" style="margin-top: 3%;">
    <div class="col-lg-12" id="messageanderrorblock" >

    </div>
           <div >
<table class="table table-striped">
        <g:each in="${subtopics}" var="topic">
            <tr id="user1${topic.id}">  <td>
                <span class="h2 col-sm-12 text-info" style="text-align: center;margin-bottom: 5%">
                    <span  onclick=" topicload(${topic.id})"
                       style="text-decoration: none;cursor: pointer">
                 <a href="#topic:${topic.id}">   ${topic.toString()}</a></span></span>

                <div  >
               <div style="margin-top:5% ">
                <span class="col-sm-3"><a href="#profile:${topic.createdBy.id}" onclick="profileload( ${topic.createdBy.id})" style="cursor: pointer"><ls:userImage
                        user="${topic.createdBy}"/></a>
                </span>
                <span class="col-sm-8">
                    <a class="h3 " href="#profile:${topic.createdBy.id}" onclick=" profileload( ${topic.createdBy.id})" style="cursor: pointer;text-decoration: none"
                       >${topic.createdBy.name}</a>
                          </span>

                <div class="col-sm-8" style="margin-top: 2%">
                  <span class="text-muted" >Subscriptions</span>
                    <span class="text-muted pull-right">Post</span>
                </div>
                   <div class="col-sm-8" style="margin-top: 2%">
                   <span  style="    margin-left: 8%;"><ls:subscriptionCount topic="${topic.id}"/></span>
                   <span  style="float: right; margin-right: 2%;">
                       <ls:resourceCount topic="${topic.id}"/>
                   </span>
                       </div>
               <div class="col-sm-9" style="margin-top: 2%">
                <span class="text-info "><ls:subscription topics="${topic.id}"/></span>
                   <div class="pull-right" style="margin-right:1%;">
                   <span ><ls:update topic="${topic.id}"/>
                   </span>
                   <span  class="text-info"><ls:candeletetopic topic="${topic.id}"/>
                   </span>
                   </div>
                   </div>

                <div class="col-sm-12" style="margin-top: 3%">
                    <span class="col-sm-3"></span>
                    <span class="col-sm-4">
                        <ls:seriousness topic="${topic.id}"/>
                    </span>

                    <span class="col-sm-4 pull-right">
                        <ls:visiblity topic="${topic.id}"/>
                    </span>


                </div>
                </div>
            </div>

</td></tr>
        </g:each>
   </table>
        %{--<g:paginate next="Forward" prev="Back"--}%
                    %{--maxsteps="0" controller="user"--}%
                    %{--action="index" total="${subtopicscount}"/>--}%
        <util:remotePaginate controller="topic" action="subTopic" total="${subtopicscount}"
                             update="subscribedtopics" max="20" />

    </div>
</div>
