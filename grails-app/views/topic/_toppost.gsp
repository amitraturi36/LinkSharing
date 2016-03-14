<div>
    <div class="col-sm-12" style="padding:10px;margin:10px 0px">

    </div>

    <div style="padding:10px;margin:10px 0px">
        <div class="panel">
            <div class="panel-heading col-sm-12 " style="border: 1px solid grey; background:#f2f2f2;">Top Post
            </div>

            <div class="panel-body col-sm-12" style="border: 1px solid grey;">
                <g:each in="${list}" var="post">
                    <div class="col-sm-3" style="margin: 25px 0px;"><ls:userImage user="${post.createdBy}"/>
                    </div>

                    <div class="text-info" style="float: right">${post.name}</div>
                    <span class=" col-sm-6 " style="font-size: 15px;padding:20px 15px;">${post.createdBy}</span>
                    <span class=" col-sm-3 text-muted "
                          style="padding:20px 0px;">@${post.createdBy.firstName}</span>

                    <div class=" col-sm-12 row">
                        <a href="http://www.facebook.com"><i class="fa fa-facebook "
                                                             style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.google.com"><i class="fa fa-google"
                                                           style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.twitter.com"><i class="fa fa-twitter"
                                                            style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <ins><g:link url="/resource/show?id=${post.id}" class="text-info" style="float: right" >View post</g:link></ins>
                    </div>
                    <br/><br/> <br/><br/>
                </g:each>
            </div></div></div>

</div>