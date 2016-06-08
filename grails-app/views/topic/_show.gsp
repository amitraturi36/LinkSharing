
<div class="col-lg-12" style="    margin-left: -80px;
width: 120%;">

<g:if test="${sec.loggedInUserInfo(field:'id')}">

    <!-- Row 1 -->
    <!-- *************************************************** -->


            <div class="col-sm-12">
                <!-- Name Panel -->
                <!-- ************************************************** -->
                <div class="panel panel-default" style="margin-top: 40px">
                    <div class="panel-body">
                        <div>
                            <span class="text-left h2 col-xs-12 " style="text-align: center">${topic?.topicName}</span>
                            <div class="col-xs-2">
                                <a href="#profile:${topic.createdBy.id}" onclick="profileload( ${topic.createdBy.id})" style="cursor: pointer">  <ls:userImage user="${topic.createdBy}"/></a>
    </div>


    <div class="col-xs-10">
        <div class="row" style="padding-bottom:5px">

            <div class="col-sm-6">

            </div>
        </div>

        <div class="col-xs-6">
            <span class="h5"><b>Author:</b>  <a href="#profile:${topic.createdBy.id}" onclick="profileload( ${topic.createdBy.id})" style="cursor: pointer;text-decoration: none" >  ${topic?.createdBy}</a></span>
        </div>
</div>
                            <div class="col-sm-6">
        <div class="row" style="padding-bottom:10px; margin-top: 12px;">
            <div class="col-sm-4 text-info" >
                Subscribed Users
            </div>

            <div class="col-sm-2 text-info right">Post</div>

        </div>

        <span class="col-sm-4 right"><ls:subscriptionCount topic="${topic.id}"/></span>
        <span class="col-sm-1" style="float: left"><ls:resourceCount topic="${topic.id}"/></span>

        <div class="row" style="padding-bottom:15px">
            <div class="col-xs-8"></div>
        </div>
    </div>


    </div>

</div>
</div>
</div>




%{--________________________________________________________________________________________________________--}%

    <div class="col-sm-8">
        <!-- Topics Post Panel -->
        <!-- ************************************************ -->
        <div>

            <div>
                <div class="row" style="margin-left:5px;margin-right:5px  ">
                        <div class="input-group" >
                            <input type="text" class="form-control" onkeyup="postSearch()" placeholder="Search" name="q" id="srch_topic_post" style="    margin-top: -.515625px;
                            margin-left: -6px;
                            width: 101%;
                            height: 45px;
                            }
                             ">
                            <div class="input-group-btn">
                                <button class="btn btn-default form-control" onclick="postSearch()" style="     margin-top: -11px;
                                margin-right: -6px; height: 45px;"><i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                        </div><br/>
                        <input type="text" value="${topic?.id}" name="topicId" style="visibility: hidden ;" id="post-topicId">


                </div>
            </div>
            <div id="postwithintopic">
             <g:render template="post"/>
            </div></div></div>
    %{--User--}%
    <div class="col-sm-4">


        <div  style="       background-color: orange;
        padding: 2px;">

            <span style="color: aliceblue;" ><h3>Subscribed Users</h3></span><a href="#"
                                                                                class="col-sm-3 " style="text-decoration: none"><h4></h4>
        </a>
        </div>


        <table class="table table-striped" style="border:1px solid gainsboro ">

            <g:each in="${userList}">
                <tr><td>
                    <div class="col-sm-12"style="margin-bottom: 10%">
                        <div class="col-sm-3"><a href="#profile:${it}" onclick="profileload( ${it.id})" style="cursor: pointer"><ls:userImage user="${it}"/></a>
                        </div><br/>
                        <span class="h4"style="float: right"><a href="#profile:${it}" onclick="profileload( ${it.id})" style="cursor: pointer;text-decoration: none">${it.name}</a></span>
                    </div>
                </td></tr>
            </g:each>

        </table>

    </div>
</g:if>
</div>
