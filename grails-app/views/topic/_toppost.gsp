


<div style="background-color: darkgrey" >
    <div class="table-responsive">
        <table class="table table-striped">

            <g:each in="${list}" var="post">
                <tr>  <td>
                    <span class="h2 col-sm-12 text-info" style="text-align: center;margin-bottom: 5%"> ${post.name}</span>

                    <div class="col-sm-2" >
                        <a href="/user/profile?userId=${post.createdBy.id}" style="text-decoration: none"><ls:userImage
                                user="${post.createdBy}"/></a>
                    </div>
                    <span class="col-sm-8"><span class="text-muted h4"><b>Created By:</b> </span>
                        <a  class="h3 " href="/user/profile?userId=${post.createdBy.id}" style="text-decoration: none;">  ${post.createdBy}</a></span>
                    <ins><g:link url="/resource/show?id=${post.id}" class="text-info h3"
                                 style="float: right; text-decoration: none">View All Post</g:link></ins>
                    <div class="col-sm-8 text-success" style="margin-top: 2%"> <p>${post.description}</p></div>
                    <div class=" col-sm-12 row" style="margin-left: 5px;text-align:center">
                        <a href="http://www.facebook.com"><i class="fa fa-facebook "
                                                             style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.google.com"><i class="fa fa-google"
                                                           style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>
                        <a href="http://www.twitter.com"><i class="fa fa-twitter"
                                                            style="font-size:20px; padding-top:20px;padding-right:20px;"></i>
                        </a>

                    </div>

                </td>  </tr>
            </g:each>
        </table>
    </div>
</div>
