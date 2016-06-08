<div style="    text-align: center; ">
    <ls:userImage user="${user}"/>
    <span class="text-muted col-sm-12 h4"><strong>${user.name}</strong>
    </span>
</div>

<div class="col-sm-12 col-lg-12" style="background: aliceblue;">
    <div class="row">

        <div class="col-lg-12 main-chart">

            <div class="row mtbox">
                <div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                    <div class="box1">
                        <span class="li_heart"></span>

                        <h3><ls:subscribedusers user="${user.id}"/></h3>
                    </div>

                    <p>${user.name} have total <ls:subscribedusers user="${user.id}"/> Subscriptions .</p>
                </div>

                <div class="col-md-2 col-sm-2 box0">
                    <div class="box1">
                        <span class="li_world"></span>

                        <h3>+<ls:createdByresourceCount user="${user.id}"/></h3>
                    </div>

                    <p>Total <ls:createdByresourceCount
                            user="${user.id}"/>  Posts Are Uploaded To ${user.name} Topics.</p>
                </div>

                <div class="col-md-2 col-sm-2 box0">
                    <div class="box1">
                        <span class="li_stack"></span>

                        <h3><ls:besttopiccount user="${user.id}"/></h3>
                    </div>

                    <p>${user.name} best topic have <ls:besttopiccount user="${user.id}"/> Posts</p>
                </div>

                <div class="col-md-2 col-sm-2 box0">
                    <div class="box1">
                        <span class="li_news"></span>

                        <h3>+<ls:topicCount user="${user.id}"/></h3>
                    </div>

                    <p>${user.name} have Created <ls:topicCount user="${user.id}"/> topics .</p>
                </div>

                <div class="col-md-2 col-sm-2 box0">
                    <div class="box1">
                        <span class="li_user"></span>

                        <h3>+<ls:subscriptionCount user="${user}"/></h3>
                    </div>

                    <p>+<ls:subscriptionCount user="${user}"/> Users are SubScribed TO ${user.name}'s Topics</p>

                </div>

            </div><!-- /row mt -->

        </div><!-- /col-lg-9 END SECTION MIDDLE -->
    </div>

</div>