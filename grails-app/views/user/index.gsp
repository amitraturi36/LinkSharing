<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    %{--<meta http-equiv="refresh" content="15">--}%
    <title></title>
</head>

<body>
<g:if test="${sec.loggedInUserInfo(field: 'id')}">

    <section id="main-content">
            <section class="wrapper" >

                <div class="col-lg-10" id="dashboardcontentbody" style="    margin-left: 9%;">
                    </div>

                    <div class="col-lg-12" id="dashboardcontentbody2" >
            <div class="col-sm-12 col-lg-12 " style="background: aliceblue;">
                <div class="row">

                    <div class="col-lg-9 main-chart " style="" >

                        <div class="row mtbox">
                            <div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                                <div class="box1">
                                    <span class="li_heart"></span>
                                <h3><ls:subscribedusers user="${user.id}"/></h3>
                            </div>
                            <p>you have total <ls:subscribedusers user="${user.id}"/> Subscriptions .</p>
                            </div>
                            <div class="col-md-2 col-sm-2 box0">
                                <div class="box1">
                                    <span class="li_world"></span>
                                    <h3>+<ls:createdByresourceCount user="${user.id}"/> </h3>
                                </div>
                                <p><ls:createdByresourceCount user="${user.id}"/>  Total Posts Are Uploaded To Your Topics.</p>
                            </div>
                            <div class="col-md-2 col-sm-2 box0">
                                <div class="box1">
                                    <span class="li_stack"></span>
                                    <h3><ls:besttopiccount user="${user.id}" /> </h3>
                                </div>
                                <p>Your Best Topic Have <ls:besttopiccount user="${user.id}" />Posts</p>
                            </div>
                            <div class="col-md-2 col-sm-2 box0">
                                <div class="box1">
                                    <span class="li_news"></span>
                                    <h3>+<ls:topicCount user="${user.id}"/> </h3>
                                </div>
                                <p>You Have Created <ls:topicCount user="${user.id}"/> topics .</p>
                            </div>
                            <div class="col-md-2 col-sm-2 box0">
                                <div class="box1">
                                    <span class="li_user"></span>
                                    <h3>+ <ls:subscriptionCount user="${user}"/> </h3>
                                </div>
                                <p><ls:subscriptionCount user="${user}"/> Users are SubScribed TO Your Topics</p>
                            </div>

                        </div><!-- /row mt -->


                        <div class="row mt" style="margin-left: 36px">
                            <!-- SERVER STATUS PANELS -->
                            <div class="col-md-4 col-sm-4 mb">
                                <div class="white-panel pn donut-chart">
                                    <div class="white-header">
                                        <h5>Top Topic</h5>
                                    </div>
                                    <span onclick=" topicload(${toptopic.id})"
                                          style="text-decoration: none;cursor: pointer"> <a href="#topic:${toptopic.id}" style="    text-decoration: none;"> ${toptopic.topicName} </a></span><br/>
                                    <span>Created By: <a href="#profile:${toptopic.createdBy.id}" onclick="profileload( ${toptopic.createdBy.id})" style="cursor: pointer;    text-decoration: none;"> ${toptopic.createdBy.name}</a></span>
                                    <div class="row" style="    margin-top: 4px;">
                                        <div class="col-sm-6 col-xs-6 goleft">
                                            <p><i class="fa fa-database"></i> <ls:resourceCount topic="${toptopic.id}"/>
                                                <span class="container col-sm-12 col-md-12" style="    margin-left: 30px;"> <a href="#profile:${toptopic.createdBy.id}" onclick="profileload( ${toptopic.createdBy.id})" style="cursor: pointer"><ls:userImage user="${toptopic.createdBy}"/></a></span>
                                            </p>
                                        </div>
                                    </div>


                                </div><! --/grey-panel -->
                            </div><!-- /col-md-4-->


                            <div class="col-md-4 col-sm-4 mb">
                                <div class="white-panel pn">
                                    <div class="white-header">
                                        <h5>TOP POST</h5>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-11 col-xs-11 goleft">
                                            <p><i class="fa fa-heart"></i> <ls:score resource="${topresource.id}"/> <span  style="float: right">${topresource.topic.topicName}</span></p>
                                        </div>
                                        <div class="col-sm-6 col-xs-6"></div>
                                    </div>
                                    <div class="centered">
                                        <span>Uploaded By: <a href="#profile:${topresource.createdBy.id}" onclick="profileload( ${topresource.createdBy.id})" style="cursor: pointer;    text-decoration: none;"> ${topresource.createdBy.name}</a></span>

                                    </div>
                                    <div class="centered" style="    margin-top: 10px;">
                                    <p style="    margin-top:1px;">
                                        <a href="#profile:${topresource.createdBy.id}" onclick="profileload( ${topresource.createdBy.id})" style="cursor: pointer;    text-decoration: none;">
                                            <ls:userImage
                                                    user="${topresource.createdBy}"/></a></p>

                                    </div>
                                </div>
                            </div><!-- /col-md-4 -->

                            <div class="col-md-4 mb">
                                <!-- WHITE PANEL - TOP USER -->
                                <div class="white-panel pn">
                                    <div class="white-header">
                                        <h5>TOP USER</h5>
                                    </div>
                                  <b><a href="#profile:${topuser.id}" onclick="profileload( ${topuser.id})" style="cursor: pointer;    text-decoration: none;">${topuser.name}</a></b></p>
                                    <div class="row" style="margin-top: -15px;">
                                        <div class="col-md-6">
                                            <p class="small mt">Topic Created</p>
                                            <p style="margin-top: -10px;"><ls:topicCount user="${topuser.id}"/></p>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="small mt">Post Uploaded</p>
                                            <p style="margin-top: -10px;"><ls:createdByresourceCount user="${topuser.id}"/> </p>
                                        </div>

                                    </div>
                        <p style="    margin-top:1px;">
                            <a href="#profile:${topuser.id}" onclick="profileload( ${topuser.id})" style="cursor: pointer;    text-decoration: none;">
                            <ls:userImage
                                user="${topuser}"/></a></p>
                        <p>
                                </div>
                            </div><!-- /col-md-4 -->


                        </div><!-- /row -->



                    </div><!-- /col-lg-9 END SECTION MIDDLE -->

        <div class="col-sm-6">
            <div class="col-sm-12">
            </div>

        </div>
    </div>

            %{--</div>--}%
                %{--</div>--}%


    </section>
    </section>



</g:if>

</body>
</html>